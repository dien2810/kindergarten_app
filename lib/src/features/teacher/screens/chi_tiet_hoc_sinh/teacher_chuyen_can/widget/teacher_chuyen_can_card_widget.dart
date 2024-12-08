import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/student/models/absent/absent_date_entry.dart';

class TeacherChuyenCanCardWidget extends StatelessWidget {
  final String studentName;
  final AbsentDateEntry absentDate;

  const TeacherChuyenCanCardWidget({
    super.key,
    required this.studentName,
    required this.absentDate,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'đến muộn':
        return const Color(0xFF505050);
      case 'vắng có phép':
        return const Color(0xFF6BC5FF);
      case 'vắng không phép':
        return const Color(0xFFF14F4F);
      default:
        return const Color(0xFF99D98C); // Default color if status is unknown
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(absentDate.absentStatus);
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 133,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0), // Adjust the radius as needed
                  bottomLeft: Radius.circular(10.0), // Adjust the radius as needed
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studentName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          absentDate.day!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),
                    Text(
                      absentDate.absentStatus,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Lý do: ${absentDate.reason}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
