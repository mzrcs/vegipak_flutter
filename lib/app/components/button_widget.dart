import 'package:flutter/material.dart';
import '../core/constants/my_colors.dart';

Widget myButton(
  String title,
  void Function()? onPressed, {
  bool? loading = false,
}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      // minWidth: double.infinity,
      // height: 50,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8),
      // ),

      // disabledColor: Colors.green.withOpacity(0.9),
      // elevation: 2,
      // onPressed: loading! ? null : () => onPressed!(),
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.kGreenColor,
        disabledBackgroundColor: MyColors.kGreenColorTint.withOpacity(0.5),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: loading!
          ? const SizedBox(
              width: 25,
              height: 25,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                ),
              ),
            )
          : Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
    ),
  );
}

Widget myButton2(
  String title,
  void Function()? onPressed,
) {
  return SizedBox(
    // width: double.infinity,
    height: 45,
    child: ElevatedButton(
      // minWidth: double.infinity,
      // height: 50,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8),
      // ),

      // disabledColor: Colors.green.withOpacity(0.9),
      // elevation: 2,
      // onPressed: loading! ? null : () => onPressed!(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: MyColors.kGreenColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: MyColors.kGreenColor,
        ),
      ),
    ),
  );
}

Widget myTextButton(String title, Function onPressed) {
  return TextButton(
    onPressed: () => onPressed(),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.green,
      ),
    ),
  );
}
