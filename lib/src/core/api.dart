class EndPoints {
  static const String baseUrl =
      'https://sofia-shop.31-agency.com/api/';
  
        static const String mobileAPI = '${baseUrl}v1/Mobile/';

   static const String login = 'auth/login';
   static const String deleteAccount = 'auth/delete-me';
  static const String signup = 'auth/signup';
  static const String subCategory = 'v1/Mobile/main-categories/';
  // static const String logout = 'v1/Mobile/main-categories';
  static const String mainCategory = '${mobileAPI}main-categories';
  static const String resetPassword = '${baseUrl}password/forgot-password';
  static const String fetchAllProduct = '${mobileAPI}products';
  static const String fetchProductByCatId = '${mobileAPI}sub-categories/';
  static const String fetchProductDetails = '${mobileAPI}products/';
  static const String fetchCartDetails = '${mobileAPI}carts/';
  static const String postOrder = '${mobileAPI}orders';
  static const String cart = '${mobileAPI}carts';
  static const String putCart = '${mobileAPI}carts/';
  
  static const String notification = '${baseUrl}mobile/notifications';

 }
