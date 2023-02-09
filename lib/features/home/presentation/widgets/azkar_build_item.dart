import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AzkarBuildItem extends StatelessWidget {
  AzkarBuildItem({Key? key,required this.itemBackground}) : super(key: key);

  String itemBackground;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.rSp),
      child: Container(
        width: double.infinity,
        height: 8.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.rSp)
        ),
        child: SvgPicture.asset(itemBackground)
        ),
      );

  }
}
