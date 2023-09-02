import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const myurl = 'http://192.168.1.68';
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
const coursenav = 'assets/images/book.png';
const jobnav = 'assets/images/job_bottom_navigation.png';
const universitynav = 'assets/images/university_bottom_navigation.png';
const profilenav = 'assets/images/profile_bottom_navigation.png';
//
const nothingfound = 'assets/images/not_found.png';
const australiaflag = 'assets/images/australia.png';
double mywidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double myheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// for the default text of main headline
TextStyle? myLargeTitle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );
}

// for the default question page
TextStyle? mytitlemedium(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium!.copyWith();
}

//
final interestStateProvider = StateProvider<List<String>>((ref) {
  return [
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
});
    List<String> position = [
      'Frontend Developer',
      'Backend Developer',
      'Designer',
      'Tester',
      'Quality Assurance'
    ];
    List<DropdownMenuItem> positionlist = List.generate(
        position.length,
        (index) => DropdownMenuItem(
            value: position[index], child: Text(position[index])));
    List<String> experience = [
      '1 year',
      '2 years',
      '3 years',
      '4 years',
      '5+ years'
    ];
    List<DropdownMenuItem> experiencelist = List.generate(
        experience.length,
        (index) => DropdownMenuItem(
            value: experience[index], child: Text(experience[index])));
    List<String> salary = ['<15K', '15k-25k', '25k-50k', '50k-100k', '100k+'];
    List<DropdownMenuItem> salarylist = List.generate(
        experience.length,
        (index) =>
            DropdownMenuItem(value: salary[index], child: Text(salary[index])));
    List<String> city = ['Kathmandu', 'Pokhara'];
    List<DropdownMenuItem> citylist = List.generate(
        city.length,
        (index) =>
            DropdownMenuItem(value: city[index], child: Text(city[index])));