import 'package:besmkallahom/core/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import '/core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import 'core/util/resources/constants_manager.dart';
import 'features/home/presentation/controller/bloc.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await di.init();
  salahTimes = [
    await sl<CacheHelper>().get('fajr') ?? 'Open Network',
    await sl<CacheHelper>().get('sunrise') ?? 'Open Network',
    await sl<CacheHelper>().get('dhuhr') ?? 'Open Network',
    await sl<CacheHelper>().get('asr') ?? 'Open Network',
    await sl<CacheHelper>().get('maghrib') ?? 'Open Network',
    await sl<CacheHelper>().get('ishaa') ?? 'Open Network',
  ];

  permission = await sl<CacheHelper>().get('permission') ?? false;

  if (permission == true) {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLat = position.latitude;
    currentLng = position.longitude;
  }

  Future<void> scheduleDailyNotification() async {
    var time = const Time(16,33,0); // Set the notification time
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel id', 'channel name',
        importance: Importance.max,
        priority: Priority.high,
        sound: UriAndroidNotificationSound("assets/sound/adan.mp3"),
        playSound: true);
    var iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails(presentSound: false);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0, 'Title', 'Notification message', time, platformChannelSpecifics);
  }

  scheduleDailyNotification();

  debugPrintFullText(salahTimes.toString());
  bool isRtl = false;
  String translation = await rootBundle
      .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    isRtl: isRtl,
    translation: translation,
    widget: const SplashScreen(),
    flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
  ));
}

class MyApp extends StatelessWidget {
  final bool isRtl;
  final String translation;
  final Widget widget;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  MyApp(
      {Key? key,
      required this.isRtl,
      required this.translation,
      required this.widget,
      required this.flutterLocalNotificationsPlugin})
      : super(key: key);

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
          create: (BuildContext context) => sl<HomeCubit>()..getSavedData(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Nkhtem',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppBloc.get(context).lightTheme,
            home: widget,
          );
        },
      ),
    );
  }
}
