import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class CustomButtonWidget extends StatefulWidget {
  final Function()? onPress;
  final String text;
  final double w;
  final double h;
  final double fontSize;
  final Color? bgColor;
  final Color? fgColor;
  final Color? textColor;
  final Alignment alignment;
  final Widget? prefix;
  final Widget? suffix;
  const CustomButtonWidget({
    Key? key,
    this.onPress,
    this.text = 'Ingresar',
    this.w = 150,
    this.h = 50,
    this.fontSize = 21,
    this.bgColor,
    this.fgColor,
    this.textColor,
    this.alignment = Alignment.center,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(_hover ? 7 : 5),
        foregroundColor:
            MaterialStateProperty.all<Color>(widget.textColor ?? Colors.black),
        backgroundColor:
            MaterialStateProperty.all<Color>(widget.bgColor ?? Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(Size(widget.w, widget.h)),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      onPressed: widget.onPress ?? () {},
      onHover: (val) {
        setState(() {
          _hover = val;
        });
      },
      child: Wrap(
        children: [
          widget.prefix ?? const SizedBox(),
          CustomText(widget.text),
          widget.suffix ?? const SizedBox(),
        ],
      ),
    );
  }
}
