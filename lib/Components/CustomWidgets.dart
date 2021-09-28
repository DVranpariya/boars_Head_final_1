import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/res/Constants.dart';
import 'package:get/get.dart';

class FlashText extends StatelessWidget {
  final String text, fontFamily;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int maxLines;
  FlashText(
    this.text, {
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = 'Poppins',
    this.letterSpacing,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.height = 1.4,
    this.maxLines = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.input,
    this.label,
    this.maxLines,
    this.fieldHeight = 44,
    this.focusNode,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.initialValue,
    this.readOnly = false,
    this.suffix,
  });

  final TextEditingController controller;
  final TextInputType input;
  final Function(String) onChanged;
  final List<TextInputFormatter> inputFormatters;
  final String label;
  final int maxLines;
  final double fieldHeight;
  final FocusNode focusNode;
  final String hintText;
  final Function() onTap;
  final String initialValue;
  final bool readOnly;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: Get.width / 3,
        height: fieldHeight,
        child: TextFormField(
          readOnly: readOnly,
          cursorColor: Colors.white60,
          focusNode: focusNode,
          maxLines: maxLines,
          controller: controller,
          keyboardType: input,
          onChanged: onChanged,
          onTap: onTap,
          inputFormatters: inputFormatters,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: Get.width / 69),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff302f2f),
            suffixIcon: suffix,
            hintText: hintText,
            hintStyle: TextStyle(
                color: kThemeColor,
                fontFamily: 'Poppins',
                fontSize: Get.width / 80),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            border: kOutlineInputBorder,
            focusedBorder: kOutlineInputBorder,
            enabledBorder: kOutlineInputBorder,
            errorBorder: kOutlineInputBorder,
            focusedErrorBorder: kOutlineInputBorder,
          ),
        ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final String title;
  final Function functionOnPress;
  const AppIconButton({this.title = '', this.functionOnPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: FlashText(title,
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      icon: Icon(Icons.shopping_cart_outlined, size: Get.width * .01),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(kThemeColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: functionOnPress,
    );
  }
}

class AppButton extends StatelessWidget {
  final String title;
  const AppButton({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: FlashText(title,
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(kThemeColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  final String title;
  const TableHeader({
    Key key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FlashText(title,
            fontSize: 16, color: kThemeColor, fontWeight: FontWeight.w700));
  }
}

class TableData extends StatelessWidget {
  final String title;
  const TableData(this.title);

  @override
  Widget build(BuildContext context) {
    return FlashText(title, fontSize: 16, fontWeight: FontWeight.w500);
  }
}

class Header1 extends StatelessWidget {
  final title;
  final value;
  const Header1({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlashText(title,
            fontSize: Get.width / 85,
            color: kThemeColor,
            fontWeight: FontWeight.w500),
        FlashText(value, fontSize: Get.width / 90, fontWeight: FontWeight.w500),
      ],
    );
  }
}
