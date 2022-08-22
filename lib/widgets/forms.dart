import 'package:flutter/material.dart';

class form extends StatefulWidget {
  final title;
  Widget? Icon;
  Widget? prefixIcon;

  form({
    Key? key,
    this.title,
    this.Icon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: widget.title,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                fillColor: Colors.white10,
                filled: true,
                suffixIcon: widget.Icon ?? SizedBox(),
                prefixIcon: widget.prefixIcon ?? SizedBox()),
          ),
        ),
      ],
    );
  }
}
