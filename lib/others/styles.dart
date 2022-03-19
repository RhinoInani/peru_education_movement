import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_education_movement/others/constants.dart';

ButtonStyle highlightButtonStyle() {
  return ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.red[300]!;
      if (states.contains(MaterialState.hovered)) return mainColor;
      if (states.contains(MaterialState.pressed)) return Colors.black;
      return Colors.white;
    }),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}

List<Widget> navBarActions = [
  NavBarButton(
    title: "Home",
    checkNamed: "Home",
    pushNamed: '/',
  ),
  NavBarButton(
    title: "About us",
    checkNamed: "About us",
    pushNamed: '/about-us',
  ),
  NavBarButton(
    title: "Sign up",
    checkNamed: "Sign up",
    pushNamed: '/sign-up',
  ),
  NavBarButton(
    title: "Our curriculum",
    checkNamed: "curriculum",
    pushNamed: '/curriculum',
  ),
  NavBarButton(
    title: "Our tutors",
    checkNamed: "tutors",
    pushNamed: '/tutors',
  ),
  NavBarButton(
      title: 'Fundraising', checkNamed: 'fund', pushNamed: '/fundraising'),
];

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.title,
    required this.checkNamed,
    required this.pushNamed,
  }) : super(key: key);

  final String title;
  final String checkNamed;
  final String pushNamed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
      ),
      child: TextButton(
        onPressed: () {
          if (currentScreen != "$checkNamed") {
            Navigator.of(context).pushNamed('$pushNamed');
          }
          currentScreen = "$checkNamed";
        },
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: size.longestSide * 0.014,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: highlightButtonStyle(),
      ),
    );
  }
}

class CollapsingHeader extends StatelessWidget {
  const CollapsingHeader({
    Key? key,
    required this.size,
    required this.title,
    required this.fontColor,
    required this.imagePath,
  }) : super(key: key);

  final Size size;
  final String title;
  final Color fontColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[500],
      elevation: 0,
      leading: Container(),
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: Text(
          "$title",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            color: fontColor,
            fontSize: size.longestSide * 0.024,
          ),
        ),
        background: Container(
          padding: EdgeInsets.zero,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.red[300],
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.red[300]!,
                BlendMode.dstATop,
              ),
              image: AssetImage(
                "$imagePath",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> drawerTitles = [
  "Home",
  "About Us",
  "Sign Up",
  "Our Curriculum",
  "Our Tutors",
  "Fundraising",
];

final List<String> drawerOnTap = [
  "/",
  "/about-us",
  "/sign-up",
  "/curriculum",
  "/tutors",
  "/fundraising"
];

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: ListTile(
                    title: Text("${drawerTitles[index]}"),
                    onTap: () {
                      Navigator.of(context).pushNamed('${drawerOnTap[index]}');
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
                Navigator.of(context).pushNamed('${drawerOnTap[index]}');
              },
            ),
          );
        },
        itemCount: drawerTitles.length,
      ),
    );
  }
}

class GenericSliverAppBar extends StatelessWidget {
  const GenericSliverAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      leading: size.width < 450
          ? null
          : FittedBox(child: Image.asset("assets/pem_logo.png")),
      floating: true,
      title: size.width < 450
          ? RichText(
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
            )
          : null,
      backgroundColor: Colors.grey[500],
      actions: size.width < 450 ? null : navBarActions,
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
