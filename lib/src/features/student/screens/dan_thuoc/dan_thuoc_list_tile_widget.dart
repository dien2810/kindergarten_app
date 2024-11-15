import 'package:flutter/material.dart';

import '../../../../common_widgets/rounder_asset_image_widget/rounded_asset_image_widget.dart';
import '../../../../constants/sizes.dart';
import 'dan_thuoc_status_widget.dart';

class DanThuocListTileWidget extends StatelessWidget {
  const DanThuocListTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
  });

  final String image;
  final String title;
  final String subtitle;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedAssetImageWidget(
        width: t60Size,
        height: t60Size,
        image: image,
      ),
      title: Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),

      ),
      isThreeLine: true,
      subtitle: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          )
        ],
      ),
      trailing: DanThuocStatusWidget(
        status: status,
        color: color
      ),
    );
  }
}