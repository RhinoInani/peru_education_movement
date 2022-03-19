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

List<String> tutorNames = [
  "Kyle",
  "Atul",
  "Vihaan",
  "Amogh",
  "Shuvam",
  "Shreyas",
  "Anoushka",
  "Samyak",
  "Thomas",
  "Stuvi",
  "Farida",
  "Rohin",
];

List<String> tutorBio = [
  "The President of the Monta Vista Learn Care Share chapter, he has dedicated over 100 volunteer hours as a tutor to help the non profit organization strive towards its mission of enabling over 50 students in Peru to develop their English skills. With his role, Kyle utilizes his leadership skills to coordinate the tutors and other directors on a daily basis, driving new accountability in class content/structure, creating a new website, and outreaching to younger members of the community with Vihaan to carry on the Peru mission in the future. Kyle also serves as a tutor throughout the weekly sessions where he applies his 6+ years of Spanish education. During his free time, Kyle enjoys playing soccer with his ECNL(Elite Clubs National League) club team, MVLA, as well as exploring his interests such as finance, learning new languages, and cooking new foods.",
  "Director of Technological Operations at Monta Vista Learn Care Share with over 80 hours dedicated towards the project in charge of organizing and mitigating technology-related problems for both tutors and students in an effort to streamline the education process in an issue-prone environment. Atul additionally serves as a tutor during the weekly sessions to ensure the best online-learning environment available for the students as well as engage in the direct education of the students.",
  "Director of Outreach and Graphical Design at the Monta Vista Learn Care Share Peru initiative with over 80 hours dedicated to the project. Vihaan doubles as a tutor, devoting his time to weekly hour-long engaging lessons designed to capture the young students’ attention, carefully designed content production, and community outreach together with the President of the organization to help grow and sustain this powerful new initiative.",
  "The Vice President of the Monta Vista Learn Care Share chapter, he has dedicated over 80 volunteer hours to help the organization achieve its mission of enabling students in Peru to develop their English skills. Amogh utilizes his experiences with tutoring and marketing to create lesson plans for students and expand the organization.",
  "The Director of Logistics and Tutor Coordination  and a Co-Founder of the Monta Vista Learn Care Share chapter, Shuvam Mukherjee is a junior at Monta Vista High School. He is an avid follower of sports and has been playing competitive soccer from a young age. He is part of the De Anza Force soccer club and plays National Premier League. His hobbies include skiing, biking, traveling, and playing games with his friends. He has a passion for STEM and is enthusiastic about helping others.",
  "The Director of Content and Education of the Monta Vista Learn Care Share chapter, with over 80 volunteer hours dedicated to creating and teaching content enabling students in Peru to develop their English skills. Shreyas utilizes his many years of Spanish education to effectively communicate and educate the children, allowing them to learn and understand English . He dedicates several hours per week working with other tutors to create elaborate and engaging lesson plans, which he then effectively uses to teach students.",
  "Director of communication and strategy, with over 80 volunteer hours, ensures that the students and tutors are engaged in the lesson plan and that the lesson plan itself is best suited for the children’s learning needs. Anoushka, with 4+ years of Spanish education and 2 years of tutoring experience, is in charge of strategizing the lesson plans and communicating effectively with the students and tutors.",
  "Samyak joined the organization at its start and helped to build a foundation for the program. Since doing so, he has dedicated 80+ hours to developing the curriculum and to tutoring students. He’s very invested in the student’s understanding of the content and he patiently and attentively walks the students through the curriculum. He also plans different types of activities to diversify methods of learning in the class. Samyak encourages the students to ask questions because he believes it’s integral to be approachable and build personal connections with the students. He hopes to travel to Peru someday because he’s very intrigued by different cultures and appreciates the enthusiasm of the people he teaches",
  "Thomas is another recent addition to the team, with over 35 volunteer hours. Thomas has a strong desire towards business, particularly finance and investing. Thomas is also passionate about psychology, academic research, and social issues around the world. Thomas considers himself to be empathetic and self-aware, which can be seen across all his activities. As for his hobbies, Thomas loves to play soccer with his friends and reads a wide variety of books. Thomas’ membership on the team stems from the fulfillment he receives from being a tutor. Thomas believes that by teaching Peruvian kids English, they can open themselves up to a plethora of jobs overseas and subsequently impact their communities economically. Thomas’ experience with Learn Care Share has been a spectacular one, and he desires to stay with the group for years to come.",
  "Stuvi has a passion for psychology and loves to dance. She utilizes her ability to collaborate with people to tutor, a program to which she has dedicated over 40 hours. She looks forward to applying her experience in the Spanish language to enrich the lives of others, seeking to answer questions and foster a strong sense of understanding as much as possible. Stuvi also enjoys traveling and has been all over the world, learning about different cultures, languages, and cuisines. She leverages this hobby to connect with the students from Perú and is encouraged to continue with the experience.",
  "Farida has dedicated over 40 hours to Project Perú and she aims to expand her knowledge through the program. She loves to dance and travel, and her exposure to many different cultures inspires her to teach the students in Perú. Farida strives to apply her three years of Spanish education toward helping and guiding other kids. In her free time, Farida turns to dance and to experimenting with trying different foods and drinks from around the world.",
  "Rohin is the Website Manager for Peru Education Movement, and has worked with several students before teaching languages such as Java, Python, and much more! Rohin is strong in computer science and can teach several sciences as well such as Physics, Chemistry, and much more! He is also the captain of the Monta Vista varsity tennis team and plays competitively outside of school.",
];

List<String> tutorImages = [
  "kyle.jpg",
  "atul.png",
  "vihaan.png",
  "amogh.png",
  "shuvam.png",
  "shreyas.png",
  "anoushka.JPG",
  "samyak.jpg",
  "thomas.png",
  "stuvi.png",
  "farida.png",
  "rohin.png",
];
