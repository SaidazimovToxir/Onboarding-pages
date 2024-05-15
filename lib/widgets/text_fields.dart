import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTitleField extends StatefulWidget {
  final IconData icon;
  final String hindText;
  const MyTitleField({
    super.key,
    required this.icon,
    required this.hindText,
  });

  @override
  State<MyTitleField> createState() => _MyTitleFieldState();
}

class _MyTitleFieldState extends State<MyTitleField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        hintText: widget.hindText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class MyPasswordField extends StatefulWidget {
  bool checkEye;
  Function() onPressed;
  MyPasswordField({
    super.key,
    required this.checkEye,
    required this.onPressed,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  @override
  Widget build(BuildContext context) {
    print(widget.checkEye);
    return TextField(
      obscureText: widget.checkEye ? false : true,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        prefixIcon: const Icon(
          Icons.key_outlined,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            widget.checkEye ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: Colors.grey,
          ),
        ),
        hintText: "***********",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
