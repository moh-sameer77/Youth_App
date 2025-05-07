class PackageModel {
  final String packageName;
  final String offerLabel;
  final String price;
  final String commitment;
  final String commissionLabel;
  final String commissionValue;
  final List<Map<String, String>> features; 

  PackageModel({
    required this.packageName,
    required this.offerLabel,
    required this.price,
    required this.commitment,
    required this.commissionLabel,
    required this.commissionValue,
    required this.features,
  });
}
