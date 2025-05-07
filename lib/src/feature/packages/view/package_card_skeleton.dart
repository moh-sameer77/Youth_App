import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/sizes/sizes.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';

class PackageCardSkeleton extends StatelessWidget {
  const PackageCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.lightAppColors.bordercolor,
          width: 1,
        ),
        color: AppTheme.lightAppColors.containercolor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: context.screenHeight * 0.03,
              width: context.screenWidth * 0.5,
              color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: context.screenHeight * (240 / 852),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  height: context.screenHeight * (40 / 852),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: context.screenHeight * 0.02,
            width: context.screenWidth * 0.4,
            color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
          ),
          SizedBox(height: 15),
          Container(
            width: context.screenWidth * (294 / 390),
            height: context.screenHeight * (34 / 852),
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: context.screenHeight * 0.03,
                  width: context.screenWidth * 0.2,
                  color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
                ),
                Container(
                  height: context.screenHeight * 0.03,
                  width: context.screenWidth * 0.2,
                  color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: context.screenWidth * (294 / 390),
            height: context.screenHeight * (55 / 852),
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
              borderRadius: BorderRadius.all(
                Radius.circular(11.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: context.screenHeight * 0.02,
            width: context.screenWidth * 0.3,
            color: AppTheme.lightAppColors.bordercolor.withOpacity(0.3),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
