import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/common_widgets/button_widget/custom_button_widget.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thoi_hoc_hoan_phi/them_thoi_hoc_hoan_phi_controller.dart';

import '../../../../../constants/sizes.dart';

class ThemThoiHocHoanPhiScreen extends StatelessWidget {
  const ThemThoiHocHoanPhiScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themThoiHocHoanPhiController = Get.put(ThemThoiHocHoanPhiController());
    return Scaffold(
      appBar: const GuardianAppBarWithTitleWidget(title: tThoiHocVaHoanPhi),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(t15Size),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                      border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          tNhungThongTinDuoiDay
                        ),
                        const SizedBox(height: t10Size,),
                        const Text(
                          tThongTinYeuCau,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF7B7B7B),
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        Obx(()=>DropdownButtonFormField(
                            value: themThoiHocHoanPhiController.selectedValDropdown.value,
                            items: themThoiHocHoanPhiController.formTypeList.map(
                                (e)=>DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Inter'
                                    ),
                                  )
                                )
                            ).toList(),
                            onChanged: (val){
                              themThoiHocHoanPhiController.selectedValDropdown.value = val as String;
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color(0xFF0B2384),
                            ),
                          dropdownColor: const Color(0xFFE9EFF7),
                          decoration: const InputDecoration(
                            fillColor: Color(0xFFE9EFF7),
                            filled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none
                            )
                          )
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        Obx((){
                          themThoiHocHoanPhiController.reset();
                          if (themThoiHocHoanPhiController.selectedValDropdown.value == tYeuCauThoiHoc){
                            return Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(t10Size),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE9EFF7),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          tLyDoThoiHoc,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF7B7B7B),
                                              fontSize: 16
                                          ),
                                        ),
                                        TextFormField(
                                          controller: themThoiHocHoanPhiController.reason,
                                          maxLines: null,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none
                                              ),
                                              hintText: tChuyenTruong,
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                              )
                                          ),
                                        )
                                      ],
        
                                    )
                                ),
                                const SizedBox(height: t10Size,),
                                Container(
                                    padding: const EdgeInsets.all(t10Size),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE9EFF7),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          tTruongChuyenDen,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF7B7B7B),
                                              fontSize: 16
                                          ),
                                        ),
                                        TextFormField(
                                          controller: themThoiHocHoanPhiController.truongChuyenDen,
                                          maxLines: null,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none
                                              ),
                                              hintText: 'Truong mam non...',
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                              )
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            );
                          }
                          return Container(
                              padding: const EdgeInsets.all(t10Size),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFE9EFF7),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    tLyDo,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF7B7B7B),
                                        fontSize: 16
                                    ),
                                  ),
                                  TextFormField(
                                    controller: themThoiHocHoanPhiController.reason,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        hintText: 'Nhập lý do',
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                        )
                                    ),
                                  )
                                ],
        
                              )
                          );
                        }),
                        const SizedBox(height: t10Size,),
                        const Text(
                          tThongTinHocSinh,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF7B7B7B),
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        const FieldValueWidget(
                          color: Color(0xFFE4E4E4),
                          label: tHoVaTen,
                          value: 'Nguyen Thi Hai Vy'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tMaHocSinh,
                            value: '2111001'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tLop,
                            value: 'Pool 1'
                        ),
                        const SizedBox(height: t10Size,),
                        const Text(
                          tThongTinPhuHuynh,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF7B7B7B),
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tHoVaTen,
                            value: 'Hoang Van Thai'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tSoDienThoai,
                            value: '0862215568'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tDiaChi,
                            value: '0862215568'
                        ),
                        const SizedBox(height: t10Size,),
                        const Text(
                          tThongTinTaiKhoanNganHang,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF7B7B7B),
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tSoTaiKhoan,
                            value: '0123456789123'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tChuTaiKhoan,
                            value: 'HOANG VAN THAI'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tNganHang,
                            value: 'NH TMCP KY THUONG VN-310-TECHCOMBANK'
                        ),
                        const SizedBox(height: t5Size,),
                        const FieldValueWidget(
                            color: Color(0xFFE4E4E4),
                            label: tChiNhanh,
                            value: 'HA NOI'
                        ),
                        const SizedBox(height: t10Size,),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Inter'
                            ),
                            text: tQuyPhuHuynhVuiLong,
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16
                                ),
                                text: tTaiDay,
                              )
                            ]
                          ),
                        ),
                        const SizedBox(height: t10Size,),
                        CustomButtonWidget(
                          width: double.infinity,
                          color: const Color(0xFFF6A800),
                          text: 'Gửi',
                          onPressed: (){}
                        )
                      ],
                    ),
                  ),
                  
                ),
              ),
            ),
            const SizedBox(height: t15Size),
          ],
        ),
      ),
    );
  }
}

class FieldValueWidget extends StatelessWidget {
  const FieldValueWidget({
    super.key, required this.label, required this.value, required this.color,
  });
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(t5Size),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7B7B7B),
              fontFamily: 'Inter'
            ),
          ),
          const SizedBox(height: t5Size,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: t5Size),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7B7B7B),
                fontFamily: 'Inter'
              ),
            ),
          )
        ],
      ),

    );
  }
}
