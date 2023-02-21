import 'package:flutter/material.dart';
import 'package:besmkallahom/core/util/resources/extensions_manager.dart';
import '../resources/constants_manager.dart';
import 'myButton.dart';
import 'default_text.dart';

class TafseerDialog extends Dialog {

  String tafseer;

  TafseerDialog({Key? key,required this.tafseer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: SizedBox(
        height: 40.h,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(20.rSp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: DefaultText(
                    title: tafseer, align: TextAlign.center, style: Style.medium, fontWeight: FontWeight.w600,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
