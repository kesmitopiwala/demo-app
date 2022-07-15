import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hypnosis/Utils/constant.dart';
import 'package:sizer/sizer.dart';

class CustomWidget {
  ///
  /// This method is used for show heading text in ui with some prebuild properties
  ///
  static Text text(String text,
      {Color color = AppColor.whiteColor,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 16.0,
      double letterSpacing = 0.5,
      TextAlign textAlign = TextAlign.center,
      int? maxLine,
      TextOverflow? overflow,
      TextDecoration decoration = TextDecoration.none}) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLine,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              decoration: decoration,
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize.sp,
              letterSpacing: letterSpacing,
              overflow: overflow),
        ));
  }

  static customAssetImageWidget(
      {String? image,
      double height = 4.0,
      double width = 4.0,
      BoxFit fit = BoxFit.contain}) {
    return SizedBox(
      height: height.h,
      width: width.h,
      child: Image.asset(
        image!,
        fit: fit,
      ),
    );
  }

  static GestureDetector customButton(
      {required Function callBack,
      required double height,
      required double width,
      required String btnText,
      double borderRadius = 20.0,
      FontWeight fontWeight = FontWeight.w700,
      Color color = AppColor.primaryColor,
      Color textColor = AppColor.primaryColor,
      double textSize = 12.0}) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: textColor == AppColor.whiteColor ? color : textColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: text(btnText,
              fontSize: textSize,
              letterSpacing: 0.5,
              fontWeight: fontWeight,
              color: textColor),
        ),
      ),
    );
  }

  ///
  /// This method provide [BoxDecoration] with some predefine properties
  ///
  static BoxDecoration customBoxDecoration({
    Color color = Colors.white,
    double borderRadius = 10.0,
    bool isBoxShadow = true,
    double borderWidth = 2,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      // border: Border.all(color: AppColor.borderColor, width: borderWidth),
    );
  }

  ///
  /// Custom Input Decoration it's used all over the app for TextField
  ///
  static InputDecoration customInputDecoration(
      {required String hintText,
      bool? isSufixShow = false,
      bool? isPrefixShow = false,
      String? prefixImage,
      Function? onTapSuffix,
      EdgeInsets contentPadding =
          const EdgeInsets.only(top: 15, bottom: 15, right: 0),
      String? suffixIcon}) {
    return InputDecoration(
        filled: true,
        fillColor: AppColor.textFieldColor,
        isDense: true,
        prefixIconConstraints:
            BoxConstraints(minWidth: isPrefixShow! ? 20 : 10, maxHeight: 15),
        suffixIconConstraints:
            BoxConstraints(minWidth: isSufixShow! ? 20 : 10, maxHeight: 15),
        suffixIcon: isSufixShow
            ? GestureDetector(
                onTap: () => onTapSuffix!(),
                child: text('Change',
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF881B),
                    decoration: TextDecoration.underline),
              )
            : text(''),
        prefixIcon: isPrefixShow
            ? Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Image.asset(
                  prefixImage!,
                ),
              )
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 0.0),
                child: text(''),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12.0.sp,
            letterSpacing: 0.5,
            fontFamily: 'SFProText',
            color: AppColor.whiteColor.withOpacity(0.5)),
        contentPadding: contentPadding);
  }

  ///
  /// Custom Input Decoration it's used all over the app for TextField
  ///
  static InputDecoration customInputDecorationImage(
      {required String hintText,
      bool? isSufixShow = false,
      bool? isPrefixShow = false,
      String? prefixImage,
      String? suffixImage,
      Function? onTapSuffix,
      EdgeInsets contentPadding =
          const EdgeInsets.only(top: 15, bottom: 15, right: 0),
      String? suffixIcon}) {
    return InputDecoration(
        filled: true,
        fillColor: AppColor.textFieldColor,
        isDense: true,
        prefixIconConstraints:
            BoxConstraints(minWidth: isPrefixShow! ? 20 : 10, maxHeight: 15),
        suffixIconConstraints:
            BoxConstraints(minWidth: isSufixShow! ? 20 : 10, maxHeight: 15),
        suffixIcon: isSufixShow
            ? GestureDetector(
                onTap: () => onTapSuffix!(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Image.asset(
                    suffixImage!,
                    height: 5.0.h,
                  ),
                ))
            : text(''),
        prefixIcon: isPrefixShow
            ? Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Image.asset(
                  prefixImage!,
                ),
              )
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 0.0),
                child: text(''),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12.0.sp,
            letterSpacing: 0.5,
            fontFamily: 'SFProText',
            color: AppColor.textPrimaryColor.withOpacity(0.5)),
        contentPadding: contentPadding);
  }

  ///
  /// Custom Input Decoration it's used all over the app for TextFieldHouseOfServices
  ///
  static InputDecoration customInputDecorationHouseServices(
      {bool? isSufixShow = false,
      bool? isPrefixShow = false,
      String? prefixImage,
      Function? onTapSuffix,
      EdgeInsets contentPadding =
          const EdgeInsets.only(top: 15, bottom: 15, right: 0),
      String? suffixIcon}) {
    return InputDecoration(
        filled: true,
        fillColor: AppColor.whiteColor,
        isDense: true,
        prefixIconConstraints:
            BoxConstraints(minWidth: isPrefixShow! ? 20 : 10, maxHeight: 15),
        suffixIconConstraints:
            BoxConstraints(minWidth: isSufixShow! ? 20 : 10, maxHeight: 15),
        suffixIcon: isSufixShow
            ? GestureDetector(
                onTap: () => onTapSuffix!(),
                child: text('Change',
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF881B),
                    decoration: TextDecoration.underline),
              )
            : text(''),
        prefixIcon: isPrefixShow
            ? Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Image.asset(
                  prefixImage!,
                ),
              )
            : Padding(
                padding: const EdgeInsetsDirectional.only(start: 0.0),
                child: text(''),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: contentPadding);
  }

  static Column textFieldWithHeading({String? hintText, String? headingText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomWidget.text(headingText!,
            fontSize: 12.0, color: AppColor.textHeadigColor),
        SizedBox(height: 1.0.h),
        TextField(
          cursorColor: AppColor.primaryColor,
          decoration: CustomWidget.customInputDecoration(hintText: hintText!),
        ),
      ],
    );
  }

  ///
  /// Error SnackBar
  ///
  static errorSnackBar(
      {required String content, Color textColor = AppColor.whiteColor}) {
    return Get.snackbar('Error', content,
        backgroundColor: Colors.red[400],
        colorText: textColor,
        borderRadius: 10);
  }

  ///
  /// Success SnackBar
  ///
  static successSnackBar(
      {required String content, Color textColor = AppColor.blackColor}) {
    return Get.snackbar('Success', content,
        backgroundColor: Colors.green[100]!.withOpacity(0.8),
        borderRadius: 6,
        colorText: textColor);
  }

  static textFieldTextStyle() {
    return TextStyle(
        fontSize: 11.0.sp,
        letterSpacing: 0.5,
        fontFamily: 'SFProText',
        color: AppColor.whiteColor);
  }

  static TextStyle selectedLabelStyle({required FontWeight fontW}) {
    return TextStyle(
        fontSize: 12.0.sp,
        letterSpacing: 0.5,
        fontFamily: 'SFProText',
        fontWeight: fontW,
        color: AppColor.textPrimaryColor);
  }

  static ThemeData dateTimePickerThemeData() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
          primary: AppColor.primaryColor, onSurface: AppColor.textHeadigColor),
      buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.green,
        ),
      ),
    );
  }
}
