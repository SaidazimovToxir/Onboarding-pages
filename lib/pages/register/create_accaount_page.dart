import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_36/pages/register/log_in_page.dart';
import 'package:lesson_36/pages/register/verification_with_phone.dart';
import 'package:lesson_36/widgets/my_button.dart';
import 'package:lesson_36/widgets/text_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<RegisterPage> {
  bool checkEye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
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
                    "Register",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Create your account for your schedule",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const MyTitleField(
                    icon: CupertinoIcons.person,
                    hindText: "Your name",
                  ),
                  const Gap(20.0),
                  const MyTitleField(
                    icon: CupertinoIcons.mail,
                    hindText: "Your Email",
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
                  MyPasswordField(
                    checkEye: checkEye,
                    onPressed: () {
                      setState(() {
                        checkEye = !checkEye;
                      });
                    },
                  ),
                  const Gap(20.0),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                  builder: (context) => const LogInPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign in here",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(100.0),
                      MyButton(
                          title: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PhoneNumberVerificationPage(),
                              ),
                            );
                          }),
                      const Gap(20.0),
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
