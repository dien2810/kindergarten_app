import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/dan_thuoc/them_moi_dan_thuoc_controller.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../../../common_widgets/information_input_widget/information_input_with_icon_widget.dart';

class ThemMoiDanThuocBottomSheet{
  static Future buildShowModalBottomSheet(BuildContext context) {
    final themMoiDanThuocConTroller = Get.put(ThemMoiDanThuocController());
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid
          ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
            ),
        ),
        builder: (context) {

          return FutureBuilder(
            future: themMoiDanThuocConTroller.reset(),
            builder: (context, snapshot)=>SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(t10Size),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tThemMoiDanThuoc,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Color(0xFF03045E)
                        ),
                      ),
                      SizedBox(height: t10Size),
                      InformationInputWithIconWidget(
                        textEdittingController: themMoiDanThuocConTroller.prescription,
                        color: const Color(0xFFE9EFF7),
                        title: tDonThuoc,
                        hintText: '',
                      ),
                      SizedBox(height: t10Size),
                      InformationInputWithIconWidget(
                        textEdittingController: themMoiDanThuocConTroller.note,
                        color: const Color(0xFFE9EFF7),
                        title: tGhiChu,
                        hintText: '',
                      ),
                      SizedBox(height: t10Size),
                      InformationInputWithIconWidget(
                        color: const Color(0xFFE9EFF7),
                        title: tNgayNhanThuoc,
                        hintText: themMoiDanThuocConTroller.createDate,
                        readOnly: true,
                      ),
                      SizedBox(height: t10Size),
                      InformationInputWithIconWidget(
                        color: const Color(0xFFE9EFF7),
                        title: tHoVaTenPhuHuynhDanThuoc,
                        hintText: themMoiDanThuocConTroller.hoVaTenPhuHuynhDanThuoc.text,
                        readOnly: true,
                      ),
                      SizedBox(height: t10Size),
                      InformationInputWithIconWidget(
                        color: const Color(0xFFE9EFF7),
                        title: tNguoiNhanDonThuoc,
                        hintText: themMoiDanThuocConTroller.lop.text,
                        readOnly: true,
                      ),
                      SizedBox(height: t5Size),
                      const Spacer(flex: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2058E9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            onPressed: () {
                              if (themMoiDanThuocConTroller.prescription.text.trim() == "" ||
                              themMoiDanThuocConTroller.note.text.trim() == ""){
                                Helper.errorSnackBar(
                                  title: 'Thêm mới thất bại',
                                  message: 'Đơn thuốc và ghi chú không được để trống'
                                );
                                return;
                              }
                              final accountRepo = Get.put(AccountRepository());
                              final medicine = MedicineModel(
                                prescription: themMoiDanThuocConTroller.prescription.text,
                                note: themMoiDanThuocConTroller.note.text,
                                createDate: themMoiDanThuocConTroller.createDate,
                                status: tDaGui,
                                sentGuardian: themMoiDanThuocConTroller.hoVaTenPhuHuynhDanThuoc.text,
                                receivedPerson: themMoiDanThuocConTroller.lop.text,
                                studentID: accountRepo.userId,
                              );
                              themMoiDanThuocConTroller.addMedicine(medicine);
                            },
                            child: const Text(
                              tThemMoi,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(width: t5Size),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6BC5FF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            child: const Text(
                              tHuy,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          );
        }
    );
  }
}

