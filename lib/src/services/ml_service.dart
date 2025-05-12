import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as imglib;
import 'package:kindergarten_app/src/features/student/models/student_face/student_face.dart';
import 'package:kindergarten_app/src/repository/student_face_repository/student_face_repository.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'image_converter.dart';

class MLService {
  Interpreter? _interpreter;
  double threshold = 0.7;

  List _predictedData = [];
  List get predictedData => _predictedData;

  Future initialize() async {
    try {
      Delegate? delegate;
      if (Platform.isAndroid) {
        try {
          delegate = GpuDelegateV2(
            options: GpuDelegateOptionsV2(
              isPrecisionLossAllowed: false,
              inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
              inferencePriority1: TfLiteGpuInferencePriority.minLatency,
              inferencePriority2: TfLiteGpuInferencePriority.auto,
              inferencePriority3: TfLiteGpuInferencePriority.auto,
            ),
          );
        } catch (e) {
          print('GPU Delegate V2 failed, trying GpuDelegate: $e');
          try {
            delegate = GpuDelegate(
              options: GpuDelegateOptions(
                allowPrecisionLoss: false,
                waitType: TFLGpuDelegateWaitType.active,
              ),
            );
          } catch (e) {
            print('GpuDelegate failed, falling back to CPU: $e');
          }
        }
      } else if (Platform.isIOS) {
        delegate = GpuDelegate(
          options: GpuDelegateOptions(
            allowPrecisionLoss: true,
            waitType: TFLGpuDelegateWaitType.active,
          ),
        );
      }
      var interpreterOptions = InterpreterOptions();
      if (delegate != null) {
        interpreterOptions.addDelegate(delegate);
      }
      print("INITIAL INTERPRETTERRRRRRRR");
      _interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);
      print(_interpreter);
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  // Future initialize() async {
  //   late Delegate delegate;
  //   try {
  //     if (Platform.isAndroid) {
  //       print("INITIAL INTERPRETTERRRRRRRR");
  //       delegate = GpuDelegateV2(
  //         options: GpuDelegateOptionsV2(
  //           isPrecisionLossAllowed: false,
  //           inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
  //           inferencePriority1: TfLiteGpuInferencePriority.minLatency,
  //           inferencePriority2: TfLiteGpuInferencePriority.auto,
  //           inferencePriority3: TfLiteGpuInferencePriority.auto,
  //         ),
  //       );
  //     } else if (Platform.isIOS) {
  //       delegate = GpuDelegate(
  //         options: GpuDelegateOptions(
  //             allowPrecisionLoss: true,
  //             waitType: TFLGpuDelegateWaitType.active),
  //       );
  //     }
  //     var interpreterOptions = InterpreterOptions()..addDelegate(delegate);
  //     _interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
  //         options: interpreterOptions);
  //     print("SUCCESS INITIALIZE INTERPRETER");
  //     print(_interpreter);
  //   } catch (e) {
  //     print('Failed to load model.');
  //     print(e);
  //   }
  // }

  void setCurrentPrediction(CameraImage cameraImage, Face? face) {
    print("SET CURRENT PREDICTION");
    if (_interpreter == null) throw Exception('Interpreter is null');
    if (face == null) throw Exception('Face is null');
    List input = _preProcess(cameraImage, face);

    input = input.reshape([1, 112, 112, 3]);
    List output = List.generate(1, (index) => List.filled(192, 0));

    _interpreter?.run(input, output);
    output = output.reshape([192]);

    _predictedData = List.from(output);
    print("ABCCC");
    print(_predictedData);
  }

  Future<StudentFace?> predict() async {
    return _searchResult(_predictedData);
  }

  List _preProcess(CameraImage image, Face faceDetected) {
    imglib.Image croppedImage = _cropFace(image, faceDetected);
    imglib.Image img = imglib.copyResizeCropSquare(croppedImage, size: 112);
    print("IMAGETOBYTELIST");
    Float32List imageAsList = imageToByteListFloat32(img);
    return imageAsList;
  }

  imglib.Image _cropFace(CameraImage image, Face faceDetected) {
    imglib.Image convertedImage = _convertCameraImage(image);
    double x = faceDetected.boundingBox.left - 10.0;
    double y = faceDetected.boundingBox.top - 10.0;
    double w = faceDetected.boundingBox.width + 10.0;
    double h = faceDetected.boundingBox.height + 10.0;
    return imglib.copyCrop(
        convertedImage,
        x:x.round(),
        y: y.round(),
        width: w.round(),
        height: h.round()
    );
  }

  imglib.Image _convertCameraImage(CameraImage image) {
    var img = convertToImage(image);
    var img1 = imglib.copyRotate(img, angle: 000-90);
    return img1;
  }

  // this code is for image: ^3.0.2
  // Float32List imageToByteListFloat32(imglib.Image image) {
  //   var convertedBytes = Float32List(1 * 112 * 112 * 3);
  //   var buffer = Float32List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //
  //   for (var i = 0; i < 112; i++) {
  //     for (var j = 0; j < 112; j++) {
  //       var pixel = image.getPixel(j, i);
  //       buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
  //       buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
  //       buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
  //     }
  //   }
  //   return convertedBytes.buffer.asFloat32List();
  // }

  // image: 4.2.0
  Float32List imageToByteListFloat32(imglib.Image image) {
    var convertedBytes = Float32List(1 * 112 * 112 * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < 112; i++) {
      for (var j = 0; j < 112; j++) {
        var pixel = image.getPixel(j, i);
        // Extract RGBA components from pixel value
        // int r = (pixel >> 24) & 0xFF;
        // int g = (pixel >> 16) & 0xFF;
        // int b = (pixel >> 8) & 0xFF;
        int r = pixel.r.toInt();
        int g = pixel.g.toInt();
        int b = pixel.b.toInt();

        // Normalize and store pixel values
        buffer[pixelIndex++] = (r - 128) / 128.0;
        buffer[pixelIndex++] = (g - 128) / 128.0;
        buffer[pixelIndex++] = (b - 128) / 128.0;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  Future<StudentFace?> _searchResult(List predictedData) async {
    final studentFaceRepo = Get.put(StudentFaceRepository());
    List<StudentFace> studentFaces = await studentFaceRepo.getStudentFaceList();
    double minDist = 999;
    double currDist = 0.0;
    StudentFace? predictedResult;

    print('users.length=> ${studentFaces.length}');

    for (StudentFace u in studentFaces) {
      currDist = _euclideanDistance(u.modelData, predictedData);
      print("CURRDIST");
      print(currDist);
      if (currDist <= threshold && currDist < minDist) {
        minDist = currDist;
        predictedResult = u;
      }
    }
    return predictedResult;
  }

  double _euclideanDistance(List? e1, List? e2) {
    if (e1 == null || e2 == null) throw Exception("Null argument");

    double sum = 0.0;
    for (int i = 0; i < e1.length; i++) {
      sum += pow((e1[i] - e2[i]), 2);
    }
    return sqrt(sum);
  }

  void setPredictedData(value) {
    _predictedData = value;
  }
}