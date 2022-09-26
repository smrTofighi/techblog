import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/views/main_view/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //const SplashScreen ({ Key? key }) : super(key: key);
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.off(MainView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.images.techblog.path),
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primery,
                size: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
