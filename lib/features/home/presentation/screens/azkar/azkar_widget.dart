import 'package:besmkallahom/core/util/resources/appString.dart';
import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/screens/azkar/azkar_view_screen.dart';
import 'package:besmkallahom/features/home/presentation/widgets/azkar_build_item.dart';
import 'package:flutter/material.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> itemBackground = [
      Assets.images.svg.morningAzkar,
      Assets.images.svg.eveningAzkar,
      Assets.images.svg.azkarElmasged,
      Assets.images.svg.azkarElnoom,
      Assets.images.svg.azkarElsalah,
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: designApp,
          child: Column(
            children: [
              DefaultText(
                title: AppString.azkar,
                style: Style.medium,
                fontWeight: FontWeight.w600,
                fontSize: 25.rSp,
              ),
              verticalSpace(8.h),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      navigateTo(context, AzkarViewScreen(azkarIndex: index,));
                    },
                    child: AzkarBuildItem(
                      itemBackground: itemBackground[index],
                    ),
                  ),
                  itemCount: itemBackground.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
