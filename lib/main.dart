import 'package:auto_animated/auto_animated.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

    final List<String> imgList = [
      'assets/books_with_graduation_hat.jpg',
      'assets/books_with_graduation_hat.jpg',
      'assets/books_with_graduation_hat.jpg',
      'assets/books_with_graduation_hat.jpg',
      'assets/books_with_graduation_hat.jpg',
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
                    decoration: buildBackgroundDecoration(),
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
                                  "$lorem",
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
                    decoration: buildBackgroundDecoration(),
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
                                  "$lorem",
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
                            ]),
                        // Padding(
                        //   padding: EdgeInsets.only(top: size.height * 0.05),
                        //   child: OutlinedButton(
                        //     onPressed: () {},
                        //     child: Text(
                        //       "Why Us",
                        //       style: TextStyle(
                        //         fontSize: size.longestSide * 0.015,
                        //         backgroundColor: Colors.transparent,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     style: buildHomeButtonStyle(),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  //3 Cards Container
                  Container(
                    height: size.height,
                    decoration: buildBackgroundDecoration(),
                    child: Flex(
                      direction:
                          size.width < 450 ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomePageCard(
                          keyString: 'item1',
                          title: 'Sign Up',
                          imagePath: 'assets/books_with_graduation_hat.jpg',
                          location: 'sign-up',
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: HomePageCard(
                            keyString: 'item2',
                            title: 'Our\nCurriculum',
                            imagePath: 'assets/books_with_graduation_hat.jpg',
                            location: 'curriculum',
                          ),
                        ),
                        HomePageCard(
                          keyString: 'item3',
                          title: 'Our Tutors',
                          imagePath: 'assets/books_with_graduation_hat.jpg',
                          location: 'tutors',
                        ),
                      ],
                    ),
                  ),
                  //Contact Us Screen
                  Container(
                    height: size.height,
                    decoration: buildBackgroundDecoration(),
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
                            "Feel free to reach out with any questions using any of the links below!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: size.longestSide * 0.015,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.longestSide * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _launchMailClient();
                                },
                                color: Colors.grey[300],
                                icon: Icon(Icons.mail_outlined),
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

  BoxDecoration buildBackgroundDecoration() {
    return BoxDecoration(
      color: Colors.grey[450],
      image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          mainColor.withOpacity(0.6),
          BlendMode.dstATop,
        ),
        image: AssetImage(
          'assets/books_with_graduation_hat.jpg',
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
