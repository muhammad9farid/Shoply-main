
import 'package:flutter/material.dart';
import 'package:stylish_app/modules/auth/ui/widgets/custom_body_splash.dart';
import 'package:stylish_app/modules/auth/ui/widgets/custom_polts.dart';
import 'package:stylish_app/modules/auth/ui/widgets/custom_text_button.dart';
import 'package:stylish_app/modules/auth/ui/widgets/custom_top_splash.dart';


class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTopSplash(text1: '1'),
            const CustomBodySplash(
              text2: 'Choose Products',
              image: 'assets/images/fashion shop-rafiki 1.png',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //CustomTextButton(textButton: ''),
                      const SizedBox(height: 16),
                      const CustomPolts(
                        color: Colors.black87,
                        color2: Colors.black12,
                        color3: Colors.black12),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'S3');
                          },
                          child: const CustomTextButton(
                              textButton: 'Next', color: Colors.red,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}