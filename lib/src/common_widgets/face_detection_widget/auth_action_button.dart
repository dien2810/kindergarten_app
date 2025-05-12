import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_dang_ky_khuon_mat_controller.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_diem_danh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_diem_danh_tu_dong_screen.dart';
import 'package:kindergarten_app/src/repository/student_face_repository/student_face_repository.dart';
import '../../constants/text_strings.dart';
import '../../features/student/models/student_face/student_face.dart';
import '../../services/camera_service.dart';
import '../../utils/helper_controller/helper_controller.dart';
import 'face_detection_button.dart';

class AuthActionButton extends StatefulWidget {
  const AuthActionButton(
      {super.key,
        required this.onPressed,
        required this.isLogin,
        required this.reload, required this.context});
  final Function onPressed;
  final bool isLogin;
  final Function reload;
  final BuildContext context;
  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  final teacherDangKyKhuonMat = Get.put(TeacherDangKyKhuonMatController());
  final CameraService _cameraService = Get.put(CameraService());

  // final TextEditingController _userTextEditingController =
  // TextEditingController(text: '');
  Rx<String> selectedStudentId = ''.obs;
  late TeacherDiemDanhController teacherDiemDanhController;
  List<Map<String, dynamic>> result = [];

  StudentFace? predictedUser;

  @override
  void initState() {
    super.initState();
    teacherDiemDanhController = Get.put(TeacherDiemDanhController());
    result = teacherDiemDanhController.result;
    selectedStudentId.value = result[0]["studentId"];
  }

  Future _signUp() async {
    final studentFaceRepo = Get.put(StudentFaceRepository());
    List predictedData = teacherDangKyKhuonMat.mlService.predictedData;
    String studentID = selectedStudentId.value;
    // String password = _passwordTextEditingController.text;
    StudentFace studentToSave = StudentFace(
      studentID: studentID,
      modelData: predictedData,
    );
    await studentFaceRepo.addStudentFace(studentToSave);
    teacherDangKyKhuonMat.mlService.setPredictedData([]);
    Helper.successSnackBar(title: tDangKyKhuonMat, message: tDangKyKhuonMatThanhCong);
    final diemDanhScreenContext = widget.context;
    if (diemDanhScreenContext.mounted) {
      Navigator.of(diemDanhScreenContext).pop();
    }
  }

  // Future _signIn(context) async {
  //   String password = _passwordTextEditingController.text;
  //   if (this.predictedUser!.password == password) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => Profile(
  //               this.predictedUser!.user,
  //               imagePath: _cameraService.imagePath!,
  //             )));
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text('Wrong password!'),
  //         );
  //       },
  //     );
  //   }
  // }

  Future<StudentFace?> _predictUser() async {
    StudentFace? userAndPass = await teacherDangKyKhuonMat.mlService.predict();
    return userAndPass;
  }

  Future onTap() async {
    try {
      bool faceDetected = await widget.onPressed();
      if (faceDetected) {
        if (widget.isLogin) {
          var user = await _predictUser();
          if (user != null) {
            predictedUser = user;
          }
        }
        PersistentBottomSheetController bottomSheetController =
        Scaffold.of(context)
            .showBottomSheet((context) => signSheet(context));
        bottomSheetController.closed.whenComplete(() => widget.reload());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tNhanDien,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLogin && predictedUser != null
              ? Text(
                '${'Welcome back, ${predictedUser!.studentID}'}.',
                style: const TextStyle(fontSize: 20),
              )
              : widget.isLogin
              ? const Text(
                tKhongTimThay,
                style: TextStyle(fontSize: 20),
              )
              : Container(),
          Column(
            children: [
              !widget.isLogin
                  ? Obx(() {
                      return DropdownButton<String>(
                        value: selectedStudentId.value,
                        items: result.map<DropdownMenuItem<String>>((Map<String, dynamic> studentData) {
                          return DropdownMenuItem<String>(
                            value: studentData['studentId'],
                            child: Text(studentData['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          selectedStudentId.value = newValue!;
                        },
                      );
                    }
                  )
                  : Container(),
              // !widget.isLogin
              //     ? FaceDetectionTextField(
              //       controller: _userTextEditingController,
              //       labelText: "Your Name",
              //     )
              //     : Container(),
              // const SizedBox(height: 10),
              // widget.isLogin && predictedUser == null
              //     ? Container()
              //     : FaceDetectionTextField(
              //       controller: _passwordTextEditingController,
              //       labelText: "Password",
              //       isPassword: true,
              //     ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              widget.isLogin && predictedUser != null
                  ? FaceDetectionButton(
                text: tNHANDIEN,
                onPressed: () async {
                  // _signIn(context);
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              )
                  : !widget.isLogin
                  ? FaceDetectionButton(
                text: tDANGKY,
                onPressed: () async {
                  await _signUp();
                },
                icon: const Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
              )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
