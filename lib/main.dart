import 'dart:html' as html;

import 'package:auto_animated/auto_animated.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_education_movement/configure_web.dart';
import 'package:peru_education_movement/mainScreens/aboutUs.dart';
import 'package:peru_education_movement/mainScreens/curriculum.dart';
import 'package:peru_education_movement/mainScreens/signUp.dart';
import 'package:peru_education_movement/mainScreens/tutors.dart';
import 'package:peru_education_movement/others/constants.dart';
import 'package:peru_education_movement/others/pageNotFound.dart';
import 'package:peru_education_movement/others/signUpCompleted.dart';
import 'package:peru_education_movement/others/styles.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        primaryColor: Colors.red[400],
      ),
      routes: {
        '/home': (contact) => HomeScreen(),
        '/about-us': (context) => AboutUs(),
        '/curriculum': (context) => Curriculum(),
        '/tutors': (context) => Tutors(),
        '/sign-up': (context) => SignUp(),
        '/sign-up/thank-you': (context) => SignUpCompleted(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return PageNotFound();
        });
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _launchMailClient() async {
    const mailUrl = 'mailto:perueducationmovement@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String aboutUsText =
        "Project Peru was initially established as part of the Learn Care Share initiative(501(c) non profit) to offer free English classes to a few students from low-income families in a small town of Huariaca, Peru. This project was started by Mercedes Canham, a Peru Native, with the help of a few Bay Area high school students who are fluent in Spanish. Soon Ms. Canhan realized that she needed to involve more tutors to scale up this program and benefit more kids in Peru. At the pandemic's beginning, Canham reached out to us and asked if a few students from Monta Vista could teach more kids from Peruvian villages over Zoom.";
    String whyUsText =
        "As high schoolers who are fluent in English and have backgrounds in Spanish, we are able to bring compassion to our lessons and are able to effectively connect with our students in order to make the content enjoyable for children of all ages. We dedicate time weekly in order to plan for the class and create interactive materials that allow our students to get a more immersive experience. Despite holding classes in a group environment, we ensure that every student receives equal attention and opportunities to learn and flourish.";

    final List<String> imgList = [
      'assets/intro1.JPG',
      'assets/intro2.JPG',
      'assets/intro3.JPG',
      'assets/intro4.JPG',
      'assets/intro5.JPG',
      'assets/intro6.JPG',
    ];

    return Title(
      title: "Peru Education Movement",
      color: Colors.black,
      child: Scaffold(
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
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
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
        body: AnimateIfVisibleWrapper(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                leading: size.width < 450
                    ? null
                    : FittedBox(child: Image.asset("assets/pem_logo.png")),
                pinned: true,
                backgroundColor: Colors.grey[500],
                expandedHeight: size.height,
                actions: size.width < 450 ? null : navBarActions,
                flexibleSpace: FlexibleSpaceBar(
                  title: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: size.longestSide * 0.02,
                        color: mainColor,
                      ),
                      children: [
                        TextSpan(
                            text: "Peru ",
                            style: TextStyle(
                              color: Colors.white70,
                            )),
                        TextSpan(
                          text: "Education ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: "Movement",
                            style: TextStyle(
                              color: Colors.white70,
                            )),
                      ],
                    ),
                  ),
                  centerTitle: false,
                  collapseMode: CollapseMode.pin,
                  background: IgnorePointer(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        pageSnapping: false,
                        disableCenter: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                            const Duration(seconds: 3, milliseconds: 500),
                      ),
                      items: imgList
                          .map(
                            (item) => Container(
                              padding: EdgeInsets.zero,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.2),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    mainColor.withOpacity(0.6),
                                    BlendMode.dstATop,
                                  ),
                                  image: AssetImage(
                                    item,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  //About Us Screen
                  Container(
                    height: size.height,
                    decoration: buildBackgroundDecoration(
                        "assets/books_with_graduation_hat.jpg"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(
                            direction: size.width < 450
                                ? Axis.vertical
                                : Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimateIfVisible(
                                key: Key('item0'),
                                duration: Duration(milliseconds: 500),
                                builder: (
                                  context,
                                  Animation<double> animation,
                                ) =>
                                    FadeTransition(
                                  opacity: buildFadeTween().animate(animation),
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: size.longestSide * 0.043,
                                        color: mainColor,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: "About ",
                                            style: TextStyle(
                                              color: Colors.white70,
                                            )),
                                        TextSpan(
                                          text: "Us",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ContainerSizedBox(),
                              Container(
                                width: size.width < 450
                                    ? size.width * 0.6
                                    : size.width * 0.3,
                                child: Text(
                                  "$aboutUsText",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.longestSide * 0.015,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/about-us');
                            },
                            child: Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: size.longestSide * 0.015,
                                backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                            ),
                            style: buildHomeButtonStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Why Us Screen
                  Container(
                    height: size.height,
                    decoration: buildBackgroundDecoration(
                        "assets/books_with_graduation_hat.jpg"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(
                          verticalDirection: VerticalDirection.up,
                          direction: size.width < 450
                              ? Axis.vertical
                              : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width < 450
                                  ? size.width * 0.6
                                  : size.width * 0.3,
                              child: Text(
                                "$whyUsText",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.longestSide * 0.015,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ContainerSizedBox(),
                            AnimateIfVisible(
                              key: Key('item5'),
                              duration: Duration(milliseconds: 500),
                              builder: (
                                context,
                                Animation<double> animation,
                              ) =>
                                  FadeTransition(
                                opacity: buildFadeTween().animate(animation),
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: size.longestSide * 0.043,
                                      color: mainColor,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "Why ",
                                          style: TextStyle(
                                            color: Colors.white70,
                                          )),
                                      TextSpan(
                                        text: "Us",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///3 Cards Container
                  Container(
                    height: size.height,
                    decoration: buildBackgroundDecoration("assets/main4.JPG"),
                    child: Flex(
                      direction:
                          size.width < 450 ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomePageCard(
                          keyString: 'item1',
                          title: 'Sign Up',
                          imagePath: 'assets/signup.JPG',
                          location: 'sign-up',
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: HomePageCard(
                            keyString: 'item2',
                            title: 'Our\nCurriculum',
                            imagePath: 'assets/ourcurriculum.JPG',
                            location: 'curriculum',
                          ),
                        ),
                        HomePageCard(
                          keyString: 'item3',
                          title: 'Our Tutors',
                          imagePath: 'assets/ourtutors.JPG',
                          location: 'tutors',
                        ),
                      ],
                    ),
                  ),

                  ///Contact Us Screen
                  Container(
                    height: size.height,
                    decoration:
                        buildBackgroundDecoration("assets/contactus.jpg"),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimateIfVisible(
                          key: Key('item6'),
                          duration: Duration(milliseconds: 500),
                          builder: (
                            context,
                            Animation<double> animation,
                          ) =>
                              FadeTransition(
                            opacity: buildFadeTween().animate(animation),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: size.longestSide * 0.043,
                                  color: mainColor,
                                ),
                                children: [
                                  TextSpan(
                                      text: "Contact ",
                                      style: TextStyle(
                                        color: Colors.white70,
                                      )),
                                  TextSpan(
                                    text: "Us",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ContainerSizedBox(),
                        Container(
                          width: size.width < 450
                              ? size.width * 0.6
                              : size.width * 0.3,
                          child: Text(
                            "Feel free to contact us through any of the methods below and ask any questions!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.longestSide * 0.015,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: size.longestSide * 0.02),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 40,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _launchMailClient();
                                },
                                color: Colors.grey[300],
                                icon: Icon(Icons.mail_outlined),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              IconButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://www.instagram.com/peru.education.movement/',
                                      "_blank");
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                ),
                                hoverColor: mainColor.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              IconButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://github.com/RhinoInani/peru_education_movement',
                                      "_blank");
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.github,
                                  color: Colors.white,
                                ),
                                hoverColor: mainColor.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tween<double> buildFadeTween() {
    return Tween<double>(
      begin: 0,
      end: 1,
    );
  }

  ButtonStyle buildHomeButtonStyle() {
    return OutlinedButton.styleFrom(
      backgroundColor: mainColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  BoxDecoration buildBackgroundDecoration(String asset) {
    return BoxDecoration(
      color: Colors.grey[450],
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          mainColor.withOpacity(0.6),
          BlendMode.dstATop,
        ),
        image: AssetImage(
          '$asset',
        ),
      ),
    );
  }
}

class ContainerSizedBox extends StatelessWidget {
  const ContainerSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.06,
      height: size.height * 0.03,
    );
  }
}

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    Key? key,
    required this.keyString,
    required this.imagePath,
    required this.location,
    required this.title,
  }) : super(key: key);

  final String keyString;
  final String imagePath;
  final String location;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimateIfVisible(
      key: Key(keyString),
      duration: Duration(milliseconds: 700),
      builder: (
        context,
        Animation<double> animation,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.3),
          end: Offset.zero,
        ).animate(animation),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/$location');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[400],
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  mainColor.withOpacity(0.6),
                  BlendMode.dstATop,
                ),
                image: AssetImage(
                  '$imagePath',
                ),
              ),
            ),
            height: size.width < 450 ? size.height * 0.25 : size.height * 0.5,
            width: size.width < 450 ? size.width * 0.9 : size.width * 0.3,
            child: Center(
              child: Text(
                "$title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.longestSide * 0.015,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
