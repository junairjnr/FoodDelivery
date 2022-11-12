import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconcolor;
  const IconTextWidget(
      {Key? key,
        required this.icon,
        required this.text,
        required this.iconcolor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconcolor,size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}
