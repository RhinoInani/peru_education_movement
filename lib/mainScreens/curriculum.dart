import 'package:flutter/material.dart';

import '../others/constants.dart';
import '../others/styles.dart';
import 'aboutUs.dart';

class Curriculum extends StatelessWidget {
  const Curriculum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Title(
      color: Colors.black,
      title: "Our Curriculum",
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
              title: 'Our curriculum',
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
