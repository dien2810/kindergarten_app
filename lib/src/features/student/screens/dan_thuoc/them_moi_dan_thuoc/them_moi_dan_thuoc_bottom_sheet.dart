import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/dan_thuoc/them_moi_dan_thuoc_controller.dart';
import 'package:kindergarten_app/src/features/student/controllers/date_picker_controller.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';

import '../../../../../common_widgets/information_input_widget/information_input_with_icon_widget.dart';

class ThemMoiDanThuocBottomSheet{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    final themMoiDanThuocConTroller = Get.put(ThemMoiDanThuocController());
    themMoiDanThuocConTroller.reset();
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
          return SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(t10Size),
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
                    const SizedBox(height: t10Size),
                    InformationInputWithIconWidget(
                      textEdittingController: themMoiDanThuocConTroller.prescription,
                      color: const Color(0xFFE9EFF7),
                      title: tDonThuoc,
                      hintText: '',
                    ),
                    const SizedBox(height: t5Size),
                    InformationInputWithIconWidget(
                      textEdittingController: themMoiDanThuocConTroller.note,
                      color: const Color(0xFFE9EFF7),
                      title: tGhiChu,
                      hintText: '',
                    ),
                    const SizedBox(height: t5Size),
                    InformationInputWithIconWidget(
                      textEdittingController: themMoiDanThuocConTroller.startDate,
                      color: const Color(0xFFE9EFF7),
                      title: tNgayBatDau,
                      hintText: '',
                      widget: IconButton(
                        onPressed: () async{
                          final dateController = Get.put(DateController());
                          await dateController.selectDate(context);
                          themMoiDanThuocConTroller.startDate.text
                            =dateController.selectedDate.value;
                        },
                        icon: const Icon(Icons.calendar_today_outlined),
                        style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFF94D7F4)
                        ),
                      ),
                    ),
                    InformationInputWithIconWidget(
                      textEdittingController: themMoiDanThuocConTroller.endDate,
                      color: const Color(0xFFE9EFF7),
                      title: tNgayKetThuc,
                      hintText: '',
                      widget: IconButton(
                        onPressed: () async{
                          final dateController = Get.put(DateController());
                          await dateController.selectDate(context);
                          themMoiDanThuocConTroller.endDate.text
                          =dateController.selectedDate.value;
                        },
                        icon: const Icon(Icons.calendar_today_outlined),
                        style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFF94D7F4)
                        ),
                      ),
                    ),
                    const Text(
                      tThongTinThuocVaCachSuDung,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold
                      ),
                    ),
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
                            themMoiDanThuocConTroller.addCloneableWidget();
                          },
                          child: const Text(
                            tThemThuoc,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(width: t5Size),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6BC5FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed: () {
                            themMoiDanThuocConTroller.removeCloneableWidget();
                          },
                          child: const Text(
                            'Xóa thuốc',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(()=> Expanded(
                      flex: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: themMoiDanThuocConTroller.listThuocWidget.length,
                        itemBuilder: (context, index) {
                          return themMoiDanThuocConTroller.listThuocWidget[index];
                        },
                      ),
                    )),
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
                            final medicine = MedicineModel(
                              prescription: themMoiDanThuocConTroller.prescription.text,
                              note: themMoiDanThuocConTroller.prescription.text,
                              dates: [
                                themMoiDanThuocConTroller.startDate.text,
                                themMoiDanThuocConTroller.endDate.text
                              ],
                              status: tDaGui,
                              medicineDetails: themMoiDanThuocConTroller.listChiTietDonThuoc,
                              studentID: 'student_id_1',
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
                        const SizedBox(width: t5Size),
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
          );
        }
    );
  }
}

