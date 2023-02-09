import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import 'features/home/presentation/controller/bloc.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
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
          create: (BuildContext context) => sl<HomeCubit>()),
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

