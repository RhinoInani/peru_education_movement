import 'package:flutter/material.dart';
import 'package:peru_education_movement/constants.dart';

ButtonStyle highlightButtonStyle() {
  return ButtonStyle(
    foregroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return Colors.red[300]!;
      if (states.contains(MaterialState.hovered)) return Colors.black;
      if (states.contains(MaterialState.pressed)) return Colors.black;
      return Colors.white;
    }),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}

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
