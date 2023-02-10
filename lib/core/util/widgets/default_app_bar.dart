import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget defaultAppBar({required BuildContext context,required String appBarBackground,}){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
              appBarBackground,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              Assets.images.svg.arrowBack,
            ),
          ),
        ),
      ],
    ),
  );
}
