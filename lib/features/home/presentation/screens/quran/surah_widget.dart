import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/core/util/widgets/option_dialog.dart';
import 'package:besmkallahom/core/util/widgets/tafseer_dialog.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/resources/constants_manager.dart';
import 'package:quran/quran.dart' as quran;


class SurahWidget extends StatelessWidget {
  SurahWidget({Key? key, required this.surahNum}) : super(key: key);

  int surahNum;
  
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    int? pressedIndex;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is TafseerSuccessState)
        {
          // designToastDialog(
          //     context: context,
          //     toast: TOAST.info,
          //     text: homeCubit.tafseerResult!.tafseer,
          // );
          
          showDialog(
              context: context,
              builder: (context) {
                return TafseerDialog(tafseer: homeCubit.tafseerResult!.tafseer);
              },
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: designApp,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DefaultText(
                              align: TextAlign.end,
                              title: quran.getSurahNameArabic(surahNum),
                              style: Style.medium,
                              fontSize: 30.rSp,
                              fontFamily: 'arabic',
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                      verticalSpace(5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Image.asset(Assets.images.png.surahCard),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DefaultText(
                                    align: TextAlign.end,
                                    title: quran.getSurahNameArabic(surahNum),
                                    style: Style.medium,
                                    fontSize: 20.rSp,
                                    color: ColorsManager.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'arabic',
                                  ),
                                  verticalSpace(1.h),
                                  if(surahNum !=1 && surahNum !=9)
                                  DefaultText(
                                    align: TextAlign.end,
                                    title:  'بسم الله الرحمن الرحيم' ,
                                    style: Style.medium,
                                    fontSize: 20.rSp,
                                    color: ColorsManager.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'arabic',
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                verticalSpace(1.h),
                SizedBox(
                  height: homeCubit.ayahPressedValue ? 50.h : 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(pressedIndex == index){
                            homeCubit.ayahPressed(false);
                          }else{
                            pressedIndex = index;
                            homeCubit.ayahPressed(true);
                          }

                        },
                        onLongPress: ()
                        {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return OptionsDialog(
                                    message: 'إختر',
                                    firstButtonText: 'التفسير الميسر',
                                    secondButtonText: 'تفسير الجلالين',
                                    thirdButtonText: 'تفسير السعدي',
                                    fourthButtonText: 'تفسير ابن كثير',
                                    fifthButtonText: 'تفسير الطنطاوي',
                                    sixthButtonText: 'تفسير البغوي',
                                    seventhButtonText: 'تفسير القرطبي',
                                    eighthButtonText: 'تفسير الطبري',

                                    height: 40.h,

                                  firstButtonVoidCallback: ()
                                    {

                                      homeCubit.tafseer(
                                          tafseerId: 1,
                                          surahId: surahNum,
                                          ayahId: index+1
                                      );

                                    },
                                  secondButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 2,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  thirdButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 3,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  fourthButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 4,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  fifthButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 5,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  sixthButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 6,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  seventhButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 7,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                  eighthButtonVoidCallback: ()
                                  {
                                    homeCubit.tafseer(
                                        tafseerId: 8,
                                        surahId: surahNum,
                                        ayahId: index+1
                                    );
                                  },
                                );
                              },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 1.h),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rSp),
                                color: homeCubit.ayahPressedValue == true &&
                                        pressedIndex == index
                                    ? ColorsManager.lightMainCard
                                    : ColorsManager.lightGrey),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                              child: DefaultText(
                                title: '${quran.getVerse(surahNum, index + 1)} ${quran.getVerseEndSymbol(index+1)}',
                                style: Style.large,
                                fontSize: 20.rSp,
                                fontWeight: FontWeight.w600,
                                align: TextAlign.center,
                                color: homeCubit.ayahPressedValue == true &&
                                    pressedIndex == index
                                    ? ColorsManager.white
                                    : ColorsManager.black,
                                fontFamily: 'arabic',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: quran.getVerseCount(surahNum),
                  ),
                ),
                if (homeCubit.ayahPressedValue)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 80.rSp),
                    width: double.infinity,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      boxShadow: [
                        BoxShadow(
                            color: ColorsManager.darkGrey.withOpacity(0.5),
                            blurRadius: 15.rSp),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_next,
                                color: ColorsManager.mainCard,
                                size: 40.rSp,
                              )),
                        ),
                        Expanded(
                          child: IconButton(
                              padding: EdgeInsets.only(bottom: 5.h),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle,
                                color: ColorsManager.mainCard,
                                size: 70.rSp,
                              )),
                        ),
                        Expanded(
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_previous,
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
  }
}
