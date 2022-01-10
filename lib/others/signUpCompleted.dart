import 'package:flutter/material.dart';
import 'package:peru_education_movement/others/constants.dart';
import 'package:peru_education_movement/others/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpCompleted extends StatelessWidget {
  const SignUpCompleted({Key? key}) : super(key: key);

  void _launchMailClient() async {
    const mailUrl = 'mailto:perueducationmovement@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: size.width < 400
          ? MobileDrawer(
              size: size,
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        leading: size.width < 400
            ? null
            : FittedBox(child: Image.asset("assets/pem_logo.png")),
        backgroundColor: Colors.grey[500],
        title: Text("Peru Education Movement"),
        actions: navBarActions,
      ),
      body: Container(
        height: size.height - size.height * 0.08,
        width: size.width,
        decoration: new BoxDecoration(
          color: mainColor.withOpacity(0.2),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              mainColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            image: AssetImage('assets/books_with_graduation_hat.jpg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Thank you $recentSignUp for signing up!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: secondColor,
                    decorationThickness: 0.7,
                    color: mainColor,
                    fontSize: size.longestSide * 0.034,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "We are excited to see you soon in the upcoming events! \nLook out for more details in your email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontSize: size.longestSide * 0.014,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Text(
                  "If you have any questions please reach out to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontSize: size.longestSide * 0.014,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _launchMailClient();
                    },
                    child: Text(
                      "perueducationmovement@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        decorationColor: secondColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.7,
                        fontSize: size.longestSide * 0.017,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: size.longestSide * 0.015,
                      backgroundColor: Colors.transparent,
                      color: secondColor,
                    ),
                  ),
                  style: highlightButtonStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
