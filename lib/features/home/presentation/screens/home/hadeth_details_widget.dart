import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import '../../../../../core/util/cubit/cubit.dart';
import '../../../../../core/util/cubit/state.dart';
import '../../../../../core/util/resources/assets.gen.dart';
import '../../../../../core/util/resources/colors_manager.dart';
import '../../../../../core/util/resources/constants_manager.dart';
import '../../../../../core/util/widgets/default_app_bar.dart';
import '../../../../../core/util/widgets/default_text.dart';
import '../../controller/bloc.dart';
import '../../controller/state.dart';
import '../../widgets/azkar_build_item.dart';

class HadethDetailsWidget extends StatelessWidget {
  HadethDetailsWidget({Key? key , required this.title, required this.bookName}) : super(key: key);
  String title;
  String bookName;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

    homeCubit.hadith(pageNum: homeCubit.pageNumber, bookName: bookName);

    return SafeArea(
      child: BlocBuilder<AppBloc,AppState>(
        builder: (context, state) {
          return BlocBuilder<HomeCubit,HomeState>(
            builder: (context, state) {
              return state is HadithLoadingState? const Center(child: CircularProgressIndicator()):WillPopScope(
                onWillPop: ()
                async{
                  homeCubit.pageNumber = 1;
                  Navigator.pop(context);
                  return true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          Assets.images.png.appBackground,
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                  child: Column(
                    children: [
                      if(homeCubit.hadithResult != null)
                        Expanded(
                            flex: 11,
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
                      if(homeCubit.hadithResult == null)
                      Expanded(
                        flex: 11,
                        child: Center(
                            child: DefaultText(
                                title: '???????? ???? ?????????????? ??????????????????',
                                style: Style.medium,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.rSp,
                            ),
                          ),
                      ),
                      if(homeCubit.hadithResult == null)
                      const Spacer(),
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
                                    homeCubit.hadith(pageNum: homeCubit.pageNumber, bookName: bookName);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorsManager.mainCard,
                                    size: 40.rSp,
                                  )),
                            ),
                            DefaultText(title: '${homeCubit.pageNumber}' , style: Style.medium , fontWeight: FontWeight.w600,fontSize: 18.rSp),
                            Expanded(
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: ()
                                  {
                                    homeCubit.changeNextPage();
                                    homeCubit.hadith(pageNum: homeCubit.pageNumber, bookName: bookName);
                                    // homeCubit.scrollToTop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsManager.mainCard,
                                    size: 40.rSp,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
