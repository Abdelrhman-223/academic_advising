import 'package:flutter/material.dart';

import '../../pages/login_page.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        },
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          "LOGOUT",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
