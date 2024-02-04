abstract class EndPoints {
  //------------------------------------------------------------------------//
  //static const mainUrl = "http://127.0.0.1:8000";
  static const mainUrl = "http://192.168.1.27:8000";
  static const String baseUrl = '$mainUrl/api/';
  //------------------------------------------------------------------------//

  static const login = 'auth/login';
  static const registe = 'auth/sign_up';
  static const forget = 'auth/forget_password';
  static const resetpassword = 'auth/reset_password';
  static const emailverfy = 'verifiedby/otp';

  static const getfavourite = 'favourite';
  static const addfavourite = 'favourite/create';
  static const deletefavourite = 'favourite/delete';

  /// Products
  static const home = 'home';
  static const cart = 'cart';
  static const postreview = 'product/review';
  static const productcategory = 'productcategory';
  static const getreview = 'product/review';
  static const getmyreview = 'product/review';
  static const getallreview = 'home';
  static const productDetail = 'product';
  static const favorite = 'favorite_list';
}
