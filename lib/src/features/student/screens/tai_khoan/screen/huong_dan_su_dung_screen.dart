import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HuongDanSuDungScreen extends StatelessWidget {
  final Uri _url = Uri.parse("https://drive.google.com/file/d/19LBa9c6pxV5DObq-Z3z9lhhfVcTE12s0/view");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Hướng Dẫn Sử Dụng",
            style: TextStyle(
              color: Color(0xFFF9BD3A),
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("1. Giới thiệu hệ thống: "),
            _buildSectionContent(
              "Hệ thống giáo dục trẻ là một nền tảng giúp phụ huynh và giáo viên dễ dàng quản lý, theo dõi sự phát triển và các hoạt động học tập của trẻ. "
                  "Hệ thống cung cấp công cụ để ghi lại, phân tích tiến độ học tập, lịch sử sức khỏe, và hỗ trợ thông tin giữa phụ huynh và nhà trường.",
            ),
            _buildSectionTitle("2. Đăng nhập và tạo tài khoản: "),
            _buildSectionContent(
                  "Đăng ký tài khoản: Phụ huynh và giáo viên có thể tạo tài khoản bằng cách nhập các thông tin cơ bản như họ tên, địa chỉ email, và tạo mật khẩu.\n\n"
                  "Đăng nhập: Sau khi đăng ký, người dùng có thể đăng nhập vào hệ thống bằng email và mật khẩu đã đăng ký.",
            ),
            _buildSectionTitle("3. Quản lý hồ sơ trẻ: "),
            _buildSectionContent(
                  "Thêm hồ sơ trẻ: Người dùng có thể tạo hồ sơ riêng cho từng trẻ, bao gồm các thông tin cá nhân như họ tên, ngày sinh, và hình ảnh đại diện.\n\n"
                  "Cập nhật thông tin: Cho phép cập nhật thông tin sức khỏe, lịch sử tiêm chủng, và các ghi chú quan trọng khác.\n\n"
                  "Lịch sử học tập: Lưu lại tiến độ học tập, đánh giá từ giáo viên, và thành tích học tập.",
            ),
            _buildSectionTitle("4. Theo dõi tiến độ học tập"),
            _buildSectionContent(
              "Lịch học và bài tập: Cung cấp thông tin về lịch học, bài tập và các nhiệm vụ cần hoàn thành cho từng trẻ.\n\n"
                  "Báo cáo định kỳ: Hệ thống tạo báo cáo tiến độ theo từng tuần hoặc từng tháng để phụ huynh và giáo viên có cái nhìn tổng quát về sự phát triển của trẻ.",
            ),
            _buildSectionTitle("5. Liên lạc với giáo viên"),
            _buildSectionContent(
              "Nhắn tin: Hệ thống tích hợp tính năng nhắn tin giữa phụ huynh và giáo viên, giúp trao đổi thông tin nhanh chóng và thuận tiện.\n\n"
                  "Thông báo quan trọng: Giáo viên có thể gửi thông báo về các sự kiện, cuộc họp phụ huynh hoặc các vấn đề khẩn cấp liên quan đến trẻ.",
            ),
            _buildSectionTitle("6. Quản lý sức khỏe và an toàn"),
            _buildSectionContent(
              "Theo dõi sức khỏe: Lưu giữ thông tin về sức khỏe của trẻ, bao gồm chiều cao, cân nặng, lịch sử bệnh, và các lưu ý đặc biệt.\n\n"
                  "Lịch sử tiêm chủng: Hệ thống giúp theo dõi lịch sử tiêm chủng và nhắc nhở các mũi tiêm sắp đến hạn.\n\n"
                  "Các thông tin an toàn: Bao gồm thông tin liên lạc khẩn cấp, những lưu ý an toàn đặc biệt của trẻ trong quá trình học tập và tham gia các hoạt động.",
            ),
            _buildSectionTitle("7. Hướng dẫn truy cập file hướng dẫn chi tiết"),
            _buildSectionContent(
              "Để biết thêm chi tiết về cách sử dụng toàn bộ các tính năng trong hệ thống, vui lòng bấm vào nút bên dưới để tải xuống file hướng dẫn chi tiết. "
                  "Tài liệu này sẽ cung cấp từng bước thao tác chi tiết và hình ảnh minh họa để hỗ trợ bạn sử dụng hệ thống một cách hiệu quả nhất.",
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => _launchURL(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B2384), // Màu nền nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Text(
                    "Xem hướng dẫn chi tiết",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse("https://drive.google.com/file/d/19LBa9c6pxV5DObq-Z3z9lhhfVcTE12s0/view");
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

}