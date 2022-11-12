import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimention.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableWidgettext extends StatefulWidget {
  final String text;
  const ExpandableWidgettext({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableWidgettext> createState() => _ExpandableWidgettextState();
}

class _ExpandableWidgettextState extends State<ExpandableWidgettext> {

  late String firstHalf;
  late String secondHalf;

  bool hiddentext = true;

  double textHeight = Dimensions.screenHeight/5.96;

  @override void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor,size: Dimensions.font16, text: firstHalf):Column(
        children: [
          SmallText(height: 1.8, color: AppColors.paraColor, size: Dimensions.font16, text: hiddentext?(firstHalf+"...."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddentext=!hiddentext;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more",color: AppColors.mainColor,),
                Icon(hiddentext?Icons.arrow_drop_down:Icons.arrow_drop_up ,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}