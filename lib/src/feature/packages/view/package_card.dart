import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/sizes/sizes.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/packages/model/package_model.dart';

class PackageCard extends StatelessWidget {
  final PackageModel package;

  const PackageCard({super.key, required this.package});

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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              package.packageName,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: AppTheme.lightAppColors.mainTextcolor,
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: context.screenHeight * (240 / 852),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: package.features.length > 6 ? 6 : package.features.length,
              itemBuilder: (context, index) {
                final feature = package.features[index];
                return Container(
                  height: context.screenHeight * (40 / 852),
                  color: index % 2 == 0
                      ? AppTheme.lightAppColors.background.withOpacity(0.8)
                      : AppTheme.lightAppColors.containercolor,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check, color: AppTheme.lightAppColors.secondaryColor, size: 20),
                          SizedBox(width: 8),
                          Text(
                            feature.keys.first,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.lightAppColors.mainTextcolor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        feature.values.first,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.lightAppColors.mainTextcolor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          // Text(
          //   "See more benefits",
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontWeight: FontWeight.w500,
          //     color: AppTheme.lightAppColors.secondaryColor,
          //     letterSpacing: 0.3,
          //   ),
          // ),
          // SizedBox(height: 15),
          Container(
            width: context.screenWidth * (294 / 390),
            height: context.screenHeight * (34 / 852),
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                package.offerLabel,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.lightAppColors.secondaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: package.price.split(' ')[0] + ' ',
                    style: TextStyle(
                      color: AppTheme.lightAppColors.secondaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: 'JD/month',
                        style: TextStyle(
                          color: AppTheme.lightAppColors.mainTextcolor.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  package.commitment,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.lightAppColors.mainTextcolor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: context.screenWidth * (294 / 390),
            height: context.screenHeight * (55 / 852),
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.background,
              borderRadius: BorderRadius.all(
                Radius.circular(11.0),
              ),
              border: Border.all(
                color: AppTheme.lightAppColors.bordercolor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    package.commissionLabel,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.lightAppColors.mainTextcolor,
                    ),
                  ),
                  Text(
                    package.commissionValue,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.lightAppColors.mainTextcolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Add your action for terms and conditions here
            },
            child: Text(
              "Terms and conditions",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.lightAppColors.subTextcolor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}