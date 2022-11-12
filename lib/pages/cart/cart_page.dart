import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_Prdct_cntroller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //contains icons on top
          Positioned(
            top: Dimensions.height20*3,
              right: Dimensions.width20,
              left: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               AppIcon(icon: Icons.arrow_back_ios,
               iconcolor: Colors.white,
               backgroundcolor: AppColors.mainColor,
               iconSize: Dimensions.iconSize24,),
               SizedBox(width: Dimensions.width20*5,),
               GestureDetector(
                 onTap: (){
                   Get.toNamed(RouteHelper.getInitial());
                 },
                 child: AppIcon(icon: Icons.home_outlined,
                   iconcolor: Colors.white,
                   backgroundcolor: AppColors.mainColor,
                   iconSize: Dimensions.iconSize24,),
               ),
               AppIcon(icon: Icons.shopping_cart,
                 iconcolor: Colors.white,
                 backgroundcolor: AppColors.mainColor,
                 iconSize: Dimensions.iconSize24,)
             ],
          )),
          //contain the list container
          Positioned(
            top: Dimensions.height20*5,
              right: Dimensions.width20,
              left: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
            // color: Colors.greenAccent,
                child: MediaQuery.removePadding(
                  context: context,
                    removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length ,
                        itemBuilder: (_,index){
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20*5,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    var popularIndex = Get.find<PopularProductController>().popularProductList
                                        .indexOf(_cartList[index].product!);
                                    if(popularIndex>=0){
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                                    }else{
                                      var recommendedIndex = Get.find<RecommendedPrdctController>().recommendedPrdctList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartpage"));

                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height20*5,
                                    height: Dimensions.height20*5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                             AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width15,),
                                Expanded(child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!,color: Colors.black54,),
                                      SmallText(text: "spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: cartController.getItems[index].price.toString(),color: Colors.red,),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                right: Dimensions.width10,
                                                left: Dimensions.width10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(width: Dimensions.width10),
                                                BigText(text: _cartList[index].quantity.toString()),//popularProdct.inCartItem.toString()),
                                                SizedBox(width: Dimensions.width10),
                                                GestureDetector(
                                                  onTap: (){
                                                    cartController.addItem(_cartList[index].product!, 1);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          );

                        });
                  },)
                ),
          ))
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
          return Container(
            height: Dimensions.bottombarheight,
            //height: 120,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                right: Dimensions.width20,
                left: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttenBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      right: Dimensions.width15,
                      left: Dimensions.width15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10),
                      BigText(text: "\$ "+cartController.totalAmount.toString()),
                      SizedBox(width: Dimensions.width10),
                  ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                   // popularProdct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        right: Dimensions.width15,
                        left: Dimensions.width15),
                    child: BigText(
                      text: "Check Out ",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                  ),
                )
              ],
            ),
          );
        },)
    );

  }
}
