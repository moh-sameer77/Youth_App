class CreateAccountModel {
  String email;
  String fullName;
  String msisdn;
  String universityName;
  String nationalId;
  String documentNumber;
  String password;
  String confirmPassword;
  bool isJordanian;
  String? universityIdImage;
  String? frontIdImage;
  String? backIdImage;
  String? passportImage;

  CreateAccountModel({
    this.email = '',
    this.fullName = '',
    this.msisdn = '',
    this.universityName = '',
    this.nationalId = '',
    this.documentNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isJordanian = true,
    this.universityIdImage,
    this.frontIdImage,
    this.backIdImage,
    this.passportImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'msisdn': msisdn,
      'universityName': universityName,
      'nationalId': nationalId,
      'documentNumber': documentNumber,
      'password': password,
      'confirmPassword': confirmPassword,
      'isJordanian': isJordanian,
      'universityIdImage': universityIdImage,
      'frontIdImage': frontIdImage,
      'backIdImage': backIdImage,
      'passportImage': passportImage,
    };
  }

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      msisdn: json['msisdn'] ?? '',
      universityName: json['universityName'] ?? '',
      nationalId: json['nationalId'] ?? '',
      documentNumber: json['documentNumber'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      isJordanian: json['isJordanian'] ?? true,
      universityIdImage: json['universityIdImage'],
      frontIdImage: json['frontIdImage'],
      backIdImage: json['backIdImage'],
      passportImage: json['passportImage'],
    );
  }
}