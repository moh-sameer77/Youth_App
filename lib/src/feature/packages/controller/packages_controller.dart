import 'package:flutter_application_1/src/feature/packages/model/package_model.dart';

class PackagesController {
  List<PackageModel> getPackages() {
    return [
      PackageModel(
        packageName: "FTTH 200Mbps",
        offerLabel: "Get 10% off on your first 3 months subscriptions",
        price: "20 JD",
        commitment: "2 Years",
        commissionLabel: "Commission",
        commissionValue: "10 JOD",
        features: [
          {"Speed": "200 Mbps"},
          {"Monthly Subscription": "20 JD"},
          {"Commitment": "2 Years"},
          {"Capacity": "Unlimited"},
          {"Setup Fees": "Free"},
          {"Subscription Amount": "9 JD"},
        ],
      ),
      PackageModel(
        packageName: "FTTH 500Mbps",
        offerLabel: "Get 10% off on your first 3 months subscriptions",
        price: "30 JD",
        commitment: "1 Year",
        commissionLabel: "Commission",
        commissionValue: "15 JOD",
        features: [
          {"Speed": "300 Mbps"},
          {"Monthly Subscription": "30 JD"},
          {"Commitment": "1 Year"},
          {"Capacity": "Unlimited"},
          {"Setup Fees": "Free"},
          {"Subscription Amount": "12 JD"},
        ],
      ),
      PackageModel(
        packageName: "FTTH 1000Mbps",
        offerLabel: "Get 10% off on your first 3 months subscriptions",
        price: "50 JD",
        commitment: "3 Years",
        commissionLabel: "Commission",
        commissionValue: "20 JOD",
        features: [
          {"Speed": "500 Mbps"},
          {"Monthly Subscription": "50 JD"},
          {"Commitment": "3 Years"},
          {"Capacity": "Unlimited"},
          {"Setup Fees": "Free"},
          {"Subscription Amount": "15 JD"},
        ],
      ),
    ];
  }
}
