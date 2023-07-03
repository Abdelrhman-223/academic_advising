import 'package:academic_advising/core/components/logout_button.dart';
import 'package:academic_advising/core/components/student_data_field.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  final dynamic responseData;

  const StudentPage({super.key, this.responseData});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        // title: const Text(
        //   "Quality Automation",
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        title: const Image(image: AssetImage("assets/images/MA_Logo.png"), height: 40,),
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
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Text(
              widget.responseData["data"]["student_name"],
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(
                fontSize: 38,
                color: Colors.blue
              ),
            ),
            StudentDataField(fieldTitle: "ID", fieldData: widget.responseData["data"]["student_id"]),
            StudentDataField(fieldTitle: "Email", fieldData: widget.responseData["data"]["student_email"]),
            StudentDataField(fieldTitle: "GPA", fieldData: widget.responseData["data"]["CGPA"].toString()),
            StudentDataField(fieldTitle: "Department", fieldData: widget.responseData["data"]["student_department"]),
            StudentDataField(fieldTitle: "Level", fieldData: widget.responseData["data"]["student_level"]),
            StudentDataField(fieldTitle: "Passed Credit Hour", fieldData: widget.responseData["data"]["student_passed_credit_hour"].toString()),
          ],
        ),
      ),
    );
  }
}
