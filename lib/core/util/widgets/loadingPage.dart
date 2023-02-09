import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets.gen.dart';


// if (snapshot.connectionState == ConnectionState.waiting) {
// return const LoadingPage();
// }

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Lottie.asset(
          Assets.images.lotti.loading,
          ),
        );
  }
}
