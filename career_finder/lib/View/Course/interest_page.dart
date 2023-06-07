import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

final interestProvider = StateProvider<List<String>>((ref) {
  return [];
});

class InterestPage extends ConsumerStatefulWidget {
  const InterestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InterestPageState();
}

class _InterestPageState extends ConsumerState<InterestPage> {
  bool nextpage = false;
  void updateinterest(WidgetRef ref, int value) {
    String index = value.toString();
    List<String> selectedInterests = ref.read(interestProvider.notifier).state;
    if (selectedInterests.length < 3 && !selectedInterests.contains(index)) {
      ref.read(interestProvider.notifier).state.add(index);
    } else if (selectedInterests.length == 3 &&
        !selectedInterests.contains(index)) {
      ref.read(interestProvider.notifier).state.removeAt(0);
      ref.read(interestProvider.notifier).state.add(index);
    } else {
      ref.read(interestProvider.notifier).state.remove(index);
    }
    if (ref.read(interestProvider.notifier).state.length == 3) {
      setState(() {
        nextpage = true;
      });
    } else {
      setState(() {
        nextpage = false;
      });
    }
  }

  bool checkSelected(WidgetRef ref, int index) {
    if (ref.watch(interestProvider).contains('$index')) {
      return true;
    } else {
      return false;
    }
  }

  _selectedIndex(WidgetRef ref, dynamic newIndex) {
    int newIndex1 = newIndex.toInt();

    ref.read(indexValueProvider.notifier).update((state) => newIndex1);
  }

  @override
  Widget build(BuildContext context) {
    List<String> interest = ref.watch(interestStateProvider);
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                StatefulBuilder(
                  builder: (context, setState) {
                    var selectedInterest =
                        ref.read(interestProvider.notifier).state.length;
                    setState(() {});

                    return TextButton(
                      onPressed: () async {
                        if (selectedInterest == 3) {
                          _selectedIndex(ref, 1);
                          SharedPreferences courseSession =
                              await SharedPreferences.getInstance();
                          print("The interest saved to sesssion is");
                          List<String> selectedValues =
                              ref.read(interestProvider.notifier).state;
                          print(selectedValues);
                          await courseSession.setStringList(
                              'interest', selectedValues);
                          Navigator.pushNamed(context, MyRoutes.homePage);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            nextpage ? 'Next' : 'Skip',
                            textScaleFactor: 1.5,
                          ),
                          Icon(CupertinoIcons.forward),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Text('What interests you the most ?', style: myLargeTitle(context)),
            Text(
              nextpage ? '\nThat\'s good \n' : '\nPlease select 3 interests\n',
              style: TextStyle(
                  fontSize: 16, color: nextpage ? Colors.green : Colors.red),
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: interest.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        updateinterest(ref, index);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: checkSelected(ref, index)
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          interest[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: checkSelected(ref, index)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
