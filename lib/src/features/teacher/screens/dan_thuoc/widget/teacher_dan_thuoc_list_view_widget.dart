import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../student/models/medicine/medicine_model.dart';
import '../../../controllers/dan_thuoc/teacher_dan_thuoc_controller.dart';
import '../screen/teacher_chi_tiet_dan_thuoc_screen.dart';
import 'teacher_dan_thuoc_list_tile_widget.dart';

class TeacherDanThuocListViewWidget extends StatelessWidget {
  const TeacherDanThuocListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final danThuocController = Get.put(TeacherDanThuocController());
    return FutureBuilder<List<MedicineModel>>(
      future: danThuocController.getMedicineData("student_id_1"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Không có dữ liệu.'));
        }
        else {
          final medicineList = snapshot.data!;
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              String image = '';
              final medicine = medicineList[index];
              String status = medicine.status;
              String title = medicine.prescription;
              String subtitle = medicine.createDate;
              String receivedPerson = medicine.receivedPerson;
              String sentGuardian = medicine.sentGuardian;
              String studentID = medicine.studentID;
              Color color = tWhiteColor;
              if (status == tDaGui){
                color = const Color(0xFFDAF6F4);
              }
              else if (status == tDaHoanThanh) {
                color = const Color(0xFFCFECFF);
              }
              else {
                color = const Color(0xFFE8E7FC);
              }
              if (index % 4 == 0){
                image = tDanThuocItemImage1;
              }
              else if (index % 4 == 1) {
                image = tDanThuocItemImage2;
              }
              else if (index % 4 == 2) {
                image = tDanThuocItemImage3;
              }
              else {image = tDanThuocItemImage4;}
              return GestureDetector(
                onTap: (){
                  Get.to(()=>TeacherChiTietDanThuocScreen(
                    image: image,
                    color: color,
                    medicine: medicineList[index],
                    receivedPerson : receivedPerson,
                    studentID: studentID,
                    sentGuardian: sentGuardian,
                    status: status,
                  ));
                },
                child: TeacherDanThuocListTileWidget(image: image, title: title, subtitle: subtitle, status: status, color: color, studentID: studentID, sentGuardian: sentGuardian, receivedPerson : receivedPerson),

              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: medicineList.length,
          );
        }

      }
    );
  }
}