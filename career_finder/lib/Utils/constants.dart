import 'package:flutter/material.dart';

const myPrimaryColor = Color(0xff0E387A);
const mybackgroundcolor = Color(0xffF7F1E3);
const myLightTextColor = Color(0xFF1D1D35);
const myDarkTextColor = Color(0xFFF5FCF9);
const myTimerColor = Color(0xff66A36C);
const myPadding = EdgeInsets.symmetric(horizontal: 24);
const optioncollege = 'assets/images/optioncollege.png';
const optioncourse = 'assets/images/optioncourse.png';
const optionjob = 'assets/images/optionjob.png';
const optionuniversity = 'assets/images/optionuniversity.png';
const applogo = 'assets/logos/career_finder_logo.png';
// bottom nav
const collegenav = 'assets/images/college_bottom_navigation.png';
const coursenav = 'assets/images/course_bottom_navigation.png';
const jobnav = 'assets/images/job_bottom_navigation.png';
const universitynav = 'assets/images/university_bottom_navigation.png';
const profilenav = 'assets/images/profile_bottom_navigation.png';
//
const nothingfound = 'assets/images/nothing_found.png';

double mywidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double myheight(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

TextStyle? myLargeTitle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );
}

const List<String> interest = [
  'Travel',
  'Fitness and health',
  'Music',
  'Food and cooking',
  'Technology',
  'Sports',
  'Shopping',
  'Reading',
  'Photography',
  'Movies and TV shows',
  'Outdoor activities',
  'Cars and vechiles',
  'Fashion and beauty',
  'Gaming',
  'Social media and internet'
];
const List<String> course = [
  'Artificial Intelligence',
  'Computer Science',
  'Biology and Biochemistry',
  'Businesss Administration',
];
