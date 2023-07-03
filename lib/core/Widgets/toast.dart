import 'dart:async';

import 'package:flutter/material.dart';

myToast(context, toastMessage) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red,
      alignment: const Alignment(0, 0.8),
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50)),
      content: Text(
        toastMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
  Timer(const Duration(milliseconds: 500), () {
    Navigator.pop(context);
  });
}