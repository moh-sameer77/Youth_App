import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/my_leads/model/lead_model.dart';
import 'package:get/get.dart';

class CustomExpandableCard extends StatelessWidget {
  final RxBool isExpanded;
  final Lead lead;
  final VoidCallback? onTap;

  const CustomExpandableCard({
    super.key,
    required this.isExpanded,
    required this.lead,
    this.onTap,
  });

 @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedCrossFade(
        firstChild: _collapsedView(context),
        secondChild: _expandedView(context),
        crossFadeState: isExpanded.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
  

  Widget _collapsedView(BuildContext context) {
    return _cardBase(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 3,
            height: 40,
            color: _getStatusColor(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: TextStyle(fontSize: 13, color: AppTheme.lightAppColors.subTextcolor)),
                Text(lead.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.lightAppColors.mainTextcolor)),
              ],
            ),
          ),
          Icon(
            isExpanded.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppTheme.lightAppColors.mainTextcolor,
          ),
        ],
      ),
    );
  }

  Widget _expandedView(BuildContext context) {
    return _cardBase(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 3, height: 40, color: _getStatusColor()),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name", style: TextStyle(fontSize: 13, color: AppTheme.lightAppColors.subTextcolor)),
                    Text(lead.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.lightAppColors.mainTextcolor)),
                  ],
                ),
              ),
              Icon(
                isExpanded.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppTheme.lightAppColors.subTextcolor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoColumn("Status", lead.status, color: _getStatusColor()),
                  const SizedBox(height: 15),
                  _infoColumn("Interested Package", lead.package, bold: true),
                  const SizedBox(height: 15),
                  _infoColumn("Commission Type", lead.commissionType, bold: true),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoColumn("Contact Number", lead.contactNumber),
                  const SizedBox(height: 15),
                  _infoColumn("Commission Amount", lead.commissionAmount, bold: true),
                  const SizedBox(height: 15),
                  _infoColumn("Commission Status", lead.commissionStatus, color: _getStatusColor()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoColumn(String label, String value, {bool bold = false, Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppTheme.lightAppColors.subTextcolor, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: color ?? AppTheme.lightAppColors.mainTextcolor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _cardBase({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }

  Color _getStatusColor() {
    if (lead.status == "Approved") return AppTheme.lightAppColors.activatedColor;
    if (lead.status == "Pending") return AppTheme.lightAppColors.darkYellowColor;
    return AppTheme.lightAppColors.cancelcolor;
  }
}
