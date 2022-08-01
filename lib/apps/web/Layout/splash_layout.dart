import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomLoading(),
            SizedBox(height: 20),
            CustomText("Verificando..."),
          ],
        ),
      ),
    );
  }
}
