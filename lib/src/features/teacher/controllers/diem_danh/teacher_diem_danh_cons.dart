import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';

final CollectionReference absentCollection = FirebaseFirestore.instance.collection('absent');

Future<List<Map<String, dynamic>>> fetchAttendance(DateTime date) async {
  final querySnapshot = await absentCollection
      .where('date', isEqualTo: date.toIso8601String())
      .get();

  return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}

Future<void> updateAttendance(String studentId, DateTime date, String status) async {
  await absentCollection
      .doc('$studentId-${date.toIso8601String()}')
      .update({
    'status': status,
  });
}

Future<AttendanceDetail> fetchAttendanceDetail(String studentId, DateTime date) async {
  final documentSnapshot = await absentCollection
      .doc('$studentId-${date.toIso8601String()}')
      .get();

  if (documentSnapshot.exists && documentSnapshot.data() != null) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return AttendanceDetail(
      period: data['period'] != null ? List<String>.from(data['period']) : [],
      absentTime: data['absentTime'] ?? '',
      absentStatus: data['absentStatus'] ?? '',
      checkinImage: data['checkinImage'] ?? '',
      checkoutImage: data['checkoutImage'] ?? '',
      checkinTime: data['checkinTime'] ?? '',
      checkoutTime: data['checkoutTime'] ?? '',
      reason: data['reason'] ?? '',
    );
  } else {
    return AttendanceDetail(
      period: [],
      absentTime: '',
      absentStatus: '',
      checkinImage: '',
      checkoutImage: '',
      checkinTime: '',
      checkoutTime: '',
      reason: '',
    );
  }
}

Future<void> editAttendance(String studentId, DateTime date, String newStatus, String? checkIn, String? checkOut) async {
  await absentCollection
      .doc('$studentId-${date.toIso8601String()}')
      .update({
    'status': newStatus,
    'checkIn': checkIn,
    'checkOut': checkOut,
  });
}


void displayPhotos(String checkInPhoto, String checkOutPhoto) {
  print("Check-in photo: $checkInPhoto");
  print("Check-out photo: $checkOutPhoto");
}
