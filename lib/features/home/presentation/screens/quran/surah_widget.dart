import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/util/resources/constants_manager.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    int? pressedIndex;
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        return SafeArea(
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
                            title: 'الفاتحة',
                            style: Style.medium,
                            fontSize: 30.rSp,
                            fontFamily: 'arabic',
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: ()
                            {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_forward_ios)
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset(
                                Assets.images.png.surahCard
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DefaultText(
                                  align: TextAlign.end,
                                  title: 'سورة الفاتحة',
                                  style: Style.medium,
                                  fontSize: 20.rSp,
                                  color: ColorsManager.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'arabic',
                                ),
                                verticalSpace(1.h),
                                DefaultText(
                                  align: TextAlign.end,
                                  title: 'بسم الله الرحمن الرحيم',
                                  style: Style.medium,
                                  fontSize: 20.rSp,
                                  color: ColorsManager.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'arabic',
                                ),
                              ],
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(1.h),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: ()
                      {
                        pressedIndex = index;
                        homeCubit.ayahPressed();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        child: Row(
                          children: [
                            Expanded(
                              flex:10,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.rSp),
                                    color: homeCubit.ayahPressedValue == true && pressedIndex == index? ColorsManager.lightMainCard : ColorsManager.lightGrey
                                ),
                                child: Padding(
                                  padding: designApp,
                                  child: DefaultText(
                                    title: 'الحمد لله رب العالمين',
                                    maxLines: 5,
                                    style: Style.large,
                                    fontSize: 18.rSp,
                                    fontWeight: FontWeight.w600,
                                    align: TextAlign.start,
                                    color: homeCubit.ayahPressedValue == true && pressedIndex == index? ColorsManager.white: ColorsManager.black,
                                    fontFamily: 'arabic',
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(1.w),
                            Expanded(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      Assets.images.svg.mark,
                                      color: homeCubit.ayahPressedValue == true && pressedIndex == index? ColorsManager.warning : ColorsManager.darkGrey,
                                  ),
                                  CircleAvatar(
                                    maxRadius: 15.rSp,
                                    backgroundColor: ColorsManager.mainCard,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0.8.h),
                                      child: DefaultText(
                                        align: TextAlign.center,
                                        title: '1',
                                        style: Style.medium,
                                        color: ColorsManager.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.rSp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: 7,
                ),
              ),



            ],
          ),
        );
      },
    );
  }
}
