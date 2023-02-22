import 'package:besmkallahom/features/home/presentation/screens/quran/surah_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SurahScreen extends StatelessWidget {
  SurahScreen({Key? key, required this.surahNum}) : super(key: key);

  int surahNum;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    return SurahWidget(surahNumber: surahNum,);
  }
}
