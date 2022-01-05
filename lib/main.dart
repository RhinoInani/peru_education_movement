import 'package:auto_animated/auto_animated.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_education_movement/configure_web.dart';
import 'package:peru_education_movement/constants.dart';

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
        body: AnimateIfVisibleWrapper(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                leading: FittedBox(child: Image.asset("assets/pem_logo.png")),
                pinned: true,
                floating: true,
                backgroundColor: Colors.grey[500],
                expandedHeight: size.height * 0.6,
                actions: navBarActions,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Peru Education Movement"),
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
                  Container(
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(
                            direction: size.width < 400
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
                                  opacity: Tween<double>(
                                    begin: 0,
                                    end: 1,
                                  ).animate(animation),
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: size.longestSide * 0.04,
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
                              SizedBox(
                                width: size.width * 0.06,
                                height: size.height * 0.03,
                              ),
                              Container(
                                width: size.width < 300
                                    ? size.width * 0.2
                                    : size.width * 0.3,
                                child: Text(
                                  "Along with traditional book discussions, we host activity meetings where YOU will have the opportunity to participate in creative writing, win fun prizes in book-related trivia competitions, and plan community-oriented activities.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.longestSide * 0.013,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: size.longestSide * 0.013,
                                backgroundColor: Colors.transparent,
                                color: Colors.white,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: mainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
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
}
