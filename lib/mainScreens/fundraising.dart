import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:peru_education_movement/others/constants.dart';
import 'package:peru_education_movement/others/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Fundrasing extends StatelessWidget {
  const Fundrasing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration buildBackgroundDecoration(String asset) {
      return BoxDecoration(
        color: Colors.grey[450],
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            mainColor.withOpacity(0.6),
            BlendMode.dstIn,
          ),
          image: AssetImage(
            '$asset',
          ),
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: size.width < 450
          ? Drawer(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        FittedBox(
                            child: Image.asset(
                          'assets/pem_logo.png',
                          width: size.width * 0.5,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          child: ListTile(
                            title: Text("${drawerTitles[index]}"),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('${drawerOnTap[index]}');
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: ListTile(
                      title: Text("${drawerTitles[index]}"),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('${drawerOnTap[index]}');
                      },
                    ),
                  );
                },
                itemCount: drawerTitles.length,
              ),
            )
          : null,
      appBar: size.width > 450
          ? AppBar(
              elevation: 0,
              leading: size.width < 450
                  ? null
                  : FittedBox(child: Image.asset("assets/pem_logo.png")),
              backgroundColor: Colors.grey[500],
              actions: size.width < 450 ? null : navBarActions,
            )
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[500],
            ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: buildBackgroundDecoration("assets/fundraising.jpg"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
              verticalDirection: VerticalDirection.down,
              direction: size.width < 450 ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: size.longestSide * 0.043,
                      color: mainColor,
                    ),
                    children: [
                      TextSpan(
                          text: "Fund",
                          style: TextStyle(
                            color: Colors.white70,
                          )),
                      TextSpan(
                        text: "raising",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ContainerSizedBox(),
                Container(
                    width:
                        size.width < 450 ? size.width * 0.6 : size.width * 0.3,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "We are aiming to solve the internet bandwidth issue among the students and provide them with individual devices to attend classes without borrowing their parents' phones or computers. Since the beginning of the pandemic, we have already raised money to help one group of students have local internet access installed in their town. The Monta Vista Chapter is under the non-profit organization ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.longestSide * 0.015,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Learn Care Share",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.longestSide * 0.015,
                              color: mainColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = "https://www.learncareshare.org";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                          ),
                          TextSpan(
                            text:
                                "which has received 501(c) status. The goal at our chapter is to organize a fundraising drive which can help to provide local internet access and buy devices locally from Peru to distribute to our students. This will help our students accelerate their learning and be prepared for the next step of their lives. ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.longestSide * 0.015,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
