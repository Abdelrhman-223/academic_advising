import 'package:flutter/material.dart';

class StudentDataField extends StatelessWidget {
  final String fieldTitle, fieldData;

  const StudentDataField(
      {super.key, required this.fieldTitle, required this.fieldData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                fieldTitle,
                softWrap: true,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Text(
              fieldData,
              softWrap: true,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
                // color: Color.fromRGBO(0, 122, 131, 1.0)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
