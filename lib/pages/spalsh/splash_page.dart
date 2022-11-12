
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_Prdct_cntroller.dart';
import '../../utils/dimention.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> with TickerProviderStateMixin {

 late Animation<double> animation;
 late AnimationController controller;
 Future<void>_loadResources() async{
   await Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedPrdctController>().getRecommendedPrdctList();
 }
 @override
 void initState(){
  super.initState();
  _loadResources();
  controller =  AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2))..forward();
  animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  Timer(
    const Duration(
      seconds: 3),
      ()=>Get.offNamed(RouteHelper.getInitial())
  );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/images/foodLogo.png",width: 250,))),
          SizedBox(height: Dimensions.height20,),

           BigText(text: "The Best Food",)
        ],
      ),
    );
  }
}
