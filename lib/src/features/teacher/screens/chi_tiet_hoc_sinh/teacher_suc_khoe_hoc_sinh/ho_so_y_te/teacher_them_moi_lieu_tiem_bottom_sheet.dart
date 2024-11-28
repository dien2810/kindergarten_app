import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';

class TeacherThemMoiLieuTiemBottomSheet extends StatefulWidget {
  @override
  _TeacherThemMoiLieuTiemBottomSheetState createState() =>
      _TeacherThemMoiLieuTiemBottomSheetState();
}

class _TeacherThemMoiLieuTiemBottomSheetState
    extends State<TeacherThemMoiLieuTiemBottomSheet> {
  final TextEditingController _lieuLuongTiemController =
      TextEditingController();
  final TextEditingController _viTriTiemController = TextEditingController();
  final TextEditingController _nhaCungCapController = TextEditingController();
  final TextEditingController _tacDungPhuController = TextEditingController();
  final TextEditingController _lieuTiemTiepTheoController =
      TextEditingController();
  final TextEditingController _tienTrinhTiemChungController =
      TextEditingController();
  DateTime? _ngayTiem;

  @override
  void dispose() {
    _lieuLuongTiemController.dispose();
    _viTriTiemController.dispose();
    _nhaCungCapController.dispose();
    _tacDungPhuController.dispose();
    _lieuTiemTiepTheoController.dispose();
    _tienTrinhTiemChungController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _ngayTiem ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _ngayTiem) {
      setState(() {
        _ngayTiem = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        // Thêm SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: t30Size,
            ),
            Center(
              child: Text(
                "THÊM MỚI LIỀU TIÊM CHỦNG VACCINE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
            ),
            const SizedBox(height: 16),
        // Ngày tiêm
            const Text(
              "Ngày tiêm",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                width: double
                    .infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Căn giữa các phần tử
                  children: [
                    Text(
                      _ngayTiem == null
                          ? DateFormat('dd/MM/yyyy').format(DateTime.now())
                          : DateFormat('dd/MM/yyyy').format(_ngayTiem!),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(
                      Icons.calendar_today, // Biểu tượng lịch
                      color: Colors.grey, // Màu của biểu tượng
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Liều lượng tiêm
            _buildTextField("Liều lượng tiêm", _lieuLuongTiemController),
            const SizedBox(height: 16),

            // Vị trí tiêm
            _buildTextField("Vị trí tiêm", _viTriTiemController),
            const SizedBox(height: 16),

            // Nhà cung cấp
            _buildTextField("Nhà cung cấp", _nhaCungCapController,
                isExpanded: false),
            const SizedBox(height: 16),

            // Tác dụng phụ
            _buildTextField("Tác dụng phụ (nếu có)", _tacDungPhuController,
                isExpanded: false),
            const SizedBox(height: 16),

            // Liều tiêm tiếp theo
            const Text(
              "Liều tiêm tiếp theo (nếu có)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double
                  .infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E9F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  width: double
                      .infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2E9F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Căn giữa các phần tử
                    children: [
                      Text(
                        _ngayTiem == null
                            ? "Chọn ngày tiêm tiếp theo"
                            : DateFormat('dd/MM/yyyy').format(_ngayTiem!),
                        style: const TextStyle(
                            fontSize: 17, color: Color(0xFF7B7B7B)),
                      ),
                      const Icon(
                        Icons.calendar_today, // Biểu tượng lịch
                        color: Colors.grey, // Màu của biểu tượng
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tiến trình tiêm chủng
            _buildTextField(
                "Tiến trình tiêm chủng", _tienTrinhTiemChungController),
            const SizedBox(height: 24),

            // Nút Lưu và Hủy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                  onPressed: () {
                    // Xử lý lưu dữ liệu
                    print("Dữ liệu đã được lưu!");
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF99D98C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child:
                  const Text("Thêm mới", style: const TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý hủy
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA983),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child:
                  const Text("Hủy", style: const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isExpanded = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF580B8B),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF2E9F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Nhập $label",
              hintStyle: const TextStyle(
                color: Color(0xFF7B7B7B),
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
            minLines: isExpanded ? null : 1,
            maxLines: isExpanded ? null : 1,
          ),
        ),
      ],
    );
  }
}
