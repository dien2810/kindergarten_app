import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/hoan_phi/hoan_phi_model.dart';
import 'package:kindergarten_app/src/repository/refundRepository/refund_repository.dart';

class ThoiHocHoanPhiController extends GetxController{
  static ThoiHocHoanPhiController get instance => Get.find();
  final _refundRepository = Get.put(RefundRepository());

  Future<List<ThoiHocHoanPhiModel>> getRefundData(String studentID) async{
    return await _refundRepository.allRefund(studentID);
  }
}