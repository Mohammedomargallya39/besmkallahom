import 'package:besmkallahom/core/util/resources/appString.dart';
import 'package:besmkallahom/core/util/resources/assets.gen.dart';
import 'package:besmkallahom/core/util/resources/constants_manager.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import 'package:besmkallahom/core/util/widgets/default_text.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:besmkallahom/features/home/presentation/screens/azkar/azkar_view_screen.dart';
import 'package:besmkallahom/features/home/presentation/screens/azkar/elsalah_time_screen.dart';
import 'package:besmkallahom/features/home/presentation/widgets/azkar_build_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/cubit/cubit.dart';
import '../../controller/bloc.dart';
import 'package:location/location.dart';


class AzkarWidget extends StatelessWidget {
  const AzkarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);
    AppBloc appBloc = AppBloc.get(context);

    List<String> itemBackground = [
      Assets.images.svg.morningAzkar,
      Assets.images.svg.eveningAzkar,
      Assets.images.svg.azkarElmasged,
      Assets.images.svg.azkarElnoom,
      Assets.images.svg.azkarElsalah,
      Assets.images.svg.elsalahTimeButton,
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: designApp,
          child: BlocConsumer<HomeCubit,HomeState>(
            listener: (context, state) {
              if(appBloc.isAppConnected && state is AdanSuccessState && salahTimes![0] == 'Open Network')
              {
                navigateTo(context, const ElsalahTimeScreen());
              }
            },
            builder: (context, state) {
              return Column(
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
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () async{
                          if(index == 5){

                            Location location = Location();
                            PermissionStatus permissionStatus = await location.requestPermission();


                            if(permissionStatus == PermissionStatus.granted)
                            {
                              homeCubit.getLocation();

                              if(appBloc.isAppConnected && homeCubit.lat != null)
                              {
                                homeCubit.adan(
                                    year: DateTime.now().year.toString(),
                                    month: DateTime.now().month.toString(),
                                    day: DateTime.now().day.toString(),
                                    lat: currentLat.toString() ?? '0',
                                    lng: currentLng.toString() ?? '0',
                                    method: '5'
                                );
                              }
                              if(appBloc.isAppConnected == true && salahTimes![0] != 'Open Network')
                              {
                                navigateTo(context, const ElsalahTimeScreen());
                              }

                              if(appBloc.isAppConnected == false )
                              {
                                navigateTo(context, const ElsalahTimeScreen());
                                designToastDialog(
                                    context: context,
                                    toast: TOAST.warning,
                                    text: 'برجاء فتح الانترنت لتحديث الأوقات'
                                );
                              }



                            }

                          }else{
                            navigateTo(context, AzkarViewScreen(azkarIndex: index,));
                          }
                        },
                        child: AzkarBuildItem(
                          itemBackground: itemBackground[index],
                        ),
                      ),
                      itemCount:6,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
