import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/controllers/recommended_Prdct_cntroller.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandablewidget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;

 const RecommendedFoodDetails({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedPrdctController>().recommendedPrdctList[pageId];
    Get.find<RecommendedPrdctController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page=="cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                    child: AppIcon(icon: Icons.clear,)),
              //  AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<RecommendedPrdctController>(builder: (controller){
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
                        Get.find<RecommendedPrdctController>().totalItems>=1?
                        Positioned(
                            right:4,
                            top:4,
                            child: BigText(text: Get.find<RecommendedPrdctController>().totalItems.toString(),
                              size: 12,color: Colors.white,)):
                        Container()
                      ],
                    ),
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(


                child: Center(child: BigText(size: Dimensions.font26, text: product.name!)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular( Dimensions.radius20),
                      topRight:Radius.circular( Dimensions.radius20),

                    )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  //child: ExpandableWidgettext(text: " Whether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavourWhether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavourWhether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavourWhether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavourWhether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavourWhether, it is a Sunday lunch with family or a weekend party with friends, you can rarely go wrong with a Chicken Biryani! While the cooking process can be slightly lengthy, the simplicity makes up for it. Serve it with some raita or a salad, because you don’t really need too many things on the table when you have a big handi of aromatic, flavourful biryani! Just make sure you retain chicken on the bone for maximum flavour"),
                  child: Text(product.description!+"  "
                      "For know--The best sweet dessertThe quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty."),
                  margin: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedPrdctController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: Dimensions.width20*2.5,
                  left: Dimensions.width20*2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconcolor: Colors.white,
                        backgroundcolor: AppColors.mainColor,
                        icon: Icons.remove),
                  ),
                  BigText(text: " \$ ${product.price!} X ${controller.inCartItem} ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                    controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconcolor: Colors.white,
                        backgroundcolor: AppColors.mainColor,
                        icon: Icons.add),
                  )
                ],
              ),
            ),
            Container(
              height: Dimensions.bottombarheight,
              // height: 120,
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
                  // GestureDetector(
                  //   onTap: (){
                  //
                  //     // Get.snackbar("Dear user", "You Liked this Product..!",
                  //     //     backgroundColor: AppColors.mainColor,
                  //     //     colorText: Colors.white);
                  //     // Colors.red;
                  //     var _red = controller.hearttouch();
                  //     if(_red == true){
                  //
                  //     }
                   Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height15,
                            bottom: Dimensions.height15,
                            right: Dimensions.width15,
                            left: Dimensions.width15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white),
                        child: GestureDetector(
                          onTap: (){
                                Get.snackbar("Dear user", "You Liked this Product..!",
                                backgroundColor: AppColors.mainColor,
                                colorText: Colors.white);
                                },
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,),
                        )
                    ),

                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);

                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height15,
                          bottom: Dimensions.height15,
                          right: Dimensions.width15,
                          left: Dimensions.width15),
                      child: BigText(
                        text: "\$ ${controller.totalAmount.toString()}| Add to cart",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },),
    );
  }
}