import 'package:career_finder/pages/StartPages/study_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReadyPage extends StatefulWidget {
  const ReadyPage({Key? key}) : super(key: key);

  @override
  State<ReadyPage> createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {
  @override
  void initState() {
    super.initState();
    _navigatetoquestion();
  }

  void _navigatetoquestion() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StudyPage(),
          ));
    });
  }

  final readysvg = 'assets/images/readypage.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Welcome!',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              '\n Here are some questions to recommend the college/jobs that fits your interest',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.black54))
                    ])),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).canvasColor,
                    radius: 60,
                    child: SvgPicture.asset(readysvg),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              // SizedBox(
              //   width: 200,
              //   height: 50,
              //   child: ElevatedButton(
              //       onPressed: () {},
              //       style: ButtonStyle(
              //         shape: MaterialStateProperty.all(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(40),
              //           ),
              //         ),
              //       ),
              //       child: Text('Next', textScaleFactor: 2)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
