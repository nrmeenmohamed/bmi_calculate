import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

Widget defaultText({
  required String text,
  double fontSize = 18.0,
  FontWeight fontWeight = FontWeight.w500,
}) => Text(
  text,
  style: TextStyle(
    color: textColor,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  ),
);




Widget defaultTextField({
  required TextEditingController controller,
  required Function(String) onFieldSubmitted,
  required Function(String?) validator,

}) => TextFormField(
  onFieldSubmitted: (value){
    onFieldSubmitted(value);
  },
  controller: controller,
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:textColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: secondaryColor,
      ),
    ),
  ),
  style: TextStyle(
    color: textColor,
  ),
  cursorColor: secondaryColor,
  validator: (value){
    return validator(value);
  },

);


Widget defaultButton({
  required Function onPressed,
  required Widget widget,
  required Size minimumSize,
}) => ElevatedButton(
  onPressed: (){
    onPressed();
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.r),
    ),
    backgroundColor: secondaryColor,
    minimumSize: minimumSize,
  ),
  child: widget,
);

