import 'package:besmkallahom/core/util/cubit/cubit.dart';
import 'package:besmkallahom/core/util/cubit/state.dart';
import 'package:besmkallahom/core/util/resources/appString.dart';
import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_app_bar.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/controller/bloc.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:besmkallahom/features/home/presentation/widgets/build_elsalah_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';

class ElsalahTimeWidget extends StatelessWidget {
  const ElsalahTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    List<String> elsalahImages = [
      Assets.images.svg.elfagr,
      Assets.images.svg.elfagr,
      Assets.images.svg.eldhohr,
      Assets.images.svg.elasr,
      Assets.images.png.elmaghrb,
      Assets.images.svg.eleshaa,
    ];

    List<String> elsalah = [
      AppString.elfagr,
      AppString.eldoha,
      AppString.eldhohr,
      AppString.elasr,
      AppString.elmaghrb,
      AppString.eleshaa,
    ];
    List<String>? timers;
    HomeCubit homeCubit = HomeCubit.get(context);
    if(homeCubit.adanResult != null){
      timers=
      [
        homeCubit.adanResult![DateTime.now().day -1].timings.fajr.substring(0,5),
        homeCubit.adanResult![DateTime.now().day -1].timings.sunrise.substring(0,5),
        homeCubit.adanResult![DateTime.now().day -1].timings.dhuhr.substring(0,5),
        homeCubit.adanResult![DateTime.now().day -1].timings.asr.substring(0,5),
        homeCubit.adanResult![DateTime.now().day -1].timings.maghrib.substring(0,5),
        homeCubit.adanResult![DateTime.now().day -1].timings.ishaa.substring(0,5),
      ];
    }else if (homeCubit.adanResult == null){
      timers = salahTimes;
    }else if (homeCubit.adanResult == null && salahTimes == null){
      timers = ['','','','','','',];
    }

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              appBarBackground: Assets.images.svg.elsalahTimeAppBar),
          body: Padding(
            padding: designApp,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocBuilder<AppBloc,AppState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                        children: [
                          const DefaultText(
                              title: AppString.elsalahAlarm, style: Style.small),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              homeCubit.changAlarm();
                            },
                            child: SvgPicture.asset(homeCubit.alarmIcon
                                ? Assets.images.svg.alarmTrue
                                : Assets.images.svg.alarmFalse),
                          )
                        ],
                      ),
                      verticalSpace(1.h),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(15.rSp),
                            child: GridView.count(
                              crossAxisCount: 2,
                              physics: const BouncingScrollPhysics(),
                              children: List.generate(
                                  elsalahImages.length,
                                      (index) => BuildElsalahItem(
                                    elsalahImage: elsalahImages[index],
                                    elsalah: elsalah[index],
                                    indexImage: index,
                                    timer: timers![index],
                                  )),
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: SvgPicture.asset(Assets.images.svg.salahZekr),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
