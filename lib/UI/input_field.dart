import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';

Widget inputFieldStandard({
  @required Icon prefixIcon,
  @required String hintText,
  @required Color fillColor,
  @required FormFieldValidator<String> validator,
  @required ValueChanged<String> onChanged,
  Widget suffixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: fillColor,
                  width: 0
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: fillColor,
                  width: 0
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: fillColor,
                  width: 0
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: fillColor,
                  width: 0
              )
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding: EdgeInsets.all(0),
      ),
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
  );
}