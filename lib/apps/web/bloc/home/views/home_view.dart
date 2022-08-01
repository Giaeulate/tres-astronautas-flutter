import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:webviewx/webviewx.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late WebViewXController webviewController;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() {
    Future.delayed(const Duration(seconds: 2), () {
      _loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: _loading
          ? const CustomLoading()
          : WebViewX(
              height: size.height,
              width: size.width,
              initialContent: '<h2> Cargando </h2>',
              // onWebViewCreated: (controller) => webviewController = controller,
              onWebViewCreated: (controller) async {
                webviewController = controller;
                await Future.delayed(const Duration(microseconds: 1), () {
                  webviewController.loadContent(
                    'https://www.tresastronautas.com/',
                    SourceType.url,
                  );
                });
              },
            ),
    );
  }
}
