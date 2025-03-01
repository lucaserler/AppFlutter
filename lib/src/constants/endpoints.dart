String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static String signin = '$baseUrl/login';
  static String signup = '$baseUrl/signup';
  static String validateToken = '$baseUrl/validate-token';
  static String resetPassword = '$baseUrl/reset-password';
  static String getAllCategories = '$baseUrl/get-category-list';
  static String getAllProducts = '$baseUrl/get-product-list';
}
