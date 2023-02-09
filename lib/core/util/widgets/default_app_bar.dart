import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget defaultAppBar({required BuildContext context,required String appBarBackground,}){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Stack(
      children: [

        SvgPicture.asset(appBarBackground),
      ],
    ),
  );
}
