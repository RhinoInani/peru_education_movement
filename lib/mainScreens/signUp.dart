import 'package:flutter/material.dart';
import 'package:peru_education_movement/others/sheetsBackend.dart';
import 'package:peru_education_movement/others/styles.dart';

import '../others/constants.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController hear = TextEditingController();
  TextEditingController ques = TextEditingController();

  bool sheets = false;

  String errorTextEmail = "";
  String errorTextName = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: Title(
        color: Colors.white,
        title: "Sign Up",
        child: Scaffold(
          drawer: size.width < 400 ? MobileDrawer(size: size) : null,
          body: CustomScrollView(
            slivers: [
              GenericSliverAppBar(size: size),
              CollapsingHeader(
                size: size,
                imagePath: 'assets/books_with_graduation_hat.jpg',
                title: 'Sign Up',
                fontColor: mainColor,
              ),
              SliverPadding(
                padding: EdgeInsets.all(size.longestSide * 0.01),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  MouseRegion(
                    onEnter: (point) async {
                      if (!sheets) {
                        sheets = await SheetsBackend.init();
                      }
                    },
                    child: Container(
                      height: size.height * 0.2,
                      padding: EdgeInsets.all(size.longestSide * 0.02),
                      child: TextFormField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Name *",
                          hintText: "Please enter your full name",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: size.longestSide * 0.015),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: size.longestSide * 0.015),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1,
                            vertical: size.height * 0.03,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: mainColor,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: mainColor),
                            gapPadding: 10,
                          ),
                          errorText: errorTextName == "" ? null : errorTextName,
                          errorStyle: TextStyle(color: Colors.red[400]),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.red[400]!,
                            ),
                            gapPadding: 10,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.red[400]!,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                        onEditingComplete: () {
                          setState(() {
                            name.text.trim().length < 1
                                ? errorTextName = "Please fill out this field"
                                : errorTextName = "";
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.2,
                    padding: EdgeInsets.all(size.longestSide * 0.02),
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Email *",
                        hintText: "Please enter your email address",
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: size.longestSide * 0.015),
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: size.longestSide * 0.015),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.03,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: mainColor),
                          gapPadding: 10,
                        ),
                        errorText: errorTextEmail == "" ? null : errorTextEmail,
                        errorStyle: TextStyle(color: Colors.red[400]),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.red[400]!,
                          ),
                          gapPadding: 10,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.red[400]!,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (string) {
                        try {
                          bool emailValid;
                          emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(string.trim());
                          emailValid
                              ? setState(() {
                                  errorTextEmail = "";
                                })
                              : setState(() {
                                  errorTextEmail = "Please enter a valid email";
                                });
                        } catch (FormatException) {
                          setState(() {
                            errorTextEmail = "Please enter a valid email";
                          });
                        }
                      },
                    ),
                  ),
                  CustomTextField(
                    header: "How did you hear about us?",
                    controller: hear,
                    hint: "Let us know how you heard about us!",
                    textInputType: TextInputType.text,
                    size: size,
                    height: size.height * 0.25,
                  ),
                  CustomTextField(
                    header: "Any questions or comments",
                    controller: ques,
                    hint: "Do you have any questions or comments?",
                    textInputType: TextInputType.text,
                    size: size,
                    height: size.height * 0.25,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 0.7,
                          ),
                        ),
                        width: size.width * 0.85,
                        height: size.height * 0.07,
                        child: Center(
                          child: Text(
                            "Submit",
                          ),
                        ),
                      ),
                      onTap: () async {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email.text.trim());
                        if (emailValid &&
                            name.text.trim().length >= 1 &&
                            email.text.trim().length >= 1) {
                          final submission = {
                            "name": name.text.trim(),
                            "email": email.text.trim(),
                            "hear": hear.text.trim(),
                            "ques": ques.text.trim(),
                          };
                          await SheetsBackend.insert([submission]);
                          setState(() {
                            recentSignUp = name.text.trim();
                          });
                          Navigator.of(context).pushNamed('/sign-up/thank-you');
                          name.clear();
                          email.clear();
                          hear.clear();
                          ques.clear();
                        } else {
                          setState(() {
                            email.text.trim().length < 1
                                ? errorTextEmail = "Please fill out this field"
                                : errorTextEmail = "";
                            name.text.trim().length < 1
                                ? errorTextName = "Please fill out this field"
                                : errorTextName = "";
                          });
                        }
                      },
                    ),
                  ),
                ])),
              ),
              SliverPadding(
                padding: EdgeInsets.all(size.longestSide * 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.header,
    required this.controller,
    required this.hint,
    required this.textInputType,
    required this.size,
    required this.height,
    // required this.error,
  }) : super(key: key);

  final String? header;
  final String? hint;
  final TextInputType? textInputType;
  final Size size;
  final TextEditingController? controller;
  final double height;
  // final bool error;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(widget.size.longestSide * 0.02),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: "${widget.header}",
          hintText: "${widget.hint}",
          labelStyle: TextStyle(
              color: Colors.grey, fontSize: widget.size.longestSide * 0.015),
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: widget.size.longestSide * 0.015),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.1,
            vertical: widget.size.height * 0.03,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: mainColor,
            ),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: mainColor),
            gapPadding: 10,
          ),
          errorText: errorText == "" ? null : errorText,
          errorStyle: TextStyle(color: Colors.red[400]),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red[400]!,
            ),
            gapPadding: 10,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red[400]!,
            ),
            gapPadding: 10,
          ),
        ),
        onEditingComplete: () {
          try {
            bool emailValid;
            widget.textInputType == TextInputType.emailAddress
                ? emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(widget.controller!.text.trim())
                : emailValid = true;
            emailValid
                ? setState(() {
                    errorText = "";
                  })
                : setState(() {
                    errorText = "Please enter a valid email";
                  });
          } catch (FormatException) {
            setState(() {
              errorText = "Please enter a valid email";
            });
          }
        },
      ),
    );
  }
}
