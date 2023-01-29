// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:career_finder/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utils/constants.dart';
import '../../Utils/custom_backbotton.dart';
import '../../models/criteria_selector.dart';
import '../option_page.dart';

final selectorNotifierProvider =
    StateNotifierProvider<SelectorNotifier, Selector>((ref) {
  return SelectorNotifier(const Selector(
    rank: 1,
    enrollement: 1,
    expensive: 1,
  ));
});

final gradeStateProvider = StateProvider<double>((ref) {
  return 0.0;
});

class CampusQuestion extends ConsumerWidget {
  const CampusQuestion({super.key});

  _selectedgrade(WidgetRef ref, String grade) {
    double newgrade = double.parse(grade);
    ref.read(gradeStateProvider.notifier).update((state) => newgrade);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List country = [
      'Australia',
      'Canada',
      'Usa',
      'Japan',
      'UK',
      'Denmark',
    ];
    List<DropdownMenuItem> countrylist = List.generate(
      6,
      (index) => DropdownMenuItem(
        value: country[index],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text(country[index].toString()),
            const SizedBox(width: 10),
            Image.asset(
              australiaflag,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 16,
          right: 16,
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(mywidth(context), 50),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text('View Result', textScaleFactor: 2)),
      ),
      body: Padding(
        padding: myPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomBackButton(),
                  CustomSkipButton(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Enter our GPA in +2 ?',
                style: mytitlemedium(context),
              ),
              Card(
                elevation: 10,
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    cursorHeight: 30,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Enter a number between 1.0 to 4.0'),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSaved: (newValue) {
                      _selectedgrade(ref, newValue.toString());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Which country university are you looking for?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 10,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 40,
                      ),
                      itemHeight: 60,
                      value: country[0],
                      items: countrylist,
                      onChanged: (value) {}),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Rank how high do you want your university global score to be ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              const CustomSelector(criteria: 'rank'),
              const SizedBox(height: 10),
              Text(
                'Rank how expensive do you want your university to be ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              const CustomSelector(
                criteria: 'expensive',
              ),
              const SizedBox(height: 10),
              Text(
                'Rank how high much enrollment do you want your university to have ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              const CustomSelector(
                criteria: 'enrollment',
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                ),
                child: const Text(
                  'Note: On ranking , 1 means the lowest  global score ,expense and enrollment and 5  means the highest  global score , expense and enrollment',
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSelector extends ConsumerWidget {
  final String criteria;
  const CustomSelector({
    required this.criteria,
    super.key,
  });

  _selectedButton(WidgetRef ref, int index) {
    if (criteria == 'rank') {
      ref.read(selectorNotifierProvider.notifier).updaterank(index);
    } else if (criteria == 'expensive') {
      ref.read(selectorNotifierProvider.notifier).updateexpensive(index);
    } else if (criteria == 'enrollment') {
      ref.read(selectorNotifierProvider.notifier).updateenrollement(index);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedbutton = ref.watch(selectorNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 1; i <= 5; i++)
          SizedBox(
            height: 60,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor:
                        (selectedbutton.rank == i && criteria == 'rank' ||
                                selectedbutton.expensive == i &&
                                    criteria == 'expensive' ||
                                selectedbutton.enrollement == i &&
                                    criteria == 'enrollment')
                            ? myPrimaryColor
                            : Colors.white,
                    foregroundColor:
                        (selectedbutton.rank == i && criteria == 'rank' ||
                                selectedbutton.expensive == i &&
                                    criteria == 'expensive' ||
                                selectedbutton.enrollement == i &&
                                    criteria == 'enrollment')
                            ? Colors.white
                            : Colors.black,
                    alignment: Alignment.center),
                onPressed: () {
                  _selectedButton(ref, i);
                },
                child: Text(i.toString())),
          ),
      ],
    );
  }
}
