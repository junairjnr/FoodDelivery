
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recomonded_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_name_container.dart';
import 'package:food_delivery/widgets/icon_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_Prdct_cntroller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pegeViewContainer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // To get size of width & weight
     print("the width"+MediaQuery.of(context).size.width.toString());
     print("the height"+MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
            //  color: Colors.black,
            height: Dimensions.pegeView,
             child: PageView.builder(
                  controller: _pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, possition) {
                    return _buildPageItem(possition, popularProducts.popularProductList[possition]);
                  }),

          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),

        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  DotsIndicator(
            dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: "."),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: SmallText(text: "Food Pairing"),
                margin: const EdgeInsets.only(bottom: 3),
              )
            ],
          ),
        ),
        //----Recommended
        //List of food And images
        GetBuilder<RecommendedPrdctController>(builder: (recommendedProducts){
          return recommendedProducts.isLoaded?ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProducts.recommendedPrdctList.length,
                //itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10,top: Dimensions.height10),
                        child: Row(
                          children: [

                            //image section
                            Container(
                              height: Dimensions.listViewimgSize,
                              width: Dimensions.listViewimgSize,
                              // height: 50,
                              //width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                                  color: Colors.white54,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      // image:AssetImage(
                                      //   "assets/images/food2.png"
                                      // )
                                      image: NetworkImage(
                                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProducts.recommendedPrdctList[index].img!
                                        // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProducts.recommendedProductList[index].img!
                                      )
                                  )
                              ),
                            ),

                            //text container
                            Expanded(
                              child: Container(
                                //height: Dimensions.listViewTextcontnrsize,
                                height: 95,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(Dimensions.radius20),
                                        topLeft: Radius.circular(Dimensions.radius20),
                                        bottomRight: Radius.circular(Dimensions.radius20),
                                        bottomLeft: Radius.circular(Dimensions.radius20)
                                    ),
                                    color: Color.fromARGB(137, 219, 216, 216)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: Dimensions.height10,),
                                      BigText(text: recommendedProducts.recommendedPrdctList[index].name!),
                                      SizedBox(height: Dimensions.height10,),
                                      SmallText(text: recommendedProducts.recommendedPrdctList[index].description!),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconcolor: AppColors.iconColor1),
                                          IconTextWidget(
                                              icon: Icons.location_on,
                                              text: "17 km",
                                              iconcolor: AppColors.mainColor),
                                          IconTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32 min",
                                              iconcolor: AppColors.iconColor2),
                                        ],
                                      )
                                    ],

                                  ),),
                              ),
                            )
                          ],)

                    ),
                  );
                },
          ):
          CircularProgressIndicator(
            color: AppColors.mainColor,
          );

        })

      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct) {
    //-----Transforastion in scroll
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(




            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index, "home"));
            },
            child: Container(
              height: Dimensions.pegeViewContainer,
             // height: 320,
              margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                      )
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pegeViewTextContainer,
              //height: 180,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, right: 15, left: 15),
                  child: IconNameContainer(text: popularProduct.name!,rating: "4.5",)
              ),
            ),
          )
        ],
      ),
    );
  }
}
