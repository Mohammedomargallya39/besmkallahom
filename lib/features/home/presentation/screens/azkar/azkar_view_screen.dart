import 'package:besmkallahom/features/home/presentation/screens/azkar/azkar_view_widget.dart';
import 'package:flutter/material.dart';

class AzkarViewScreen extends StatelessWidget {
  AzkarViewScreen({Key? key, required this.azkarIndex}) : super(key: key);
  int azkarIndex;

  @override
  Widget build(BuildContext context) {



    return AzkarViewWidget(azkarIndex: azkarIndex,);
  }
}
