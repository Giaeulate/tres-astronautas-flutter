import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/widgets/custom_image.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';

class ButtonSidebar extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final String iconText;
  final double iconW;
  final double iconH;
  final double fontSize;
  final bool isSelected;
  final bool onlyTextImage;
  final TextAlign textAlign;
  // ignore: use_key_in_widget_constructors
  const ButtonSidebar({
    this.text = "Boton",
    this.onPressed,
    this.iconText = "assets/svg/clientes_sidebar.",
    this.iconW = 50,
    this.iconH = 50,
    this.fontSize = 21,
    this.isSelected = false,
    this.onlyTextImage = false,
    // this.textAlign = TextAlign.center,
    this.textAlign = TextAlign.start,
  });

  @override
  _ButtonSidebarState createState() => _ButtonSidebarState();
}

class _ButtonSidebarState extends State<ButtonSidebar> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return widget.onlyTextImage
        ? MouseRegion(
            onEnter: (_) => setState(() => _isHover = true),
            onExit: (_) => setState(() => _isHover = false),
            child: InkWell(
              onTap: widget.onPressed ?? () {},
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                alignment: Alignment.centerLeft,
                height: 70,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? Colors.white
                      : _isHover
                          ? Colors.white
                          : Colors.black,
                ),
                width: double.maxFinite,
                child: CustomText(
                  widget.text,
                  fontSize: widget.fontSize,
                  textAlign: widget.textAlign,
                  fontWeight: FontWeight.w700,
                  color: widget.isSelected
                      ? Colors.black
                      : _isHover
                          ? Colors.black
                          : Colors.white,
                ),
              ),
            ),
          )
        : MouseRegion(
            onEnter: (_) => setState(() => _isHover = true),
            onExit: (_) => setState(() => _isHover = false),
            child: InkWell(
              onTap: widget.onPressed ?? () {},
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: 70,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? Colors.white
                      : _isHover
                          ? Colors.white
                          : Colors.black,
                ),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widget.iconW,
                      height: widget.iconH,
                      child: CustomImage(
                        widget.iconText,
                        // fit: BoxFit.contain,
                        // color: widget.isSelected
                        //     ? Colors.black
                        //     : _isHover
                        //         ? Colors.black
                        //         : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w700,
                          color: widget.isSelected
                              ? Colors.black
                              : _isHover
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          );
  }
}
