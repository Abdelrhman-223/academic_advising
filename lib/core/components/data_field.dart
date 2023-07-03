import 'package:academic_advising/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DataField extends StatelessWidget {
  final String fieldTitle;
  final List<dynamic>? dropDownButtonItems;
  final Map? dropDownButtonItemsMap;
  DataField({Key? key, required this.fieldTitle, this.dropDownButtonItems, this.dropDownButtonItemsMap}) : super(key: key);

  String? dropDownButtonItem;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QualityModel(),
      child: StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldTitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                    )),
                child: Consumer<QualityModel>(
                  builder: (context, qualityModel, child) => DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    borderRadius: BorderRadius.circular(10),
                    icon: Row(
                      children: [
                        if (dropDownButtonItem != null)
                          IconButton(
                            onPressed: () {
                              print(
                                  "----------------------${QualityModel.score}----------------");
                              qualityModel.decEnteredData();
                              if (fieldTitle == "Course Name") {
                                qualityModel.setCourseName("");
                              } else if (fieldTitle == "Location") {
                                qualityModel.setLocation("");
                              }else if (fieldTitle == "Schedules") {
                                qualityModel.setSchedulesId("");
                              }
                              print(
                                  "----------------------${QualityModel.score}----------------");
                              setState(() {
                                dropDownButtonItem = null;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/xmark-solid.svg",
                              width: 12,
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                        SvgPicture.asset(
                          "assets/icons/arrow-down.svg",
                        ),
                      ],
                    ),
                    hint: const Text(
                      "None",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                    onChanged: (String? value) {
                      print(
                          "----------------------${QualityModel.score}----------------");
                      qualityModel.incEnteredData();
                      if (fieldTitle == "Course Name") {
                        qualityModel.setCourseName(value);
                      } else if (fieldTitle == "Location") {
                        qualityModel.setLocation(value);
                      }else if (fieldTitle == "Schedules") {
                        qualityModel.setSchedulesId(value);
                      }
                      print(
                          "----------------------${QualityModel.score}----------------");
                      setState(() {
                        dropDownButtonItem = value;
                      });
                    },
                    items: dropDownButtonItems
                        ?.map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: dropDownButtonItem,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
