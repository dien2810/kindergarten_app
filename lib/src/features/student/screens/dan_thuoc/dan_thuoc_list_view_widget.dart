import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/dan_thuoc/dan_thuoc_controller.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../models/medicine/medicine_model.dart';
import 'chi_tiet_dan_thuoc/chi_tiet_dan_thuoc_screen.dart';
import 'dan_thuoc_list_tile_widget.dart';

class DanThuocListViewWidget extends StatelessWidget {
  const DanThuocListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final danThuocController = Get.put(DanThuocController());
    final accountRepo = Get.put(AccountRepository());
    return FutureBuilder<List<MedicineModel>>(
      future: danThuocController.getMedicineData(accountRepo.userId),
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
                  Get.to(()=>ChiTietDanThuocScreen(
                    image: image,
                    color: color,
                    medicine: medicineList[index],
                  ));
                },
                child: DanThuocListTileWidget(image: image, title: title, subtitle: subtitle, status: status, color: color),
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