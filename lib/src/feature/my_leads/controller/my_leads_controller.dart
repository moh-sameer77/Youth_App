import 'package:flutter_application_1/src/feature/my_leads/model/lead_model.dart';
import 'package:get/get.dart';

class MyLeadsController extends GetxController {
  var customerName = "safi alyounis".obs;

  var isLoading = true.obs;

  var leads = <Lead>[].obs;
  var expandedList = <RxBool>[].obs;

  var leadCounts = {
    'all': 0,
    'successful': 0,
    'pending': 0,
    'voided': 0,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    leadCounts.value = {
      'all': 106,
      'successful': 77,
      'pending': 23,
      'voided': 6,
    };

    final fetchedLeads = [
      Lead(
        name: "Candidate Management",
        status: "Voided",
        contactNumber: "0798765432",
        package: "Fiber 500",
        commissionAmount: "6 JOD",
        commissionType: "Zain cash",
        commissionStatus: "Declined",
      ),
      Lead(
        name: "lead 2",
        status: "Approved",
        contactNumber: "0781234567",
        package: "Fiber 300",
        commissionAmount: "4 JOD",
        commissionType: "Bank transfer",
        commissionStatus: "Pending",
      ),
      Lead(
        name: "tetst stst",
        status: "Pending",
        contactNumber: "0781234567",
        package: "Fiber 300",
        commissionAmount: "4 JOD",
        commissionType: "Bank transfer",
        commissionStatus: "Pending",
      ),
    ];

    leads.assignAll(fetchedLeads);
    expandedList.assignAll(List.generate(fetchedLeads.length, (_) => false.obs));
    isLoading.value = false;
  }

  void toggleExpanded(int index) {
    expandedList[index].value = !expandedList[index].value;
  }
}
