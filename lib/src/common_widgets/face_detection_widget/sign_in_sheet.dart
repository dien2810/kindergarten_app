import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kindergarten_app/src/features/student/models/student_face/student_face.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

import '../../features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';

class SignInSheet extends StatelessWidget {
  const SignInSheet({super.key, required this.studentFace});
  final StudentFace studentFace;

  // Future _signIn(context, user) async {
  //   if (user.password == _passwordController.text) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => Profile(
  //               user.user,
  //               imagePath: _cameraService.imagePath!,
  //             )));
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           content: Text('Wrong password!'),
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final teacherDiemDanhController = Get.put(TeacherDiemDanhController());
    print(teacherDiemDanhController.result);
    final result = teacherDiemDanhController.result;
    final index = result.indexWhere((student) => student['studentId'] == studentFace.studentID);
    String studentName = '';
    if (index != -1) {
      studentName = result[index]['name'];
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Đã phát hiện - $studentName.',
            style: const TextStyle(fontSize: 20),
          ),
          const Column(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
