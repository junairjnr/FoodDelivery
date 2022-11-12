

import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/spalsh/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/recomonded_food_detail.dart';


class RouteHelper{

  static const String spalashPage = "/spalsh-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cartPage";

   static String getSpalshPage() => '$spalashPage';
   static String getInitial() => '$initial';
   static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
   static String getRecommendedFood(int pageId,String page) => '$recommendedFood?pageId=$pageId&page=$page';
   static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [

    GetPage(name: spalashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),
    //Popoular Food
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
           return PopularFoodDetails(pageId:int.parse(pageId!),page:page!);
           },
        transition: Transition.fadeIn),

    //Recommended Food
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetails(pageId:int.parse(pageId!),page:page!);
    },
        transition: Transition.fadeIn),

    GetPage(name: cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn),
  ];
}