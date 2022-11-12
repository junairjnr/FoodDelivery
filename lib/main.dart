import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recomonded_food_detail.dart';
import 'package:food_delivery/pages/home/foodpagebody.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/pages/spalsh/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/recommended_Prdct_cntroller.dart';
import 'helpers/dependencies.dart' as dep;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PopularProductController>(builder: (_){
     return GetBuilder<RecommendedPrdctController>(builder: (_){
       return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       //title: 'Flutter Demo',

       // home: const SplashScreen(),
       initialRoute: RouteHelper.getSpalshPage(),
     getPages: RouteHelper.routes,
     );
     });
   },);
  }
}

