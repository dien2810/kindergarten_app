import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/widget/teacher_dan_thuoc_status_widget.dart';

import '../../../../../common_widgets/rounder_asset_image_widget/rounded_asset_image_widget.dart';
import '../../../../../constants/sizes.dart';

class TeacherDanThuocListTileWidget extends StatelessWidget {
  const TeacherDanThuocListTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
    required this.studentID,
    required this.sentGuardian,
    required this.receivedPerson,
  });

  final String image;
  final String title;
  final String subtitle;
  final String status;
  final Color color;
  final String studentID;
  final String sentGuardian;
  final String receivedPerson;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedAssetImageWidget(
        width: t60Size,
        height: t60Size,
        image: image,
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      isThreeLine: true,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_today,
                color: Color(0xFF176D88),
              ),
              SizedBox(width: t10Size),
              Expanded(
                child: Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Học sinh: $studentID',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF767676),
            ),
          ),
          Text(
            'Người gửi: $sentGuardian',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF767676),
            ),
          ),
          const SizedBox(height: 8), // Khoảng cách trước nút trạng thái
          TeacherDanThuocStatusWidget(
            status: status,
            color: color,
          ),
        ],
      ),
    );
  }
}
