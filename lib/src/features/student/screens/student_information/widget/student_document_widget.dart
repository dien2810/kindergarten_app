import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../../../constants/colors.dart';
import '../../../controllers/thong_tin_hoc_sinh/thong_tin_hoc_sinh_controller.dart';

class StudentDocumentWidget extends StatelessWidget {
  const StudentDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final thongTinHocSinhController = Get.put(ThongTinHocSinhController());
    return Padding(
      padding: EdgeInsets.all(t15Size),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDocumentField(tHoTenCha, thongTinHocSinhController.hoCha),
            _buildDocumentField(tHoTenMe, thongTinHocSinhController.hoMe),
            _buildDocumentField(tNgheNghiepCuaCha, thongTinHocSinhController.ngheCha),
            _buildDocumentField(tNgheNghiepCuaMe, thongTinHocSinhController.ngheMe),
            GestureDetector(
              onTap: () => thongTinHocSinhController.pickImage('photo4x6'),
              child: Obx(() {
                if (thongTinHocSinhController.hasPhoto4x6.value){
                  return _buildDocumentField(
                    tAnhHocSinh,
                    thongTinHocSinhController.anhHocSinh,
                    textColor: Colors.green, // Đổi màu thành xanh,
                    readOnly: true
                  );
                }
                else {
                  return _buildDocumentField(
                  tAnhHocSinh,
                  thongTinHocSinhController.anhHocSinh,
                  textColor: Colors.red,  // Đổi màu thành đỏ
                  readOnly: true
                );
                }
              } ),
            ),
            GestureDetector(
              onTap: () => thongTinHocSinhController.pickImage('birthCertificate'),
              child: Obx((){
                if (thongTinHocSinhController.hasBirthCertificate.value){
                  return _buildDocumentField(
                    tAnhGiayKhaiSinh,
                    thongTinHocSinhController.anhGiayKhaiSinh,
                    textColor: Colors.green,  // Đổi màu thành xanh
                    readOnly: true
                  );
                }
                else{
                  return _buildDocumentField(
                    tAnhGiayKhaiSinh,
                    thongTinHocSinhController.anhGiayKhaiSinh,
                    textColor: Colors.red,  // Đổi màu thành đỏ
                  );
                }
              } ),
            ),
            GestureDetector(
              onTap: () => thongTinHocSinhController.pickImage('householdRegistration'),
              child: Obx(() {
                if (thongTinHocSinhController.hasHouseholdRegistration.value){
                  return _buildDocumentField(
                    tAnhSoHoKhau,
                    thongTinHocSinhController.anhSoHoKhau,
                    textColor: Colors.green,  // Đổi màu thành xanh
                  );
                }
                else{
                  return _buildDocumentField(
                    tAnhSoHoKhau,
                    thongTinHocSinhController.anhSoHoKhau,
                    textColor: Colors.red,  // Đổi màu thành đỏ
                  );
                }
              } ),
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
                      await thongTinHocSinhController.updateHoSoGiayTo();
                    },
                    child: const Text(
                      tCapNhat,
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
      ),
    );
  }

  // Hàm để tạo khung cho từng dòng văn bản
  Widget _buildDocumentField(String text, TextEditingController textController,
      {Color textColor = const Color(0xFF505050), bool readOnly=false}) {  // Màu chữ mặc định là #505050
    return Container(
      width: double.infinity,  // Chiều rộng cố định
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),  // Khoảng cách giữa các container
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),  // Màu nền khung
        borderRadius: BorderRadius.circular(8),  // Bo góc cho container
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Color(0xFF505050), fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              readOnly: readOnly,
              controller: textController,
              decoration: const InputDecoration(
                  border: InputBorder.none
              ),
              style: TextStyle(fontSize: 16, color: textColor), // Màu chữ tùy chỉnh
            ),
          ),
        ],
      ),
    );
  }
}
