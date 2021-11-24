import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_education_movement/configure_web.dart';
import 'package:peru_education_movement/user_data.dart';

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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double offset = 0;
  late ScrollController controller1;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  );

  @override
  void initState() {
    controller1 = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    controller1.addListener(() {
      setState(() {
        offset = controller1.offset;
      });
      if (offset >= size.height * 0.4) _controller.forward();
      if (offset < size.height * 0.4 && _animation.isCompleted) {
        _controller.reverse();
      }
    });

    if (size.width < 400) {
      setState(() {
        phone = true;
      });
    }

    //fadeinimage

    return Scaffold();

    // return Title(
    //   title: "Peru Education Movement",
    //   color: Colors.red,
    //   child: ListView(
    //     controller: controller1,
    //     scrollDirection: Axis.vertical,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: Colors.red[400]!.withOpacity(0.2),
    //           image: DecorationImage(
    //             fit: BoxFit.cover,
    //             colorFilter: ColorFilter.mode(
    //               Colors.red[900]!.withOpacity(0.5),
    //               BlendMode.dstATop,
    //             ),
    //             image: const AssetImage('assets/books_with_graduation_hat.jpg'),
    //           ),
    //         ),
    //         child: SizedBox(
    //           height: size.height,
    //           width: size.width,
    //         ),
    //       ),
    //       Container(
    //         height: size.height,
    //         decoration: BoxDecoration(
    //           color: Colors.red[400]!.withOpacity(0.2),
    //           image: DecorationImage(
    //             fit: BoxFit.cover,
    //             colorFilter: ColorFilter.mode(
    //               Colors.red[900]!.withOpacity(0.5),
    //               BlendMode.dstATop,
    //             ),
    //             image: const AssetImage('assets/books_with_graduation_hat.jpg'),
    //           ),
    //         ),
    //         child: FadeTransition(
    //           opacity: _animation,
    //           child: RichText(
    //             text: TextSpan(
    //               style: GoogleFonts.galdeano(
    //                 fontSize: phone
    //                     ? size.longestSide * 0.03
    //                     : size.longestSide * 0.05,
    //                 shadows: <Shadow>[
    //                   Shadow(
    //                     offset: const Offset(0, 7),
    //                     blurRadius: 3.0,
    //                     color: Colors.grey.withOpacity(0.5),
    //                   ),
    //                 ],
    //               ),
    //               children: const [
    //                 TextSpan(
    //                   text: "Peru",
    //                   style: TextStyle(
    //                     color: Colors.red,
    //                   ),
    //                 ),
    //                 TextSpan(
    //                   text: " Education",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //                 TextSpan(
    //                   text: " Movement",
    //                   style: TextStyle(
    //                     color: Colors.red,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
