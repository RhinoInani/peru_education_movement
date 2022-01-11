import 'package:flutter/material.dart';
import 'package:peru_education_movement/others/styles.dart';

import '../others/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.black,
      title: "About Us",
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
              title: 'About Us',
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
                    child: AboutUsCard(
                      size: size,
                      bodyText: aboutUsBody[index],
                      headerText: aboutUsHeaders[index],
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

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({
    Key? key,
    required this.size,
    required this.bodyText,
    required this.headerText,
  }) : super(key: key);

  final Size size;
  final String bodyText;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.all(size.longestSide * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$headerText",
                style: TextStyle(
                    color: mainColor, fontSize: size.longestSide * 0.017),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                width: size.width * 0.9,
                child: Text(
                  "$bodyText",
                  style: TextStyle(
                    fontSize: size.longestSide * 0.012,
                  ),
                  softWrap: true,
                ),
              ),
            ],
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
