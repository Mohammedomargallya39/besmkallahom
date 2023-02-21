import 'package:besmkallahom/features/home/presentation/screens/home/hadeth_details_widget.dart';
import 'package:flutter/material.dart';

class HadethDetailScreen extends StatelessWidget {
  HadethDetailScreen({Key? key, required this.title, required this.bookName}) : super(key: key);

  String title;
  String bookName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HadethDetailsWidget(
        title: title,
        bookName: bookName,
      ),
    );
  }
}
