import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/foodpagebody.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          children: [
            //Showing The Header
            Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "INDIA", color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "Kerala", color: Colors.black54),
                            const Icon(Icons.arrow_drop_down_circle_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Showing The Body
            Expanded(child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ));
  }
}
