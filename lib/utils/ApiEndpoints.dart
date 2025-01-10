class ApiEndpoints {

  static const String baseUrl = 'https://back.industry.com.sa/api/v1/';


  static const String home = '${baseUrl}home';
 
   static String common(String lang) => '${baseUrl}common?lang=$lang';

  static const String allProducts = '${baseUrl}all';
    static String categories(String lang) => '${baseUrl}categories?lang=$lang';


  static String productDetails(int productId) => '${baseUrl}product/$productId';
}
