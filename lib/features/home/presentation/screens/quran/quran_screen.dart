import 'package:besmkallahom/features/home/presentation/screens/quran/quran_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    return const Scaffold(
      body: QuranWidget(),
    );
  }
}
