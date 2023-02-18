import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/colors_manager.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_app_bar.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:besmkallahom/features/home/presentation/widgets/azkar_view_build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AzkarViewWidget extends StatelessWidget {
   AzkarViewWidget({Key? key,required this.azkarIndex}) : super(key: key);

  int azkarIndex;

  @override
  Widget build(BuildContext context) {
    int? pressedIndex;

    List<String> appBarBackground = [
      Assets.images.svg.morningAzkarAppBar,
      Assets.images.svg.eveningAzkarAppBar,
      Assets.images.svg.elmasgedAzkarAppBar,
      Assets.images.svg.elnoomAzkarAppBar,
      Assets.images.svg.elsalahAzkarAppBar,
    ];
    List<Color> azkarColor = [
      ColorsManager.orangePrimary,
      ColorsManager.mainCard,
      ColorsManager.mainColor,
      ColorsManager.purple,
      ColorsManager.lightBrown,
    ];

    HomeCubit homeCubit = HomeCubit.get(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            appBarBackground: appBarBackground[azkarIndex],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: designApp,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            pressedIndex = index;
                            homeCubit.changeRepetitionNum(index);
                            if(homeCubit.azkarPressedValue){
                            }
                            if(homeCubit.repetitionNum[index] == 0 ){
                              homeCubit.randomHomeSlah.removeAt(index);
                              homeCubit.repetitionNum.removeAt(index);
                            }
                          },
                          child: AzkarViewBuildItem(
                            repetitionNum: homeCubit.repetitionNum[index],
                            azkar: homeCubit.randomHomeSlah[index],
                            azkarColor: azkarColor[azkarIndex],
                          ),
                        ),
                        itemCount: homeCubit.randomHomeSlah.length,
                      ),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(Assets.images.svg.app_background),
            ],
          ),
        );
      },
    );
  }
}
