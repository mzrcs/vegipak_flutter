import 'package:flutter/material.dart';

Widget myButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: double.infinity,
    height: 50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    color: Colors.green,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
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
