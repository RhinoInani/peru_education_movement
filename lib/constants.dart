import 'package:flutter/material.dart';
import 'package:peru_education_movement/buttonStyles.dart';

String currentScreen = "home";

bool phone = false;

Color mainColor = Color.fromRGBO(203, 76, 78, 1);

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
];
