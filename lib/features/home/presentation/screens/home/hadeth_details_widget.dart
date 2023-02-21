import 'package:besmkallahom/core/util/cubit/cubit.dart';
import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_app_bar.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:besmkallahom/features/home/presentation/widgets/azkar_build_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/resources/colors_manager.dart';

class HadethDetailsWidget extends StatelessWidget {
  HadethDetailsWidget({Key? key , required this.title, required this.bookName}) : super(key: key);
  String title;
  String bookName;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    AppBloc appBloc = AppBloc.get(context);

    homeCubit.hadith(pageNum: homeCubit.pageNum, bookName: bookName);

    return SafeArea(
      child: BlocBuilder<HomeCubit,HomeState>(
        builder: (context, state) {
          return  Column(
            children: [
              defaultAppBar(
                context: context,
                appBarBackground: Assets.images.svg.appbar_hadeth_details,
                title: title,
              ),
              verticalSpace(5.h),
              if(appBloc.isAppConnected == false)
              Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.rSp),
                      child: Image.asset(
                        Assets.images.png.network_error,
                        height: 100.h,
                        width: 100.w,
                      ),
                    ),
                  ),
                ),
              if(homeCubit.hadithResult != null)
              Expanded(
                  child: Padding(
                    padding: designApp,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return AzkarBuildItem(
                          title: homeCubit.hadithResult![index].hadithArabic,
                        );
                      },
                      itemCount: homeCubit.hadithResult!.length,
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 2.h),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: ()
                          {
                            homeCubit.changePrevPage();
                            homeCubit.hadith(pageNum: homeCubit.pageNum, bookName: bookName);
                           // homeCubit.scrollToTop();
                          },
                          icon: Icon(
                            Icons.skip_previous,
                            color: ColorsManager.mainCard,
                            size: 40.rSp,
                          )),
                    ),

                    DefaultText(title: '${homeCubit.pageNum}' , style: Style.medium , fontWeight: FontWeight.w600,fontSize: 18.rSp),

                    Expanded(
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: ()
                          {
                            homeCubit.changeNextPage();
                            homeCubit.hadith(pageNum: homeCubit.pageNum, bookName: bookName);
                            // homeCubit.scrollToTop();
                          },
                          icon: Icon(
                            Icons.skip_next,
                            color: ColorsManager.mainCard,
                            size: 40.rSp,
                          )),
                    ),

                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
