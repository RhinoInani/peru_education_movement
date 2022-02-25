import 'package:flutter/material.dart';

String currentScreen = "home";

bool phone = false;

Color mainColor = Color.fromRGBO(203, 76, 78, 1);
Color secondColor = Colors.grey;
String recentSignUp = "";

String lorem =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

List<String> aboutUsHeaders = [
  "The Primary Mission",
  "Our Goals",
  "Open Community",
  "Have Fun",
];

List<String> aboutUsBody = [
  "Our primary mission is to teach English in an informal environment to some students in Peru who are often the same age as us. As part of the overall Project Peru, we are currently teaching students in six different towns in Peru: Huariaca, Huánuco, Huancayo, Lima, Cerro de Pasco, and Arequipa. Project Peru's Monta Vista chapter has approximately 30 students on a weekly basis, and we group them in two classes with 3-4 tutors per class. Each class has been created based on the children's age and English knowledge level. Most of our students do not own laptops or smartphones, but they use their parents' smartphones to connect to their respective classes. Our students range from 9 to 15 years old, and we are currently working towards providing laptops to most of our students.",
  "We realized over the pandemic the power of lessons over the internet. Even when everything came to a grinding halt, we continued our high school over zoom. We realized that everyone is not so fortunate. Hence, we started looking for opportunities to serve the community that does not have access to teachers/tutors to continue education over the pandemic. As soon as we heard from Ms. Canham(a native from the villages where our students live) about the possibility of serving communities in the remote villages of Peru, we got together to form this Monta Vista Chapter of Project Peru. Our goal is not only to continue teaching English to these kids year-round but also to recruit more tutors from the sophomore grade of our high school to continue the online lessons for these Peruvian students. We are also planning to expand the opportunity to kids from different villages in Peru.",
  "We want to set up Project Peru so that the future Monta Vista Community can continue this online tutoring to prospective Peruvian students through the Learn Care Share non profit. We are discussing making it a specific Monta Vista club which will ensure a steady source of tutors even after we graduate from Monta Vista. We are solely dependent on Ms. Canham to coordinate with the Peruvian students. We plan to visit Peru next year with Ms. Canham and meet the students and their parents in person. This will also allow us to know the local people and gain their trust to expand this program in the future.",
  "Though we are passionate about serving the community and helping the less privileged to achieve their dreams, we want to make this a fun experience for everyone. This is not part of any school work or rigorous certification. But we hope to keep it fun and exciting and pass on this spirit to the new tutors to continue this program. Currently, we are looking for high school volunteers who are interested in joining our tutoring team.",
];

List<String> curriculumHeaders = [
  "Creation of the Curriculum",
  "Adaptations to the Curriculum",
];

List<String> curriculumBody = [
  "Our curriculum consists of multiple lessons curated by our very own tutors who share these plans with students to provide an effective learning environment. These lesson plans are a fusion of videos, worksheets, and real-life examples to prepare students for the experiences that they will encounter. Tutors collaborate together to create activities that are not only educational and informational, but to add an element of fun so that students can enjoy the process of learning a new language.",
  "As our curriculum progresses, our tutors work to ensure our lessons are well suited for every student. We organize meetings with the tutors and debrief which parts of the lessons are working well and which are not. Based on our analysis, we then tweak the lesson plan for the following week to ensure all of the children are learning at a healthy pace. Learning a new language is difficult as the process requires many changes along the way, and our tutors work hard to ensure those changes happen. Our curriculum is always suited for the best interest of the children and their progress and enjoyment is our top priority.",
];
