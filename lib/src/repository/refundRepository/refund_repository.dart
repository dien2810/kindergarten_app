import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../features/student/models/hoan_phi/hoan_phi_model.dart';

class RefundRepository extends GetxController{
  static RefundRepository get instance => Get.find();
  //final _db = FirebaseFirestore.instance;
  final CollectionReference _refundCollection = FirebaseFirestore.instance.collection('refund');
  // Thêm một document medicine mới vào Firestore
  Future<List<ThoiHocHoanPhiModel>> allRefund(String studentID) async {
    try{
      final snapshot =
      await _refundCollection.where("studentID", isEqualTo: studentID).get();
      print('Snapshot: ${snapshot.docs}');
      final refundData = snapshot.docs.map((e) => ThoiHocHoanPhiModel.fromFirestore(e)).toList();

      return refundData;
    } catch(e){
      print("Fail to catch refunds: $e");
      return [];
    }
  }
  // Thêm một document medicine mới vào Firestore
  Future<void> addRefund(ThoiHocHoanPhiModel refund) async {
    try {
      await _refundCollection.doc(refund.id).set(refund.toJson());
      print("Refund added successfully");
    } catch (e) {
      print("Failed to add refund: $e");
    }
  }
  // Xóa một document medicine dựa trên medicineId
  Future<void> deleteRefund(String refundId) async {
    try {
      await _refundCollection.doc(refundId).delete();
      print("Refund deleted successfully");
    } catch (e) {
      print("Failed to delete refund: $e");
    }
  }
  // Cập nhật một document medicine trong Firestore
  Future<void> updateRefund(ThoiHocHoanPhiModel refund) async {
    try {
      await _refundCollection.doc(refund.id).update(refund.toJson());
      print("Refund updated successfully");
    } catch (e) {
      print("Failed to update refund: $e");
    }
  }
}