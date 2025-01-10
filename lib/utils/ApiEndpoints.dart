class ApiEndpoints {

  static const String baseUrl = 'https://back.industry.com.sa/api/v1/';


  static const String home = '${baseUrl}home';
   static const String common = '${baseUrl}common';
  static const String allProducts = '${baseUrl}all';
  static String productDetails(int productId) => '${baseUrl}product/$productId';
}
