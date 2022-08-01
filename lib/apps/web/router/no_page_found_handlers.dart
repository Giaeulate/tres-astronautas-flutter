import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    return const Center(
      child: CustomText(
        "Página no encontrada 404",
        fontSize: 30,
        textAlign: TextAlign.center,
      ),
    );
  });
}
