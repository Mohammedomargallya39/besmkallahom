import 'package:besmkallahom/features/home/presentation/screens/quran/surah_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    return const Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
          child: SurahWidget()
      ),
    );
  }
}
