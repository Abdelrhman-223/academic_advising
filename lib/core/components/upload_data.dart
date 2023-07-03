import 'dart:io';

import 'package:academic_advising/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class UploadData extends StatelessWidget {
  final String sectionTitle;

  UploadData({Key? key, required this.sectionTitle}) : super(key: key);

  String imagePath = "", videoPath = "", attendancePath = "";
  late VideoPlayerController controller;
  late PlatformFile file;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QualityModel(),
      child: Consumer<QualityModel>(
        builder: (context, qualityModel, child) {
          // callIncScore() {
          //   qualityModel.incScore();
          //   print(
          //       "----------------------${qualityModel.score}----------------");
          // }
          return StatefulBuilder(
            builder: (context, setState) => Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  sectionTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: DottedBorder(
                    dashPattern: const [8, 4],
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(),
                      child: (imagePath != "")
                          ? Image.file(File(imagePath))
                          : (videoPath != "")
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (controller.value.isPlaying) {
                                        controller.pause();
                                      } else {
                                        controller.play();
                                      }
                                    });
                                  },
                                  child: AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
                                  ),
                                )
                              : (attendancePath != "")
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icons/book.svg"),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Expanded(
                                          child: Text(
                                            file.name,
                                            softWrap: true,
                                            style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      "Your file will appear here",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 18,
                                      ),
                                    ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        // qualityModel.incScore();
                        // print("----------------------${qualityModel.score}----------------");
                        if (sectionTitle == "Picture") {
                          // callIncScore();
                          // qualityModel.incScore();
                          // print("----------------------${qualityModel.score}----------------");
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(() {
                            imagePath = pickedImage!.path;
                            qualityModel.setImagePath(imagePath);
                          });
                        } else if (sectionTitle == "Video") {
                          // callIncScore();
                          // qualityModel.incScore();
                          // print("----------------------${qualityModel.score}----------------");
                          final pickedVideo = await ImagePicker()
                              .pickVideo(source: ImageSource.gallery);
                          setState(() {
                            videoPath = pickedVideo!.path;
                            controller =
                                VideoPlayerController.file(File(videoPath))
                                  ..initialize().then((_) {});
                            qualityModel.setVideoPath(videoPath);
                          });
                        } else if (sectionTitle == "Attendance") {
                          // callIncScore();
                          // qualityModel.incScore();
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          setState(() {
                            attendancePath =
                                result!.files.single.path.toString();
                            file = result.files.first;
                            qualityModel.setAttendancePath(attendancePath);
                          });
                        }
                        if (imagePath != "" ||
                            videoPath != "" ||
                            attendancePath != "") {
                          print(
                              "----------------------${QualityModel.score}----------------");
                          qualityModel.incScore();
                          print(
                              "----------------------${QualityModel.score}----------------");
                        }
                      },
                      color: const Color.fromRGBO(23, 92, 196, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Upload File",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    MaterialButton(
                      onPressed: () {
                        print(
                            "----------------------${QualityModel.score}----------------");
                        qualityModel.decScore();
                        print(
                            "----------------------${QualityModel.score}----------------");
                        if (sectionTitle == "Picture") {
                          qualityModel.setImagePath("");
                        } else if (sectionTitle == "Video") {
                          qualityModel.setVideoPath("");
                        } else if (sectionTitle == "Attendance") {
                          qualityModel.setAttendancePath("");
                        }
                        setState(() {
                          imagePath = "";
                          videoPath = "";
                          attendancePath = "";
                        });
                      },
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
