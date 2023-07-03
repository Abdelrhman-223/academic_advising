import 'package:flutter/material.dart';

class QualityModel extends ChangeNotifier {
  static String imagePath = "",
      videoPath = "",
      attendancePath = "",
      schedulesId = "",
      courseName = "",
      location = "",
      startTime = "",
      endTime = "";
  static double score = 0, enteredData = 0;

  incScore() {
    if (score < 10) score += 2.5;
    notifyListeners();
  }

  decScore() {
    if (score > 0) score -= 2.5;
    notifyListeners();
  }

  incEnteredData() {
    if (enteredData == 2) {
      if (score < 10) score += 2.5;
      enteredData += 1;
    } else {
      enteredData += 1;
    }
    notifyListeners();
  }

  decEnteredData() {
    if (enteredData == 3) {
      if (score > 0) score -= 2.5;
      enteredData -= 1;
    } else {
      enteredData -= 1;
    }
    notifyListeners();
  }

  setImagePath(funImagePath) {
    imagePath = funImagePath;
    notifyListeners();
  }

  setVideoPath(funVideoPath) {
    videoPath = funVideoPath;
    notifyListeners();
  }

  setAttendancePath(funAttendancePath) {
    attendancePath = funAttendancePath;
    notifyListeners();
  }
  setCourseName(funCourseName) {
    courseName = funCourseName;
    notifyListeners();
  }
  setSchedulesId(funSchedulesId) {
    schedulesId = funSchedulesId;
    notifyListeners();
  }
  setLocation(funLocation) {
    location = funLocation;
    notifyListeners();
  }
  setStartTime(funStartTime) {
    startTime = funStartTime;
    notifyListeners();
  }
  setEndTime(funEndTime) {
    endTime = funEndTime;
    notifyListeners();
  }
}
