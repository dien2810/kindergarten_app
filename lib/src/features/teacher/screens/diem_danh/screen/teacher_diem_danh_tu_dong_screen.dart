import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_dang_ki_khuon_mat_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_nhan_dien_khuon_mat_screen.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/diem_danh/teacher_diem_danh_tu_dong_controller.dart';

class TeacherDiemDanhTuDongScreen extends StatelessWidget {
  const TeacherDiemDanhTuDongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final diemDanhTuDongController = Get.put(TeacherDiemDanhTuDongController());
    final teacherDiemDanhController = Get.put(TeacherDiemDanhController());
    print("RESULT:");
    print(teacherDiemDanhController.result);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Obx((){
        final loading = diemDanhTuDongController.loading.value;
        if (loading){
          return const Center(
            child: CircularProgressIndicator()
          );
        }
        return SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Image(image: AssetImage('assets/images/face_detection_images/logo.png')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: const Column(
                      children: [
                        Text(
                          tChungThucKhuonMat,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          tDiemDanhBangNhanDienKhuonMat,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      InkWell(
                        onTap:(){
                          // Den trang xac thuc bang khuon mat
                          Get.to(()=>const TeacherNhanDienKhuonMatScreen(isCheckin: true));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.lightGreenAccent,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 1,
                                offset: const Offset(0, 2)
                              )
                            ]
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical:14,
                            horizontal: 16
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tCheckin,
                                style: TextStyle(color: Color(0xFF0F0BDB)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.login, color: Color(0xFF0F0BDB))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap:(){
                          // Den trang xac thuc bang khuon mat
                          Get.to(()=>const TeacherNhanDienKhuonMatScreen(isCheckin: false));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.blue.withOpacity(0.1),
                                    blurRadius: 1,
                                    offset: const Offset(0, 2)
                                )
                              ]
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical:14,
                              horizontal: 16
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tCheckout,
                                style: TextStyle(color: Color(0xFF0F0BDB)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.login, color: Color(0xFF0F0BDB))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          // Den trang dang ky khuon mat
                          Get.to(()=> const TeacherDangKiKhuonMatScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF0F0BDB),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tDangKyKhuonMat,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.person_add, color: Colors.white)
                            ],
                          ),
                        )
                      ),
                      SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
