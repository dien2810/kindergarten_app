import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../controllers/thong_tin_suc_khoe_controller.dart';

class LoiKhuyenBacSiWidget extends StatelessWidget {
  const LoiKhuyenBacSiWidget({
    super.key,
    required this.controller,
  });

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            tLoiKhuyenBacSiHeader,
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),

          // Row chứa ảnh và nội dung dạng khung hội thoại
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh bên trái
              Image.asset(
                tLoiKhuyenBacSiItemImage1,
                width: 100,
                height: 150,
              ),
              const SizedBox(width: 20),

              // Nội dung với khung hội thoại
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Khung hội thoại
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tLoiKhuyenBacSiHeader,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Không phát hiện các bệnh lý nghiêm trọng liên quan đến mắt, tai, mũi, họng. Tuy nhiên, phụ huynh nên chú ý kiểm tra mắt của trẻ thường xuyên vì một số trẻ có thể gặp vấn đề về thị lực sau thời gian dài sử dụng thiết bị điện tử. Đồng thời, cần giữ vệ sinh tai và mũi của trẻ để tránh viêm nhiễm. Đặc biệt, nếu trẻ có triệu chứng đau tai, mũi nghẹt hoặc ho kéo dài, cần đưa trẻ đến khám ngay để tránh biến chứng.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tam giác cho khung hội thoại
                    Positioned(
                      bottom: -10,
                      left: 20,
                      child: CustomPaint(
                        painter: TrianglePainter(),
                        child: const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// CustomPainter để vẽ tam giác
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue[100]!;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}