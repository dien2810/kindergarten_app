// Trang hình ảnh
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_tin_hoc_sinh/thong_tin_hoc_sinh_controller.dart';

import '../../../controllers/hoat_dong_su_kien/hoat_dong_su_kien_controller.dart';

class HinhAnhScreen extends StatelessWidget {
  final List<String> images;
  final String screenType;

  const HinhAnhScreen({super.key, required this.images, required this.screenType});

  TransformationController _getTransformationController(int index) {
    return TransformationController();
  }

  @override
  Widget build(BuildContext context) {
    final controller;
    if (screenType == tThongTinHocSinh){
      controller = Get.put(ThongTinHocSinhController());
    }
    else{
      controller = Get.put(HoatDongSuKienController());
    }
    controller.images.value = images;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100.0,
        title: const Text(tHinhAnh,
        style: TextStyle(
          color: Color(0xFFD74971), // Set color to D74971
          fontSize: 26, // Increase font size
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      ),
      body: Obx(() {
          return ListView.builder(
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              // Create a unique TransformationController for each image
              TransformationController transformationController = _getTransformationController(index);

              // Function to zoom in the current image
              void zoomIn() {
                final matrix = transformationController.value;
                final zoomFactor = matrix.getMaxScaleOnAxis() * 1.2; // Zoom in by 20%
                transformationController.value = Matrix4.identity()..scale(zoomFactor);
              }

              // Function to zoom out the current image
              void zoomOut() {
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
                      child: CloudImage(publicId: controller.images[index])
                      // child: Image.network(widget.images[index]), // Display image
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Zoom Out Button
                        IconButton(
                          icon: const Icon(Icons.zoom_out),
                          onPressed: zoomOut,
                          color: Colors.red,
                        ),
                        // Zoom In Button
                        IconButton(
                          icon: const Icon(Icons.zoom_in),
                          onPressed: zoomIn,
                          color: Colors.red,
                        ),
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () {
                            controller.downloadImage(controller.images[index]);
                          }, // Gọi hàm tải ảnh
                          color: Colors.blue, // Màu khác để phân biệt
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }
}
