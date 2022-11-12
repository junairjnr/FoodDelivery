import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconNameContainer extends StatelessWidget {
  final String text;
  final String rating;
  const IconNameContainer({Key? key, required this.text, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) {
                  return Icon(
                    Icons.stars,
                    color: AppColors.mainColor,
                  );
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: rating),
            SizedBox(
              width: 15,
            ),
            SmallText(text: "1237"),
            SizedBox(
              width: 5,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
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

        ),

      ],

    );
  }
}
