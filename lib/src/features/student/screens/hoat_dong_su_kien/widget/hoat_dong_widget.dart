import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/hoat_dong_su_kien_controller.dart';

class HoatDongWidget extends StatelessWidget {
  final HoatDongController controller = Get.put(HoatDongController());

  HoatDongWidget({Key? key}) : super(key: key) {
    // Load initial data for the current date
    final formattedDate = DateFormat('dd/MM/yyyy').format(controller.selectedDate.value);
    controller.loadHoatDongForDate(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoạt động'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDatePicker(controller),
            Obx(() {
              if (controller.videoGiamSatLive.isNotEmpty) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Logic for watching video
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD74971),
                    ),
                    icon: const Icon(Icons.play_circle_fill),
                    label: const Text('Xem video'),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Obx(() => ListView.builder(
                      itemCount: controller.hoatDongList.length,
                      itemBuilder: (context, index) {
                        final hoatDong = controller.hoatDongList[index];
                        return _buildHoatDongCard(hoatDong);
                      },
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(HoatDongController controller) {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

    List<Widget> days = [];
    for (int i = 0; i < 7; i++) {
      DateTime day = startOfWeek.add(Duration(days: i));
      days.add(GestureDetector(
        onTap: () {
          final formattedDate = DateFormat('dd/MM/yyyy').format(day);
          controller.selectedDate.value = day;
          controller.loadHoatDongForDate(formattedDate);
        },
        child: Obx(() {
          bool isSelected = day == controller.selectedDate.value;
          return Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  DateFormat.E().format(day),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                Text(
                  DateFormat.d().format(day),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days,
    );
  }

  Widget _buildHoatDongCard(HoatDong hoatDong) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Text(
                '${hoatDong.startTime} - ${hoatDong.endTime}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hoatDong.activityName,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Địa điểm: ${hoatDong.location}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Logic to view details
                            },
                            child: const Text('Xem chi tiết'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
