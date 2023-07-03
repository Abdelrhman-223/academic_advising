import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Divider(
        height: 2,
        color: Color.fromRGBO(0, 0, 0, 0.5),
      ),
    );
  }
}
