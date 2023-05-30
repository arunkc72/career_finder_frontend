import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Utils/custom_backbotton.dart';
import 'package:career_finder/View/option_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final interestProvider = StateProvider<List<int>>((ref) {
  return [];
});

class InterestPage extends ConsumerWidget {
  const InterestPage({Key? key}) : super(key: key);

  void updateinterest(WidgetRef ref, int index) async {
    List<int> selectedInterests = ref.read(interestProvider.notifier).state;
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> interest = ref.watch(interestStateProvider);
    return Scaffold(
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            const Spacer(flex: 3),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                CustomSkipButton(),
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
                    List<int> selectedInterests = ref.watch(interestProvider);
                    return GestureDetector(
                      onTap: () {
                        updateinterest(ref, index);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ref.watch(interestProvider).contains(index)
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          interest[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedInterests.contains(index)
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
