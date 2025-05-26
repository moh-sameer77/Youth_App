import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/constants.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/my_leads/controller/my_leads_controller.dart';
import 'package:flutter_application_1/src/feature/my_leads/view/custom_expandable_card.dart';
import 'package:flutter_application_1/src/feature/my_leads/view/lead_card_widget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyLeadsScreen extends StatelessWidget {

  MyLeadsScreen({super.key});
  final MyLeadsController controller = Get.put(MyLeadsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return RefreshIndicator(
          onRefresh: controller.fetchData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.isLoading.value
                  ? Column(
                      children: [
                        _buildShimmerCardRow(),
                        const SizedBox(height: 10),
                        _buildShimmerCardRow(),
                        const SizedBox(height: 40),
                        ...List.generate(3, (_) => _buildShimmerLeadCard()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLeadCardRows(),
                        const SizedBox(height: 20),
                        const Text("My Leads", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: controller.leads.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomExpandableCard(
                              isExpanded: controller.expandedList[index],
                              lead: controller.leads[index],
                              onTap: () => controller.toggleExpanded(index),
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ),
        );
      });
  }

  Widget _buildLeadCardRows() {
    final counts = controller.leadCounts;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeadCardWidget(
              title: "ALL",
              count: counts['all'].toString(),
              color: AppTheme.lightAppColors.lightPurpleColor,
              iconPath: AppConstants.leadsPurpleCheck,
            ),
            LeadCardWidget(
              title: "Successful",
              count: counts['successful'].toString(),
              color: AppTheme.lightAppColors.lightGreenColor,
              iconPath: AppConstants.leadsGreenCheck,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LeadCardWidget(
              title: "Pending",
              count: counts['pending'].toString(),
              color: AppTheme.lightAppColors.lightYellowColor,
              iconPath: AppConstants.leadYellowIcon,
            ),
            LeadCardWidget(
              title: "Voided",
              count: counts['voided'].toString(),
              color: AppTheme.lightAppColors.lightRedColor,
              iconPath: AppConstants.leadBlockIcon,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShimmerCardRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildShimmerBox(width: 172, height: 135),
        _buildShimmerBox(width: 172, height: 135),
      ],
    );
  }

  Widget _buildShimmerLeadCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _buildShimmerBox(height: 120),
    );
  }

  Widget _buildShimmerBox({double width = double.infinity, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
