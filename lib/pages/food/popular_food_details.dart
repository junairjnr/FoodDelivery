import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
//import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/expandablewidget.dart';
import 'package:food_delivery/widgets/icon_name_container.dart';
import 'package:food_delivery/widgets/icon_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
 const PopularFoodDetails({Key? key, required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    //print("screenheight"+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgroundImage
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                //height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                        ))),
              )),

          //icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(page=="cartpage"){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    }
                      ,
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                 GetBuilder<PopularProductController>(builder: (controller){
                   return GestureDetector(
                     onTap: (){
                       if(controller.totalItems>=1) {
                         Get.toNamed(RouteHelper.getCartPage());
                       }else{
                         Get.snackbar("Dear user", "Your Cart Is Empty..Please Add Something..!",
                             backgroundColor: AppColors.mainColor,
                             colorText: Colors.white);
                       }
                     },
                     child: Stack(
                       children: [
                           AppIcon(icon: Icons.shopping_cart_outlined),
                         controller.totalItems>=1?
                         Positioned(
                             right:0,
                             top:0,
                             child: AppIcon(
                               icon: Icons.circle,
                               size: 20,iconcolor: Colors.transparent
                               ,backgroundcolor: AppColors.mainColor,
                             )):
                         Container(),
                           controller.totalItems>=1?
                         Positioned(
                             right:4,
                             top:4,
                             child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                             size: 12,color: Colors.white,)):
                         Container()
                       ],
                     ),
                   );
                 })
                ],
              )),
          //indroduction food
          Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 60,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconNameContainer(
                        text: product.name!,
                        rating: "4.5",
                      ),
                      SizedBox(
                        height: Dimensions.height15,
                      ),
                      BigText(text: "indroduce"),
                     SmallText(text: product.description!),
                  // SingleChildScrollView(
                  //   child: Text("Whether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavour."),
                  // )
                  //    ExpandableWidgettext(text: "Whether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavour.",)
                      //SingleChildScrollView(child: ExpandableText(text: "Whether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavour."))
                    ],
                  ))),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProdct) {
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
                    GestureDetector(
                      onTap: (){
                        popularProdct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    BigText(text: popularProdct.inCartItem.toString()),
                    SizedBox(width: Dimensions.width10),
                    GestureDetector(
                      onTap: (){
                      popularProdct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProdct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      right: Dimensions.width15,
                      left: Dimensions.width15),
                    child: BigText(
                      text: "\$ ${product.price!} | Add to cart",
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
