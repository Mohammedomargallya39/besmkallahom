import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_app_bar.dart';
import 'package:besmkallahom/features/home/presentation/screens/home/hadeth_details_screen.dart';
import 'package:besmkallahom/features/home/presentation/widgets/azkar_build_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/util/resources/appString.dart';
import '../../../../../core/util/resources/assets.gen.dart';
import '../../../../../core/util/widgets/default_text.dart';

class AhadethWidget extends StatelessWidget {
  const AhadethWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> ahadethBooks = [
      AppString.elbokhary,
      AppString.moslem,
      AppString.altormozy,
      AppString.ebnMaga,
      AppString.aboDawood,
    ];

    List<String> bookName = [
      'sahih-bukhari',
      'sahih-muslim',
      'al-tirmidhi',
      'ibn-e-majah',
      'abu-dawood',
    ];

    return Column(
      children: [
        defaultAppBar(
            context: context, appBarBackground: Assets.images.svg.appbar_hadeth
        ),
        verticalSpace(8.h),
        Expanded(
          child: Padding(
            padding: designApp,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: ()
                    {
                      navigateTo(context, HadethDetailScreen(
                        title: ahadethBooks[index],
                        bookName: bookName[index],
                      ));
                    },
                    child: AzkarBuildItem
                      (title: ahadethBooks[index],),
                  );
                },
                itemCount: ahadethBooks.length,
            ),
          ),
        ),
      ],
    );
  }
}
