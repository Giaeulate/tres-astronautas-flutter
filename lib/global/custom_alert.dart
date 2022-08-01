import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

showCustomAlertLoading(BuildContext context, {String? text}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(
        text ?? "Cargando...",
        style: const TextStyle(
          color: Color(0xff00064f),
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      content: const SizedBox(
        height: 70,
        child: CustomLoading(),
      ),
    ),
  );
}

showCustomAlert(BuildContext context, String title, String subtitle,
    {onPress, backgroundColor, textColor}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        subtitle,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        MaterialButton(
          elevation: 5,
          textColor: textColor,
          onPressed: onPress ?? () => Navigator.pop(context),
          child: Text(
            "Aceptar",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

showCustomQuestionAlert(BuildContext context, String title,
    {onPress, backgroundColor, textColor, onLeftPress}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: backgroundColor,
      title: CustomText(title),
      actionsPadding: const EdgeInsets.only(bottom: 30),
      actions: [
        MaterialButton(
          elevation: 5,
          textColor: textColor,
          onPressed: onLeftPress ?? () => Navigator.pop(context),
          child: const CustomText('No'),
        ),
        MaterialButton(
          elevation: 5,
          textColor: textColor,
          onPressed: onPress ?? () => Navigator.pop(context),
          child: const CustomText("Si"),
        ),
      ],
    ),
  );
}
