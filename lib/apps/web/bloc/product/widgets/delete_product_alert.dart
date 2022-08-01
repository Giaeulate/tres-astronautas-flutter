import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/api/product_api.dart';
import 'package:tres_astronauntas_demo/models/product_model.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

showDeleteProductAlert(context, Function() onPress, ProductModel model) {
  bool errorResp = false;
  String errorRespText = "";
  bool loading = false;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const CustomText(
          "Eliminar producto",
          textAlign: TextAlign.center,
        ),
        content: loading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CustomLoading(),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 10),
                  CustomText("¿Desea eliminar este producto?"),
                ],
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const CustomText("Cancelar", color: Colors.red),
          ),
          TextButton(
            onPressed: () async {
              loading = true;
              setState(() {});
              var resp = await deleteProductApi(model);
              if (resp["status"] == false) {
                errorResp = true;
                errorRespText = "${resp["message"]}";
                loading = false;
                setState(() {});
              } else {
                await onPress();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            child: const CustomText("Aceptar", color: Colors.blue),
          ),
        ],
      ),
    ),
  );
}
