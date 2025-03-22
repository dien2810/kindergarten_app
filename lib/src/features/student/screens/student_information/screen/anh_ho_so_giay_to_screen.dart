// Trang hình ảnh
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_tin_hoc_sinh/thong_tin_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class AnhHoSoGiayToScreen extends StatefulWidget {
  final List<String> images;
  final String type;

  const AnhHoSoGiayToScreen({super.key, required this.images, required this.type});

  @override
  _AnhHoSoGiayToScreenState createState() => _AnhHoSoGiayToScreenState();
}

class _AnhHoSoGiayToScreenState extends State<AnhHoSoGiayToScreen> {
  // Function to create a TransformationController for each image
  TransformationController _getTransformationController(int index) {
    return TransformationController();
  }
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  final thongTinHocSinhController = Get.put(ThongTinHocSinhController());

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100.0,
        title: const Text('Hình Ảnh',
          style: TextStyle(
            color: Color(0xFFD74971), // Set color to D74971
            fontSize: 26, // Increase font size
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          // Create a unique TransformationController for each image
          TransformationController transformationController = _getTransformationController(index);

          // Function to zoom in the current image
          void _zoomIn() {
            final matrix = transformationController.value;
            final zoomFactor = matrix.getMaxScaleOnAxis() * 1.2; // Zoom in by 20%
            transformationController.value = Matrix4.identity()..scale(zoomFactor);
          }

          // Function to zoom out the current image
          void _zoomOut() {
            final matrix = transformationController.value;
            final zoomFactor = matrix.getMaxScaleOnAxis() * 0.8; // Zoom out by 20%
            transformationController.value = Matrix4.identity()..scale(zoomFactor);
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Image with zoom controls
                InteractiveViewer(
                    transformationController: transformationController,
                    minScale: 0.1, // Minimum zoom level
                    maxScale: 5.0, // Maximum zoom level
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: _selectedImage == null
                          ? CloudImage(
                        publicId: widget.images[index],
                        fit: true,
                      )
                          : Image.file(
                        File(_selectedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  // child: Image.network(widget.images[index]), // Display image
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Zoom Out Button
                    IconButton(
                      icon: const Icon(Icons.zoom_out),
                      onPressed: _zoomOut,
                      color: Colors.red,
                    ),
                    // Zoom In Button
                    IconButton(
                      icon: const Icon(Icons.zoom_in),
                      onPressed: _zoomIn,
                      color: Colors.red,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: t10Size*20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF03045E),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent
                        ),
                        onPressed: () async {
                          if (_selectedImage != null){
                            if (widget.type == 'photo4x6'){
                              thongTinHocSinhController.anhHocSinh.text = await Helper.uploadImage(_selectedImage);
                            }
                            else if (widget.type == 'birthCertificate'){
                              thongTinHocSinhController.anhGiayKhaiSinh.text = await Helper.uploadImage(_selectedImage);
                            }
                            else if (widget.type == 'householdRegistration'){
                              thongTinHocSinhController.anhSoHoKhau.text = await Helper.uploadImage(_selectedImage);
                            }
                            await thongTinHocSinhController.updateHoSoGiayTo();
                          }
                        },
                        child: const Text(
                          'Lưu',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Outfit",
                              color: tWhiteColor
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
