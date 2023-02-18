import 'package:besmkallahom/features/home/presentation/screens/home/hadeth_details_widget.dart';
import 'package:flutter/material.dart';

class HadethDetailScreen extends StatelessWidget {
  HadethDetailScreen({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HadethDetailsWidget(
        title: title,
      ),
    );
  }
}
