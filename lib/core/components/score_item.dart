import 'package:flutter/material.dart';

class ScoreItem extends StatelessWidget {
  final Color itemColor;
  final String buttonTitle;
  final bool scoreRun;

  ScoreItem({Key? key, required this.itemColor, required this.buttonTitle, required this.scoreRun})
      : super(key: key);

  Color buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 75,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          color: const Color.fromRGBO(0, 0, 0, 0.10),
          child: Container(
            height: 100,
            width: 10,
            decoration: BoxDecoration(
                color: (scoreRun)?itemColor:Colors.transparent, borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Align(
          alignment: const Alignment(-0.9, 0),
          child: Container(
            width: 140,
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Text(
                buttonTitle,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
