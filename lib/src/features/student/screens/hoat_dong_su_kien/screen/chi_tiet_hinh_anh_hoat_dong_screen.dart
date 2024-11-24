// Trang hình ảnh
import 'package:flutter/material.dart';

class HinhAnhScreen extends StatefulWidget {
  final List<String> images;

  HinhAnhScreen({super.key, required this.images});

  @override
  _HinhAnhScreenState createState() => _HinhAnhScreenState();
}

class _HinhAnhScreenState extends State<HinhAnhScreen> {
  // Function to create a TransformationController for each image
  TransformationController _getTransformationController(int index) {
    return TransformationController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 100.0,
        title: const Text('Hình Ảnh Hoạt Động',
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
                  child: Image.network(widget.images[index]), // Display image
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Zoom Out Button
                    IconButton(
                      icon: Icon(Icons.zoom_out),
                      onPressed: _zoomOut,
                      color: Colors.red,
                    ),
                    // Zoom In Button
                    IconButton(
                      icon: Icon(Icons.zoom_in),
                      onPressed: _zoomIn,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
