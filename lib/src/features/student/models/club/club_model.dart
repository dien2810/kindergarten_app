import 'package:cloud_firestore/cloud_firestore.dart';

import '../semester_tc/semester_tc_model.dart';
import 'day_of_week.dart';

class ClubModel {
  final String? id;
  final String aboutCourse;
  final int capacity;
  final String closedRegistration;
  final String clubName;
  final String openedRegistration;
  final String openingDay;
  final String room;
  final String semesterID;
  final String teacherID;
  final int tuition;
  final Map<String, DayOfWeek> dayOfWeek;
  SemesterTcModel? semester;

  ClubModel({
    this.id,
    required this.aboutCourse,
    required this.capacity,
    required this.closedRegistration,
    required this.clubName,
    required this.openedRegistration,
    required this.openingDay,
    required this.room,
    required this.semesterID,
    required this.teacherID,
    required this.tuition,
    required this.dayOfWeek,
    this.semester,
  });

  factory ClubModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ClubModel(
      id: doc.id,
      aboutCourse: data['aboutCourse'],
      // medicineDetails: (data['medicineDetails'] as List<dynamic>)
      //     .map((item) => MedicineDetail.fromMap(item as Map<String, dynamic>))
      //     .toList(),
      capacity: data['capacity'],
      closedRegistration: data['closedRegistration'],
      clubName: data['clubName'],
      openedRegistration: data['openedRegistration'],
      openingDay: data['openingDay'],
      room: data['room'],
      semesterID: data['semesterID'],
      teacherID: data['teacherID'],
      tuition: data['tuition'],
      dayOfWeek: (data['dayOfWeek'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, DayOfWeek.fromMap(value)),

    ));
  }

  // Tạo đối tượng từ Map (Firestore -> Object)
  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      aboutCourse: map['aboutCourse'] as String,
      capacity: map['capacity'] as int,
      closedRegistration: map['closedRegistration'] as String,
      clubName: map['clubName'] as String,
      openedRegistration: map['openedRegistration'] as String,
      openingDay: map['openingDay'] as String,
      room: map['room'] as String,
      semesterID: map['semesterID'] as String,
      teacherID: map['teacherID'] as String,
      tuition: map['tuition'] as int,
      dayOfWeek: (map['dayOfWeek'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, DayOfWeek.fromMap(value))),

    );
  }

  // Chuyển đối tượng thành Map (Object -> Firestore)
  Map<String, dynamic> toMap() {
    return {
      'aboutCourse': aboutCourse,
      'capacity': capacity,
      'closedRegistration': closedRegistration,
      'clubName': clubName,
      'openedRegistration': openedRegistration,
      'openingDay': openingDay,
      'room': room,
      'semesterID': semesterID,
      'teacherID': teacherID,
      'tuition': tuition,
      'dayOfWeek': dayOfWeek.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}