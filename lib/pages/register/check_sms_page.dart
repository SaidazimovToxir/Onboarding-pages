import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_36/widgets/dialog_button.dart';
import 'package:lesson_36/widgets/my_button.dart';

class SMSCodeVerificationPage extends StatefulWidget {
  @override
  _SMSCodeVerificationPageState createState() =>
      _SMSCodeVerificationPageState();
}

class _SMSCodeVerificationPageState extends State<SMSCodeVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  List<String> _smsCode = List.generate(4, (index) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Country of residance",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Add your Phone Number for Verification ID",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => SizedBox(
                  height: 60,
                  width: 70,
                  child: TextField(
                    controller: _controllers[index],
                    onChanged: (value) {
                      setState(() {
                        _smsCode[index] = value;
                      });
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      hintText: "0",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20.0),
            const Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.grey,
                ),
                Gap(10.0),
                Text(
                  "Helper text",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(350.0),
                    MyButton(
                        title: "Continue",
                        onPressed: () {
                          MyDialog.showAccountActivatedDialog(context);
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
    );
  }
}
