import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/new_leads/controller/new_lead_controller.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_button.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_input.dart';
import 'package:get/get.dart';

class NewLeadScreen extends StatelessWidget {
  NewLeadScreen({super.key});

  final NewLeadController controller = Get.put(NewLeadController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => CustomInputField(
                    labelText: "Customer Name",
                    controller: controller.customerNameController,
                    errorText: controller.customerNameError.value,
                    onChanged: (_) => controller.clearCustomerNameError(),
                  )),
              Obx(() => CustomInputField(
                    labelText: "Customer Contact Number",
                    controller: controller.customerContactNumberController,
                    errorText: controller.customerContactNumberError.value,
                    onChanged: (_) => controller.clearContactNumberError(),
                  )),
              Obx(() => CustomDropdownField(
                    labelText: "Interested Package",
                    options: controller.packageList,
                    selectedValue: controller.selectedPackage.value,
                    errorText: controller.interestedPackageError.value,
                    onChanged: (value) {
                      controller.selectedPackage.value = value;
                      controller.clearInterestedPackageError();
                    },
                  )),
              Obx(() => CustomInputField(
                    labelText: "Commission MSISDN",
                    controller: controller.commissionMSISDNController,
                    errorText: controller.commissionMSISDNError.value,
                    onChanged: (_) => controller.clearCommissionMSISDNError(),
                  )),
              const SizedBox(height: 20),
              CustomButton(
                text: "Submit",
                buttonColor: AppTheme.lightAppColors.pinkColor,
                onPressed: () {
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
  }
}
