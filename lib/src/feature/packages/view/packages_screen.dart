import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/sizes/sizes.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/packages/view/package_card.dart';
import 'package:flutter_application_1/src/feature/packages/model/package_model.dart';
import 'package:flutter_application_1/src/shared/widgets/custom_page_view_slider.dart';
import 'package:flutter_application_1/src/feature/packages/controller/packages_controller.dart';
import 'package:flutter_application_1/src/feature/packages/view/package_card_skeleton.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  final PackagesController _controller = PackagesController();

  Future<List<PackageModel>> _fetchPackages() async {
    await Future.delayed(Duration(seconds: 2));
    return _controller.getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.screenHeight * (15 / 852),
          ),
          FutureBuilder<List<PackageModel>>(
            future: _fetchPackages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomPageViewSlider(
                  itemCount: 3,
                  height: context.screenHeight * (550 / 852),
                  viewportFraction: 0.85,
                  itemBuilder: (context, index) => [
                    const PackageCardSkeleton(),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  "Failed to load packages",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.lightAppColors.mainTextcolor,
                  ),
                );
              } else if (snapshot.hasData) {
                final packages = snapshot.data!;
                return CustomPageViewSlider(
                  itemCount: packages.length,
                  height: context.screenHeight * (560 / 852),
                  viewportFraction: 0.85,
                  itemBuilder: (context, index) => [
                    PackageCard(package: packages[index]),
                  ],
                );
              } else {
                return Text(
                  "No packages available",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.lightAppColors.subTextcolor,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
