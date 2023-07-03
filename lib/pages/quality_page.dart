import 'dart:convert';
import 'dart:io';
import 'package:academic_advising/core/Widgets/timer.dart';
import 'package:academic_advising/core/Widgets/score_bar.dart';
import 'package:academic_advising/core/components/data_field.dart';
import 'package:academic_advising/core/components/divider.dart';
import 'package:academic_advising/core/components/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/components/logout_button.dart';
import '../provider.dart';
import 'package:http/http.dart' as http;

import '../url_base.dart';

class QualityPage extends StatefulWidget {
  final dynamic responseData,
      coursesResponseData,
      locationsResponseData,
      schedulesResponseData;

  const QualityPage({Key? key,
    this.responseData,
    this.coursesResponseData,
    this.locationsResponseData,
    this.schedulesResponseData})
      : super(key: key);

  @override
  State<QualityPage> createState() => _QualityPageState();
}

class _QualityPageState extends State<QualityPage> {
  /*
  Map schedules = {};

  @override
  void initState() {
    Map coursesName = {}, getSchedules = {};
    for (int i = 0; i < widget.coursesResponseData["data"]["courses_names"].length; i++) {
      coursesName.addAll({
        widget.coursesResponseData["data"]["courses_codes"][i]:
            widget.coursesResponseData["data"]["courses_names"][i]
      });
      print("Key: " + widget.coursesResponseData["data"]["courses_codes"][i] + "value: " +  widget.coursesResponseData["data"]["courses_names"][i]);
    }
    // for (int i = 0; i < widget.schedulesResponseData["data"]["schedules"].length; i++) {
    //   getSchedules.update(widget.schedulesResponseData["data"]["schedules"][i]["schedule_id"], (value) => "${coursesName[widget.schedulesResponseData["data"]["schedules"][i]["schedule_id"]]} - ${widget.schedulesResponseData["data"]["schedules"][i]["location_name"]}");
    // }
    setState(() {
      schedules = getSchedules;
    });
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QualityModel(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Quality Automation",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: const Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
          actions: const [
            LogoutButton(),
          ],
        ),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Doctor",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.responseData["data"]["instractor_name"],
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              DataField(
                fieldTitle: "Schedules",
                dropDownButtonItems: widget.schedulesResponseData["data"]
                ["schedules_codes"],
              ),
              /*
              DataField(
                fieldTitle: "Course Name",
                dropDownButtonItems: widget.coursesResponseData["data"]
                ["courses_names"],
              ),
              DataField(
                fieldTitle: "Location",
                dropDownButtonItems: widget.locationsResponseData["data"]
                ["locations_names"],
              ),
              */
              Timer(buttonTitle: "Start Time"),
              Timer(buttonTitle: "End Time"),
              const MyDivider(),
              UploadData(sectionTitle: "Picture"),
              UploadData(sectionTitle: "Video"),
              UploadData(sectionTitle: "Attendance"),
              const MyDivider(),
              Consumer<QualityModel>(
                builder: (context, qualityModel, child) =>
                    Column(
                      children: [
                        ScoreBar(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: MaterialButton(
                            onPressed: () async {
                              //api/attachments/create?token=&attachment_id=null&attachment_photo=null&attachment_video=null&attendance=null&score=null&actual_start_time=null&actual_end_time=null&schedule_id=nul
                              String urlDomain = "api/attachments/create";
                              Map<String, dynamic> urlRequest = {
                                "token": widget
                                    .responseData["data"]["access_token"],
                                "attachment_photo": QualityModel.imagePath,
                                "attachment_video": QualityModel.videoPath,
                                "attendance": QualityModel.attendancePath,
                                // "score": QualityModel.score,
                                "actual_start_time": QualityModel.startTime,
                                "actual_end_time": QualityModel.endTime,
                                "schedule_id": QualityModel.schedulesId,
                              };
                              var url = Uri.http(UrlBase.urlBase, urlDomain, urlRequest);
                              var response = await http.post(url);
                              print(
                                  "-----------------response-----${response.body}----------------");
                              print(
                                  "-----------------courseName-----${QualityModel
                                      .courseName}----------------");
                              print(
                                  "-----------------location-----${QualityModel
                                      .location}----------------");
                              print(
                                  "-----------------startTime-----${QualityModel
                                      .startTime}----------------");
                              print(
                                  "-----------------endTime-----${QualityModel
                                      .endTime}----------------");
                              print(
                                  "-----------------imagePath-----${QualityModel
                                      .imagePath}----------------");
                              print(
                                  "-----------------videoPath-----${QualityModel
                                      .videoPath}----------------");
                              print(
                                  "-----------------attendancePath-----${QualityModel
                                      .attendancePath}----------------");
                              print(
                                  "-----------------score-----${QualityModel
                                      .score}----------------");
                            },
                            height: 50,
                            color: const Color.fromRGBO(23, 92, 196, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
