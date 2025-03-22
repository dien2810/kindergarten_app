import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/screens/chuyen_can/chuyen_can_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/health/thong_tin_suc_khoe_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/screen/hoat_dong_su_kien_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/screen/ngoai_khoa_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/remark/pages/comment_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/survey/pages/survey.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/thoi_hoc_hoan_phi_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/thuc_don_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/xin_nghi/xin_nghi_screen.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/text_strings.dart';
import 'hoc_sinh_navigation_widget.dart';
class HocSinhScreen extends StatelessWidget {
  const HocSinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GuardianAppBarWithTitleWidget(title: tHocSinh),
      body: Padding(
        padding: EdgeInsets.all(t10Size),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              tHoatDongHangNgay,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: t10Size,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tHoatDongSuKienImage,
                    title: tHoatDongVaSuKien,
                    onTap: (){
                      Get.to(()=>const HoatDongSuKienScreen());
                    }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tSucKhoeImage,
                    title: tSucKhoe,
                    onTap: (){
                      Get.to(()=>const ThongTinSucKhoeScreen());
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tChuyenCanImage,
                    title: tChuyenCan,
                    onTap: (){
                      Get.to(()=>const ChuyenCanScreen());
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tXinNghiImage,
                    title: tXinNghi,
                    onTap: (){
                      Get.to(()=>const XinNghiScreen());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: t10Size,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                      imageString: tNhanXetImage,
                      title: tNhanXet,
                      onTap: (){
                        Get.to(() =>  CommentsScreen());
                      }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tNgoaiKhoaImage,
                    title: tNgoaiKhoa,
                    onTap: (){
                      Get.to(()=>const NgoaiKhoaScreen());
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tDanThuocImage,
                    title: tDanThuoc,
                    onTap: (){
                      Get.to(()=>const DanThuocScreen());
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tThucDonImage,
                    title: tThucDon,
                    onTap: (){
                      Get.to(()=>const ThucDonScreen());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: t30Size),
            const Text(
              tDichVuHocDuong,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: t10Size,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                      imageString: tThoiHocHoanPhiImage,
                      title: tThoiHocHoanPhi,
                      onTap: (){
                        Get.to(()=>const ThoiHocHoanPhiScreen());
                      }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tHocPhiImage,
                    title: tHocPhi,
                    onTap: (){},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: HocSinhNavigationWidget(
                    imageString: tKhaoSatImage,
                    title: tKhaoSat,
                    onTap: (){
                      Get.to(const SurveyWidget());
                    },
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text('')
                ),
              ],
            ),
          ]
        ),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
    );
  }
}
