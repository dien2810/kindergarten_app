import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/hoan_phi/hoan_phi_model.dart';
import 'package:kindergarten_app/src/repository/refundRepository/refund_repository.dart';

import '../../../../repository/account_repository/account_repository.dart';

class ThoiHocHoanPhiController extends GetxController{
  static ThoiHocHoanPhiController get instance => Get.find();
  final _refundRepository = Get.put(RefundRepository());
  final _accountRepo = Get.put(AccountRepository());

  Future<List<ThoiHocHoanPhiModel>> getRefundData() async{
    return await _refundRepository.allRefund(_accountRepo.userId);
  }
}