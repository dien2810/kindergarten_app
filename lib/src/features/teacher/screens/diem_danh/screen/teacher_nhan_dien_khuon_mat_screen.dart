import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';

import '../../../../../common_widgets/face_detection_widget/auth_button.dart';
import '../../../../../common_widgets/face_detection_widget/camera_header.dart';
import '../../../../../common_widgets/face_detection_widget/face_painter.dart';
import '../../../../../common_widgets/face_detection_widget/sign_in_sheet.dart';
import '../../../../../common_widgets/face_detection_widget/single_picture.dart';
import '../../../../../utils/helper_controller/helper_controller.dart';
import '../../../../student/models/absent/absent_date_entry.dart';
import '../../../../student/models/student_face/student_face.dart';
import '../../../controllers/diem_danh/teacher_nhan_dien_khuon_mat_controller.dart';

class TeacherNhanDienKhuonMatScreen extends StatelessWidget {
  const TeacherNhanDienKhuonMatScreen({super.key, required this.isCheckin});
  final bool isCheckin;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final nhanDienKhuonMatController = Get.put(TeacherNhanDienKhuonMatController());
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    signInSheet({@required StudentFace? studentFace}) => studentFace == null
        ? Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: const Text(
            tKhongPhatHienDuocKhuonMatNao,
            style: TextStyle(fontSize: 20),
          ),
        )
        : SignInSheet(studentFace: studentFace);

    Future<void> onTap() async {
      await nhanDienKhuonMatController.takePicture();
      if (nhanDienKhuonMatController.faceDetectorService.faceDetected) {
        StudentFace? studentFace = await nhanDienKhuonMatController.mlService.predict();
        if (studentFace != null){
          final teacherDiemDanhController = Get.put(TeacherDiemDanhController());
          final DateTime now = DateTime.now();
          final absentDateData = teacherDiemDanhController.attendanceRecords[studentFace.studentID]['absentData'];
          absentDateData.absentStatus = 'đúng giờ';
          absentDateData.day = Helper.formatDateToString(now);
          isCheckin
              ? absentDateData.checkinTime = Helper.formatTime(now)
              : absentDateData.checkoutTime = Helper.formatTime(now);
          teacherDiemDanhController.attendanceRecords[studentFace.studentID]['absentData']
            = absentDateData;
          await teacherDiemDanhController.updateAttendance();
        }
        var bottomSheetController = scaffoldKey.currentState!
            .showBottomSheet((context) => signInSheet(studentFace: studentFace));
        bottomSheetController.closed.whenComplete(nhanDienKhuonMatController.reload);
      }
    }

    Widget header = CameraHeader(
        tNHANDIENKHUONMAT,
        onBackPressed: (){
          Navigator.of(context).pop();
          Future.delayed(
              const Duration(seconds: 1),
              (){
                nhanDienKhuonMatController.cameraService.dispose();
                nhanDienKhuonMatController.faceDetectorService.dispose();
              }
          );
        }
    );

    return Obx(() {
      if (nhanDienKhuonMatController.isInitializing.value){
        print("1111");
        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              const Center(child: CircularProgressIndicator()),
              header
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !nhanDienKhuonMatController.isPictureTaken.value
              ? AuthButton(onTap: onTap, isCheckin: isCheckin)
              : Container(),
        );
      }
      if (nhanDienKhuonMatController.isPictureTaken.value){
        print("2222");
        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              SinglePicture(imagePath: nhanDienKhuonMatController.cameraService.imagePath!),
              CameraHeader(
                  tNHANDIENKHUONMAT,
                  onBackPressed: (){
                    Navigator.pop(context);
                  }
              )
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !nhanDienKhuonMatController.isPictureTaken.value
              ? AuthButton(onTap: onTap, isCheckin: isCheckin)
              : Container(),
        );
      }
      print("3333");
      return Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            Transform.scale(
              scale: 1.0,
              child: AspectRatio(
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      width: width,
                      height:
                      width * nhanDienKhuonMatController.cameraService.cameraController!.value.aspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          CameraPreview(nhanDienKhuonMatController.cameraService.cameraController!),
                          CustomPaint(
                            painter: FacePainter(
                                face: nhanDienKhuonMatController.faceDetected.value,
                                imageSize: nhanDienKhuonMatController.imageSize!
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            header
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !nhanDienKhuonMatController.isPictureTaken.value
            ? AuthButton(onTap: onTap, isCheckin: isCheckin)
            : Container(),
      );
      }
    );
  }
}