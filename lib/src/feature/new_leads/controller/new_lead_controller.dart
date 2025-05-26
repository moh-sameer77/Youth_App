import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewLeadController extends GetxController {
  final customerNameController = TextEditingController();
  final customerContactNumberController = TextEditingController();
  final interestedPackageController = TextEditingController();
  final commissionMSISDNController = TextEditingController();

  final customerNameError = RxnString();
  final customerContactNumberError = RxnString();
  final interestedPackageError = RxnString();
  final commissionMSISDNError = RxnString();

  final selectedPackage = RxnString();
  final selectedCommissionType = RxString("Zain cash");

  final packageList = ['Package A', 'Package B', 'Package C'];

  void clearCustomerNameError() => customerNameError.value = null;
  void clearContactNumberError() => customerContactNumberError.value = null;
  void clearInterestedPackageError() => interestedPackageError.value = null;
  void clearCommissionMSISDNError() => commissionMSISDNError.value = null;
}
