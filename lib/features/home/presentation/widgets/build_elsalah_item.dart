import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildElsalahItem extends StatelessWidget {
   BuildElsalahItem({Key? key,required this.elsalahImage,required this.elsalah}) : super(key: key);


  String elsalahImage;
  String elsalah;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SvgPicture.asset(elsalahImage),
            const DefaultText(title: '05:00', style: Style.small,color: ColorsManager.white,)
          ],
        ),
        verticalSpace(1.h),
        DefaultText(title: elsalah, style: Style.medium,fontWeight: FontWeight.bold,)
      ],
    );
  }
}
