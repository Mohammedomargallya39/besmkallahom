import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/util/resources/appString.dart';
import '../../../../../core/util/resources/assets.gen.dart';
import '../../../../../core/util/resources/colors_manager.dart';
import '../../../../../core/util/resources/constants_manager.dart';
import '../../../../../core/util/widgets/myText.dart';
import '../../controller/bloc.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  Stream<int> counterStream = Stream.periodic(const Duration(seconds: 20), (int i) => i);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: designApp,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myText(
                  title: AppString.appName,
                  style: Style.medium,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.rSp,
                ),
                verticalSpace(2.h,),
                SvgPicture.asset(Assets.images.svg.icon),
                verticalSpace(2.h,),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            SvgPicture.asset(Assets.images.svg.morningButton),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20.rSp,
                                  top: 5.rSp
                              ),
                              child: myText(
                                title: AppString.morning,
                                style: Style.medium,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.white,
                                fontSize: 16.rSp,
                              ),
                            ),
                          ]),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            SvgPicture.asset(Assets.images.svg.eveningButton),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 20.rSp,
                                  top: 5.rSp
                              ),
                              child: myText(
                                title: AppString.evening,
                                style: Style.medium,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.white,
                                fontSize: 16.rSp,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                verticalSpace(1.h,),
                Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SvgPicture.asset(Assets.images.svg.tasbeh),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 20.rSp,
                            top: 5.rSp
                        ),
                        child: myText(
                          title: AppString.tasbeh,
                          style: Style.medium,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.white,
                          fontSize: 16.rSp,
                        ),
                      ),
                    ]),
                verticalSpace(2.h,),
                Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SvgPicture.asset(Assets.images.svg.slah),
                      StreamBuilder(
                          stream: counterStream,
                          builder: (context, snapshot) {
                            homeCubit.pickRandomHomeSlah();
                            return Padding(
                              padding: EdgeInsets.fromLTRB(20.rSp, 40.rSp, 20.rSp,0),
                              child: myText(
                                align: TextAlign.center,
                                title: homeCubit.pickedRandom!,
                                style: Style.medium,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.white,
                                fontSize: 16.rSp,
                              ),
                            );
                          },
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
