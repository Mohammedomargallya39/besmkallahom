import 'package:besmkallahom/core/network/local/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '/core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import 'core/util/resources/constants_manager.dart';
import 'features/home/presentation/controller/bloc.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  currentLat = position.latitude;
  currentLng = position.longitude;
  await di.init();
  salahTimes = [
    await sl<CacheHelper>().get('fajr') ?? 'Open Network',
    await sl<CacheHelper>().get('sunrise') ?? 'Open Network',
    await sl<CacheHelper>().get('dhuhr') ?? 'Open Network',
    await sl<CacheHelper>().get('asr') ?? 'Open Network',
    await sl<CacheHelper>().get('maghrib') ?? 'Open Network',
    await sl<CacheHelper>().get('ishaa') ?? 'Open Network',
  ];
  debugPrintFullText(salahTimes.toString());
  bool isRtl = false;
  String translation = await rootBundle.loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    isRtl: isRtl,
    translation: translation,
    widget: const SplashScreen(),
  ));

}

class MyApp extends StatelessWidget {
  final bool isRtl;
  final String translation;
  final Widget widget;

  MyApp({
    Key? key,
    required this.isRtl,
    required this.translation,
    required this.widget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<AppBloc>()
            ..setThemes(
              rtl: isRtl,
            )
            ..setTranslation(
              translation: translation,
            )
            ..connectivityListener(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<HomeCubit>()..adan(year: DateTime.now().year.toString(), month: DateTime.now().month.toString(), day: DateTime.now().day.toString(), lat: currentLat.toString(), lng: currentLng.toString(), method: '5')
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nkhtem',
            debugShowCheckedModeBanner: false,
            themeMode:ThemeMode.light,
            theme: AppBloc.get(context).lightTheme,
            home: widget,
          );
        },
      ),
    );
  }
}

