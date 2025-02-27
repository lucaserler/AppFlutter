import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return SignInScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchtColor,
              CustomColors.customSwatchtColor.shade200,
              CustomColors.customSwatchtColor.shade200,
              CustomColors.customSwatchtColor.shade400,
              CustomColors.customSwatchtColor.shade600,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppNameWidget(
              greenTileColor: CustomColors.customContrastColorNomeApp,
              textSize: 40,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}
