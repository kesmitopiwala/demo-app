import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: Define the routes and set logic accordingly
    // Timer(
    //     const Duration(seconds: 3),
    //         () => GetStorage().read(AppPreferencesHelper.pUser) == null
    // ? Get.offAllNamed(Routes.loginScreen)
    // : Get.offAllNamed(Routes.homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
