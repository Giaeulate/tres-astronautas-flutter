import 'package:tres_astronauntas_demo/api/api_service.dart';
import 'package:tres_astronauntas_demo/global/local_storage.dart';
import 'package:tres_astronauntas_demo/models/product_model.dart';

String? token = LocalStorage.sharedPreferences.getString('token');

Future<List<ProductModel>> getProducts() async {
  List<ProductModel> data = [];
  dynamic headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var resp = await getApi("api/v1/product", headers: headers);
  try {
    for (var item in resp) {
      data.add(ProductModel.fromJson(item));
    }
    return data;
  } catch (e) {
    return data;
  }
}

Future<dynamic> createProductApi(ProductModel data) async {
  dynamic headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var resp = await postApi("api/v1/product", data.toJson(), headers: headers);
  return resp;
}

Future<dynamic> updateProductApi(ProductModel data) async {
  dynamic headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var resp =
      await putApi("api/v1/product", data.id, data.toJson(), headers: headers);
  return resp;
}

Future<dynamic> deleteProductApi(ProductModel data) async {
  dynamic headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  var resp = await deleteApi("api/v1/product", data.id, headers: headers);
  return resp;
}
