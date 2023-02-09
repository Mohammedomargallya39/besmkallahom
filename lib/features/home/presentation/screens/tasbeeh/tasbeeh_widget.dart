import 'package:besmkallahom/core/util/resources/appString.dart';
import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/back_button.dart';
import 'package:besmkallahom/core/util/widgets/default_app_bar.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TasbeehWidget extends StatelessWidget {
  const TasbeehWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getTotalTasbeeh();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            appBarBackground: Assets.images.svg.tasbehAppBarBackground,
          ),
          body: WillPopScope(
            onWillPop: () async {
              homeCubit.saveTotalTasbeeh();
              return true;
            },
            child: Padding(
              padding: designApp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 12.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.rSp),
                        border: Border.all(color: ColorsManager.mainCard)),
                    child: Center(
                      child: DefaultText(
                        title: '${homeCubit.currentTasbeehNumber}',
                        style: Style.headLarge,
                        color: ColorsManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  verticalSpace(10.h),
                  InkWell(
                    onTap: () {
                      homeCubit.saveTotalTasbeeh();
                    },
                    highlightColor: ColorsManager.transparent,
                    splashColor: ColorsManager.transparent,
                    child: Container(
                      width: 8.w,
                      height: 4.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManager.mainCard),
                    ),
                  ),
                  verticalSpace(1.h),
                  InkWell(
                    onTap: () {
                      homeCubit.changeCurrentTasbeehNumber();
                    },
                    highlightColor: ColorsManager.transparent,
                    splashColor: ColorsManager.transparent,
                    child: Container(
                      width: double.infinity,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          Assets.images.svg.tasbehCounterButton),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.rSp),
                    child: Center(
                        child: DefaultText(
                            title:
                                '${AppString.totalTasbeeh} ${homeCubit.totalTasbeeh}',
                            style: Style.headSmall)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
