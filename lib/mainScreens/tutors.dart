import 'package:flutter/material.dart';
import 'package:peru_education_movement/others/styles.dart';

import '../others/constants.dart';

class Tutors extends StatelessWidget {
  const Tutors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.black,
      title: "Our Tutors",
      child: Scaffold(
        drawer: size.width < 450
            ? MobileDrawer(
                size: size,
              )
            : null,
        body: CustomScrollView(
          slivers: [
            GenericSliverAppBar(size: size),
            CollapsingHeader(
              size: size,
              imagePath: 'assets/books_with_graduation_hat.jpg',
              title: 'Our Tutors',
              fontColor: mainColor,
            ),
            SliverPadding(
              padding: EdgeInsets.all(size.longestSide * 0.01),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.0175,
                    ),
                    child: TutorsCard(
                      size: size,
                      bodyText: aboutUsBody[index],
                      headerText: aboutUsHeaders[index],
                      imagePath: 'assets/pem_logo.png',
                      flipped: index % 2 == 0,
                      imageHeight: size.height * 0.3,
                      imageWidth: size.width * 0.3,
                    ),
                  );
                },
                childCount: aboutUsHeaders.length,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(size.longestSide * 0.03),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorsCard extends StatelessWidget {
  const TutorsCard({
    Key? key,
    required this.size,
    required this.imageHeight,
    required this.imageWidth,
    required this.bodyText,
    required this.imagePath,
    required this.flipped,
    required this.headerText,
  }) : super(key: key);

  final Size size;
  final double imageHeight;
  final double imageWidth;
  final String bodyText;
  final String imagePath;
  final bool flipped;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.longestSide * 0.015),
      child: flipped
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: size.longestSide * 0.017),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "$bodyText",
                        style: TextStyle(fontSize: size.longestSide * 0.012),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.longestSide * 0.005),
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.scaleDown,
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(size.longestSide * 0.005),
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.scaleDown,
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
                Container(
                  width: size.width * 0.7 - imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$headerText",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: size.longestSide * 0.017),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "$bodyText",
                        style: TextStyle(fontSize: size.longestSide * 0.012),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
