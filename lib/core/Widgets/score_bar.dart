import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider.dart';
import '../components/score_item.dart';
import '../components/score_title.dart';

class ScoreBar extends StatelessWidget {
  ScoreBar({super.key});

  List<String> scoreItemsTitles = [
    "Very Bad",
    "Bad",
    "Good",
    "Very Good",
    "Excellent"
  ];

  List<Color> scoreItemsColors = [
    const Color.fromRGBO(140, 0, 0, 1),
    const Color.fromRGBO(225, 26, 26, 1),
    const Color.fromRGBO(245, 100, 0, 1),
    const Color.fromRGBO(26, 225, 26, 1),
    const Color.fromRGBO(67, 255, 0, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QualityModel(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Consumer<QualityModel>(
          builder: (context, qualityModel, child) => Column(
            children: [
              const ScoreTitle(scoreTitle: "Score"),
              SizedBox(
                width: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: scoreItemsTitles.length,
                  itemBuilder: (context, index) => ScoreItem(
                    buttonTitle: scoreItemsTitles[index].toString(),
                    itemColor: scoreItemsColors[index],
                    scoreRun: (index*2 < QualityModel.score.toInt()) ? true : false,
                  ),
                ),
              ),
              ScoreTitle(
                  scoreTitle: QualityModel.score.toInt().toString() ?? "0"),
            ],
          ),
        ),
      ),
    );
  }
}
