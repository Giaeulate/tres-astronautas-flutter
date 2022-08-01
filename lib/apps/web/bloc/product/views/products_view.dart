import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/api/product_api.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/widgets/add_product_alerts.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/widgets/delete_product_alert.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/widgets/edit_product_alert.dart';
import 'package:tres_astronauntas_demo/apps/web/widgets/custom_button_widget.dart';
import 'package:tres_astronauntas_demo/helpers/get_custom_date.dart';
import 'package:tres_astronauntas_demo/models/product_model.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<ProductModel> products = [];

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    _loading = true;
    setState(() {});
    products = await getProducts();
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: _loading
          ? const CustomLoading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                CustomButtonWidget(
                  text: "Agregar producto",
                  onPress: () {
                    showAddProductAlert(context, _initData);
                  },
                ),
                const SizedBox(height: 30),
                Wrap(
                  children: List<Widget>.generate(products.length, (index) {
                    final item = products[index];
                    return SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title: CustomText(item.name),
                          // leading: IconButton(
                          //   icon: const Icon(
                          //     Icons.delete,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {},
                          // ),
                          onTap: () {
                            showEditProductAlert(context, _initData, item);
                          },
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("${item.price} \$us"),
                              item.expiredDate != null
                                  ? CustomText(getCustomDate(item.expiredDate))
                                  : const SizedBox()
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              // Icons.edit,
                              // color: Colors.blue,
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDeleteProductAlert(context, _initData, item);
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }
}
