import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

List<CameraDescription> cameras = [];

class VideoGiamSatScreen extends StatefulWidget {
  @override
  _VideoGiamSatScreenState createState() => _VideoGiamSatScreenState();
}

class _VideoGiamSatScreenState extends State<VideoGiamSatScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _initCameras();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  Future<void> _initCameras() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      // Kiểm tra và yêu cầu quyền truy cập camera
      final cameraStatus = await Permission.camera.status;
      if (!cameraStatus.isGranted) {
        final result = await Permission.camera.request();
        if (result != PermissionStatus.granted) {
          setState(() {
            _hasPermission = false;
          });
          print('Quyền truy cập camera bị từ chối.');
          return;
        }
      }

      // Lấy danh sách camera
      cameras = await availableCameras();
      if (cameras.isEmpty) {
        print('Không tìm thấy camera nào.');
        setState(() {
          _hasPermission = false;
        });
        return;
      }

      setState(() {
        _hasPermission = true;
      });

      // Cấu hình camera đầu tiên
      final firstCamera = cameras.first;
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
        enableAudio: false, // Vô hiệu hóa âm thanh nếu không cần
      );
      _initializeControllerFuture = _controller!.initialize();
    } on CameraException catch (e) {
      print('Lỗi khởi tạo camera: ${e.description}');
      setState(() {
        _hasPermission = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 41.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 41.0),
          child: Text(
            'VIDEO GIÁM SÁT',
            style: TextStyle(
              color: Color(0xFFD74971),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: _hasPermission
          ? FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Lỗi khi khởi tạo camera: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
          : Center(child: Text('Vui lòng cấp quyền truy cập camera.')),
    );
  }
}
