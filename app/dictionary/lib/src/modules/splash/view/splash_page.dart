import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../src_exports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    if (layout != "") {
      Future.delayed(const Duration(seconds: 2), () {
        Modular.to.navigate("/$layout/");
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Modular.to.navigate("/error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/lottie/loading.json",
        fit: BoxFit.fitHeight,
        repeat: false,
      ),
    );
  }
}
