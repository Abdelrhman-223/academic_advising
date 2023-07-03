import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class Timer extends StatelessWidget {
  final String buttonTitle;

  Timer({Key? key, required this.buttonTitle}) : super(key: key);
  String? date;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QualityModel(),
      child: StatefulBuilder(
        builder: (context, setState) => Consumer<QualityModel>(
          builder: (context, qualityModel, child) => GestureDetector(
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then(
                (value) => {
                  setState(() {
                    print(value);
                    if (value != null) {
                      if (date == null) {
                        print(
                            "----------------------${QualityModel.score}----------------");
                        qualityModel.incEnteredData();
                        print(
                            "----------------------${QualityModel.score}----------------");
                      }
                      if (buttonTitle == "Start Time") {
                        qualityModel.setStartTime(value?.format(context));
                      } else if (buttonTitle == "End Time") {
                        qualityModel.setEndTime(value?.format(context));
                      }
                    } else {
                      print(
                          "----------------------${QualityModel.score}----------------");
                      qualityModel.decEnteredData();
                      if (buttonTitle == "Start Time") {
                        qualityModel.setStartTime("");
                      } else if (buttonTitle == "End Time") {
                        qualityModel.setEndTime("");
                      }
                      print(
                          "----------------------${QualityModel.score}----------------");
                    }
                    date = value?.format(context);
                  })
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                  )),
              alignment: Alignment.center,
              child: date == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                        // SvgPicture.asset(
                        //   "assets/icons/calendar.svg",
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          buttonTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date!,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print(
                                "----------------------${QualityModel.score}----------------");
                            qualityModel.decEnteredData();
                            if (buttonTitle == "Start Time") {
                              qualityModel.setStartTime("");
                            } else if (buttonTitle == "End Time") {
                              qualityModel.setEndTime("");
                            }
                            print(
                                "----------------------${QualityModel.score}----------------");
                            setState(() {
                              date = null;
                            });
                          },
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(
                            "assets/icons/xmark-solid.svg",
                            width: 14,
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
