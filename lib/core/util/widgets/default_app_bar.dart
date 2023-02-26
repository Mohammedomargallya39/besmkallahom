import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/assets.gen.dart';
import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import 'default_text.dart';

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  required String appBarBackground,
  String? title,
  VoidCallback? onTap,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
            SvgPicture.asset(
              appBarBackground,
            ),
            if (title != null)
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: DefaultText(
                  title: title,
                  style: Style.medium,
                  color: ColorsManager.white,
                  fontSize: 18.rSp,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ]),
        ),
        IconButton(
            onPressed: onTap ??
                () {
                  Navigator.pop(context);
                },
            icon: SvgPicture.asset(
              Assets.images.svg.backIcon,
              color: ColorsManager.white,
            )),
      ],
    ),
    toolbarHeight: 10.h,
  );
}
