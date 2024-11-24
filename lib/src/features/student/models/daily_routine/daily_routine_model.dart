import 'package:kindergarten_app/src/features/student/models/daily_routine/routine_entry_model.dart';

class DailyRoutineModel{
  final String? id;
  final String classId;
  final String dailyRoutineName;
  final Map<String, RoutineEntryModel> routine;

  DailyRoutineModel({
    this.id,
    required this.classId, required this.dailyRoutineName, required this.routine,

  });

  // Tạo từ Map (Firestore)
  factory DailyRoutineModel.fromMap(Map<String, dynamic> map) {
    final routineMap = (map['routine'] as Map<String, dynamic>? ?? {});
    final routine = routineMap.map(
          (key, value) => MapEntry(key, RoutineEntryModel.fromMap(value)),
    );

    return DailyRoutineModel(
      classId: map['classId'] ?? '',
      dailyRoutineName: map['dailyRoutineName'] ?? '',
      routine: routine,
    );
  }

  // Chuyển về Map (lưu vào Firestore)
  Map<String, dynamic> toMap() {
    return {
      'classId': classId,
      'dailyRoutineName': dailyRoutineName,
      'routine': routine.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}