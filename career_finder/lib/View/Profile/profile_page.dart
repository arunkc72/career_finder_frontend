import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile myListTile(String logo, String title, String? subtitle) {
      return ListTile(
        horizontalTitleGap: 0,
        leading: Image.asset(logo, height: 30, width: 30),
        title: Text(title),
        subtitle: (subtitle == null)
            ? null
            : Text(subtitle.toString(),
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
        trailing: const Icon(CupertinoIcons.forward),
        tileColor: logo.toString() == "images/delete.png"
            ? Colors.white
            : Colors.white,
        visualDensity: const VisualDensity(vertical: -3),
      );
    }

    return Padding(
      padding: myPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: myPrimaryColor.withOpacity(0.9),
            child: Container(
              alignment: Alignment.center,
              height: 90,
              child: ListTile(
                leading: FittedBox(
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/optionuniversity.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text('Abiral Pokhrel',
                    style:
                        myLargeTitle(context)!.copyWith(color: Colors.white)),
                subtitle: const Text(
                  '@abiral 1234',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: myListTile('assets/images/optionuser.png', 'MyAccount',
                    'Make changes to account'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.interestPage);
                },
                child: myListTile(
                  'assets/images/optioncourse.png',
                  'Add course interest',
                  'Add your course interest',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.universityQuestionPage);
                },
                child: myListTile(
                  'assets/images/optionuniversity.png',
                  'Add university preference',
                  'Add your university preferences',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.collegeQuestionPage);
                },
                child: myListTile(
                  'assets/images/optioncollege.png',
                  'Add college preference',
                  'Add your college preferences',
                ),
              ),
              myListTile('assets/images/optionjob.png', 'View job preference',
                  'View your job preferences'),
            ],
          ),
          const SizedBox(height: 10),
          Text('More',
              style: mytitlemedium(context)!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Column(
            children: [
              GestureDetector(
                  onTap: () async {
                    print("Hello");
                    SharedPreferences courseSession =
                        await SharedPreferences.getInstance();
                    List<String>? interest =
                        courseSession.getStringList('interest');
                    print(interest);
                    courseSession.setStringList('interest', []);
                    List<String>? interest2 =
                        courseSession.getStringList('interest');
                    print(interest2);
                    //await courseSession.clear();
                  },
                  child: myListTile('assets/images/delete.png',
                      'Delete course preference', null)),
              myListTile('assets/images/delete.png',
                  'Delete univerisity preference', null),
              myListTile('assets/images/delete.png',
                  'Delete college preference', null),
              myListTile('assets/images/optioninfo.png', 'About App', null),
              GestureDetector(
                  onTap: () async {
                    SharedPreferences loggedIn =
                        await SharedPreferences.getInstance();
                    await loggedIn.remove('state');
                    Navigator.pushNamed(context, MyRoutes.loginPage);
                  },
                  child:
                      myListTile('assets/images/logout.png', 'Log out', null)),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
