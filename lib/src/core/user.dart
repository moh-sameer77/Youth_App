// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class User{
//     final RxString token = ''.obs;
//     final RxString googleToken = ''.obs;

//    clearToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('LoginToken');
//     token.value = '';
//   }

//   loadToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     token.value = prefs.getString('LoginToken') ?? '';
//     }

//   saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('LoginToken', token);

//    } 
   
//    clearGoogleToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('Google_token');
//     googleToken.value = '';
//   }

//   loadGoogleToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     googleToken.value = prefs.getString('Google_token') ?? '';
//     print(googleToken);
//     }
   
//    saveGoogleToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('Google_token', token);
//    }
// }