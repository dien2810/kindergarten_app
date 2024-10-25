import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../common_widgets/information_input_widget/information_input_with_icon_widget.dart';

class ThemMoiDanThuocBottomSheet{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid
          ),
            borderRadius: BorderRadius.circular(20.0),

        ),
        builder: (context)=>SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(t10Size),
              height: MediaQuery.of(context).size.height*0.7,
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
                  //const SizedBox(height: t10Size),
                  const InformationInputWithIconWidget(
                    color: Color(0xFFE9EFF7),
                    title: tDonThuoc,
                    hintText: tThuocViemHongCap,
                  ),
                  const SizedBox(height: t5Size),
                  const InformationInputWithIconWidget(
                    color: Color(0xFFE9EFF7),
                    title: tGhiChu,
                    hintText: tCanUongNhieuNuoc,
                  ),
                  const SizedBox(height: t5Size),
                  InformationInputWithIconWidget(
                    color: const Color(0xFFE9EFF7),
                    title: tNgayUong,
                    hintText: tTuNgayDenNgay,
                    widget: IconButton(
                      onPressed: (){},
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
                  const Text(
                    tThuocSo,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold
                    ),
                  ),
                  const InformationInputWithIconWidget(
                    color: Color(0xFFE9EFF7),
                    title: tTenThuoc,
                    hintText: 'Paracetamol',
                  ),
                  const SizedBox(height: t5Size),
                  const InformationInputWithIconWidget(
                    color: Color(0xFFE9EFF7),
                    title: tLieuLuong,
                    hintText: tLanTrenNgay,
                  ),
                  const SizedBox(height: t5Size),
                  const InformationInputWithIconWidget(
                    color: Color(0xFFE9EFF7),
                    title: tThoiGian,
                    hintText: 'Thoi gian',
                  ),
                  const SizedBox(height: t5Size),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2058E9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onPressed: (){},
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
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}

