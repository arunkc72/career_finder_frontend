import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        onTap: () {
          Navigator.pushNamed(context, MyRoutes.loginPage);
        },
        splashColor: myPrimaryColor.withOpacity(0.2),
        tileColor: Colors.white,
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
              myListTile('assets/images/optionuser.png', 'MyAccount',
                  'Make changes to account'),
              myListTile('assets/images/optioncourse.png', 'View interest',
                  'View your course interest'),
              myListTile(
                  'assets/images/optionuniversity.png',
                  'View university preference',
                  'View you university preferences'),
              myListTile('assets/images/optioncollege.png',
                  'View college preference', 'View your college preferences'),
              myListTile('assets/images/optionjob.png', 'View job preference',
                  'View your job preferences'),
              myListTile('assets/images/optionjob.png', 'Add New Job', null),
            ],
          ),
          const SizedBox(height: 10),
          Text('More',
              style: mytitlemedium(context)!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Column(
            children: [
              myListTile('assets/images/optioninfo.png', 'About App', null),
              myListTile('assets/images/logout.png', 'Log out', null),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
