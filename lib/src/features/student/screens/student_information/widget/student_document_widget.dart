import 'package:flutter/material.dart';

class StudentDocumentWidget extends StatelessWidget {
  final String hoTen;
  final String maHocSinh;
  final String ngaySinh;
  final String gioiTinh;
  final String truong;
  final String he;
  final String khoi;
  final String lop;

  const StudentDocumentWidget({
    Key? key,
    required this.hoTen,
    required this.maHocSinh,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.truong,
    required this.he,
    required this.khoi,
    required this.lop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInfoTile("Họ tên", hoTen),
        const SizedBox(height: 10),
        _buildInfoTile("Mã học sinh", maHocSinh),
        const SizedBox(height: 10),
        _buildInfoTile("Ngày sinh", ngaySinh),
        const SizedBox(height: 10),
        _buildInfoTile("Giới tính", gioiTinh),
        const SizedBox(height: 10),
        _buildInfoTile("Trường", truong),
        const SizedBox(height: 10),
        _buildInfoTile("Hệ", he),
        const SizedBox(height: 10),
        _buildInfoTile("Khối", khoi),
        const SizedBox(height: 10),
        _buildInfoTile("Lớp", lop),
      ],
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
