import 'package:flutter/material.dart';

class ScoreTitle extends StatelessWidget {
  final String scoreTitle;

  const ScoreTitle({Key? key, required this.scoreTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.1),
        borderRadius: (scoreTitle == "Score")
            ? const BorderRadius.vertical(top: Radius.circular(5))
            : const BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      child: Text(
        scoreTitle,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
