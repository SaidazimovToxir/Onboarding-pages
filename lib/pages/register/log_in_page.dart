import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lesson_36/pages/register/create_accaount_page.dart';
import 'package:lesson_36/widgets/dialog_button.dart';
import 'package:lesson_36/widgets/my_button.dart';
import 'package:lesson_36/widgets/text_fields.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool checkEye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Let's login to Connect oyur email",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const MyTitleField(
                    icon: CupertinoIcons.mail_solid,
                    hindText: "name@example.com",
                  ),
                  const Gap(20.0),
                  MyPasswordField(
                    checkEye: checkEye,
                    onPressed: () {
                      setState(() {
                        checkEye = !checkEye;
                      });
                    },
                  ),
                  const Gap(20.0),
                  const Text(
                    "Forget your Password ?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Did you have an account ?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(250.0),
                      MyButton(
                          title: "Log in",
                          onPressed: () {
                            MyDialog.showAccountActivatedDialog(context);
                          }),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyLogoButton(
                              imgUrl:
                                  "https://cdn-icons-png.flaticon.com/128/0/747.png",
                              title: "Apple",
                            ),
                            Gap(20.0),
                            MyLogoButton(
                              imgUrl:
                                  "https://cdn-icons-png.flaticon.com/128/300/300221.png",
                              title: "Google",
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "By continuing you agree to loana's",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Terms of Use",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "&",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
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
