import 'package:flutter/material.dart';

import '../../../../common_widgets/rounder_asset_image_widget/rounded_asset_image_widget.dart';
import '../../../../constants/sizes.dart';
import '../dan_thuoc/dan_thuoc_status_widget.dart';

class ThoiHocHoanPhiListtileWidget extends StatelessWidget {
  const ThoiHocHoanPhiListtileWidget({
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
        width: t30Size,
        height: t30Size,
        image: image,
      ),
      title: Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold),

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