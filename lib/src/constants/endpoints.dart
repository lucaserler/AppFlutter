String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static String signin = '$baseUrl/login';
  static String signup = '$baseUrl/signup';
  static String validateToken = '$baseUrl/validate-token';
  static String resetPassword = '$baseUrl/reset-password';
  static String getAllCategories = '$baseUrl/get-category-list';
  static String getAllProducts = '$baseUrl/get-product-list';
  static String getCartItems = '$baseUrl/get-cart-items';
  static String addItemToCart = '$baseUrl/add-item-to-cart';
  static String changeItemQuantity = '$baseUrl/modify-item-quantity';
  static String checkout = '$baseUrl/checkout';
  static String getAllOrders = '$baseUrl/get-orders';
  static String getOrderItems = '$baseUrl/get-order-items';
  static String changePassword = '$baseUrl/change-password';
}
