import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final interestProvider = StateProvider<List<String>>((ref) {
  return [];
});

class InterestPage extends ConsumerStatefulWidget {
  const InterestPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InterestPageState();
}

class _InterestPageState extends ConsumerState<InterestPage> {
  void updateinterest(WidgetRef ref, int value) async {
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
  }

  bool checkSelected(WidgetRef ref, int index) {
    if (ref.watch(interestProvider).contains('$index')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> interest = ref.watch(interestStateProvider);
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                TextButton(
                  onPressed: () {
                    if (ref.watch(interestProvider).length == 3) {
                      Navigator.pushNamed(context, MyRoutes.homePage);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ref.watch(interestProvider).length == 3
                            ? 'Next'
                            : 'Skip',
                        textScaleFactor: 1.5,
                      ),
                      Icon(CupertinoIcons.forward),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Text('What interests you the most ?', style: myLargeTitle(context)),
            Text(
              'Please select 3 interests',
              style: TextStyle(fontSize: 16),
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
                        print(ref.watch(interestProvider));
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
