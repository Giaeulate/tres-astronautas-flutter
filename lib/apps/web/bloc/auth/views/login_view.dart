import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/login_form_provider.dart';
import 'package:tres_astronauntas_demo/apps/web/widgets/custom_button_widget.dart';
import 'package:tres_astronauntas_demo/widgets/custom_input_widget.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Form(
            key: loginFormProvider.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 50),
                  // SvgPicture.network(
                  //   "https://www.tresastronautas.com/wp-content/uploads/2021/05/logo-tres-astronautas.svg",
                  //   color: Colors.black,
                  // ),
                  const SizedBox(height: 100),
                  Image.asset(
                    "assets/tres-astronautas-figura.png",
                    height: 180,
                  ),
                  const SizedBox(height: 50),
                  const CustomText(
                    "Login",
                    fontSize: 30,
                  ),
                  const SizedBox(height: 30),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Column(
                      children: [
                        CustomInputWidget(
                          fillColor: Colors.white.withOpacity(0.5),
                          validate: true,
                          onChange: (val) => loginFormProvider.user = val,
                          onSubmit: (val) =>
                              _login(authProvider, context, loginFormProvider),
                          hint: "Correo",
                          borderSideOff: const BorderSide(color: Colors.black),
                          borderSideOn: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                          textAlign: TextAlign.start,
                          hintColor: Colors.grey.withOpacity(0.5),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.account_circle),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomInputWidget(
                          fillColor: Colors.white.withOpacity(0.5),
                          onSubmit: (val) =>
                              _login(authProvider, context, loginFormProvider),
                          validate: true,
                          onChange: (val) => loginFormProvider.password = val,
                          hint: "Contraseña",
                          isPass: true,
                          borderSideOff: const BorderSide(color: Colors.black),
                          borderSideOn: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                          textAlign: TextAlign.start,
                          hintColor: Colors.grey.withOpacity(0.5),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.password),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                  authProvider.loading
                      ? const CustomLoading()
                      : CustomButtonWidget(
                          text: "Iniciar sesión",
                          // bgColor: ThemeApp.bgColor,
                          // borderSide: BorderSide(color: Colors.black2),
                          onPress: () =>
                              _login(authProvider, context, loginFormProvider),
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _login(authProvider, context, loginFormProvider) {
    if (loginFormProvider.validateForm()) {
      authProvider.login(
        context,
        loginFormProvider.user,
        loginFormProvider.password,
      );
    }
    // authProvider.login(context, "b@a.com", "admin");
    // context,"@a.com","admin",socketService);
  }
}
