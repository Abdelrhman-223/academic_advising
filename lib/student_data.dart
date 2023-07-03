class StudentData {
  late final double cGPA, studentPassedCreditHour;
  late final String message,
      studentId,
      studentName,
      studentLevel,
      studentDepartment,
      studentEmail,
      accessToken;

  StudentData();

  StudentData.fromJson(Map<String, dynamic> json)
      : message = json["msg"] ?? "",
        studentId = json["data"]["student_id"] ?? "",
        studentName = json["data"]["student_name"] ?? "",
        studentLevel = json["data"]["student_level"] ?? "",
        studentDepartment = json["data"]["student_department"] ?? "",
        studentEmail = json["data"]["student_email"] ?? "",
        accessToken = json["data"]["access_token"] ?? "",
        cGPA = json["data"]["CGPA"] ?? 0,
        studentPassedCreditHour = json["data"]["student_passed_credit_hour"] ?? 0;
}
