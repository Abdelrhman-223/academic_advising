import 'package:academic_advising/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/Widgets/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool checkBoxValue = false, passwordVisibility = true;

  getDataFromSHP() async {
    final SharedPreferences mySharedPreferences =
        await SharedPreferences.getInstance();
    if (mySharedPreferences.containsKey("checkBoxValue")) {
      print("Email: ${mySharedPreferences.getString("email")}");
      print("Password: ${mySharedPreferences.getString("password")}");
      emailController.text = mySharedPreferences.getString("email")!;
      passwordController.text = mySharedPreferences.getString("password")!;
      setState(() {
        checkBoxValue = mySharedPreferences.getBool("checkBoxValue")!;
      });
    }
  }

  @override
  void initState() {
    getDataFromSHP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Image(
                  image: AssetImage("assets/images/MA_Logo.png"),
                ),
                const Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                const Text(
                  "Into Academic Advising System",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Academic Mail / ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passwordVisibility,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                        icon: (passwordVisibility)
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: checkBoxValue,
                          onChanged: (value) {
                            setState(() {
                              checkBoxValue = value!;
                            });
                          },
                        ),
                        const Text(
                          "Remember Me",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Forget Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      if (emailController.text != "" &&
                          passwordController.text != "") {
                        final SharedPreferences mySharedPreferences =
                            await SharedPreferences.getInstance();
                        if (checkBoxValue == true) {
                          await mySharedPreferences.setString(
                              "email", emailController.text);
                          await mySharedPreferences.setString(
                              "password", passwordController.text);
                          await mySharedPreferences.setBool(
                              "checkBoxValue", true);
                        } else {
                          await mySharedPreferences.setString("email", "");
                          await mySharedPreferences.setString("password", "");
                          await mySharedPreferences.setBool(
                              "checkBoxValue", false);
                        }
                        loginAPI(context, emailController.text,
                            passwordController.text);
                      } else {
                        myToast(context, "No Email or Password");
                      }
                    },
                    height: 50,
                    color: const Color.fromRGBO(23, 92, 196, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.facebook_rounded,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/youtube.svg"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Copyright ©2022-2023 Academic Advising",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
