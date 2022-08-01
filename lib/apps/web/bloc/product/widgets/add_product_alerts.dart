import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/api/product_api.dart';
import 'package:tres_astronauntas_demo/models/product_model.dart';
import 'package:tres_astronauntas_demo/widgets/custom_form.dart';
import 'package:tres_astronauntas_demo/widgets/custom_input_widget.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

showAddProductAlert(context, Function() onPress) {
  bool errorResp = false;
  String errorRespText = "";
  bool loading = false;
  ProductModel model = ProductModel(id: "", name: "", price: 0);
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const CustomText(
          "Agregar nuevo producto",
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
                children: [
                  const SizedBox(height: 10),
                  CustomForm(
                    onPress: () async {
                      loading = true;
                      setState(() {});
                      var resp = await createProductApi(model);
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
                    children: [
                      errorResp
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CustomText(
                                errorRespText,
                                color: Colors.red,
                              ),
                            )
                          : const SizedBox(),
                      CustomInputWidget(
                        controller: TextEditingController(text: model.name),
                        borderSideOn: const BorderSide(color: Colors.black),
                        label: "Nombre del producto",
                        onChange: (val) => model.name = val.toString(),
                      ),
                      const SizedBox(height: 10),
                      CustomInputWidget(
                        keyboardType: TextInputType.number,
                        controller:
                            TextEditingController(text: model.price.toString()),
                        label: "Precio (en \$us)",
                        borderSideOn: const BorderSide(color: Colors.black),
                        validate: true,
                        onChange: (val) {
                          if (val.isNotEmpty) {
                            model.price = double.parse(val.toString());
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      // CustomInputWidget(
                      //   controller:
                      //       TextEditingController(text: getCustomDate(model.expiredDate)),
                      //   label: 'Fecha de expiración',
                      //   borderSideOn: const BorderSide(color: Colors.black),
                      //   validate: true,
                      //   onChange: (val) => client.lastName = val.toString(),
                      // ),
                    ],
                  ),
                ],
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const CustomText("Cancelar", color: Colors.red),
          ),
        ],
      ),
    ),
  );
}
