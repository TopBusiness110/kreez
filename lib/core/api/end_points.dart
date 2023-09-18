class EndPoints {
  static const String baseUrl = 'https://store.topbuziness.com/';
  static const String registerUrl = '${baseUrl}api/res.users/';
  static const String loginUrl = '${baseUrl}auth';
  static const String allCategoriesUrl = '${baseUrl}api/product.public.category';
  static const String createSaleOrderUrl = '${baseUrl}api/sale.order/';
  static const String createSaleOrderLineUrl = '${baseUrl}api/sale.order.line';
  static const String getAllSaleOrderForPartnerUrl = '${baseUrl}api/sale.order/';
  static const String getProductsByCategoryIdUrl = '${baseUrl}api/product.product/';
 // static const String searchProductUrl = '${baseUrl}api/product.product/';
  static const String searchProductUrl = 'https://store.topbuziness.com/api/product.product/?query={id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,description_sale,image_1920}&filter=[["name", "=", "tomato"]]';
  static const String allProductsUrl = '${baseUrl}api/product.product/?query={id,name,list_price,currency_id,is_published,uom_name,uom_id,public_categ_ids,website_ribbon_id,image_1920}&filter=[["is_published", "=", "True"]]';

  // static const String homeUrl = '${baseUrl}home';
  // static const String citiesUrl = '${baseUrl}cities';
  // static const String servicesUrl = '${baseUrl}services/';
  // static const String editServicesUrl = '${baseUrl}services/update/';
  // static const String favoriteUrl = '${baseUrl}services/get-favourites';
  // static const String myServicesUrl = '${baseUrl}services/my_services';
  // static const String updateProfileUrl = '${baseUrl}client/auth/update-profile';
  // static const String settingUrl = '${baseUrl}setting';
  // static const String serviceStoreUrl = '${baseUrl}services/store';
  // static const String categoriesUrl = '${baseUrl}categories';
  // static const String rateUrl = '${baseUrl}services/add-rate';
  // static const String addToFavouriteUrl = '${baseUrl}services/add-to-favourites';
  // static const String deepLink = '${baseUrl}details/';
  // static const String searchUrl = '${baseUrl}search';
  // static const String notificationUrl = '${baseUrl}notifications';





}
