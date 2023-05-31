// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:career_finder/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utils/constants.dart';
import '../Utils/custom_backbotton.dart';
import '../../Model/criteria_selector.dart';
import '../option_page.dart';

final selectorNotifierProvider =
    StateNotifierProvider<SelectorNotifier, Selector>((ref) {
  return SelectorNotifier();
});

final gradeStateProvider = StateProvider<double>((ref) {
  return 0.0;
});

final countryStateProvider = StateProvider<String>((ref) {
  return 'Australia';
});
final cityOptionProvider = StateProvider<int>((ref) {
  return 1;
});
final cityStateProvider = StateProvider<String>((ref) {
  return 'Sydney';
});
final courseStateProvider = StateProvider<String>((ref) {
  return 'Computer Science';
});
final addressStateProvider = StateProvider<String>((ref) {
  return 'Lamachaur, Pokhara';
});

class CampusQuestion extends ConsumerStatefulWidget {
  final bool college;
  const CampusQuestion({super.key, required this.college});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampusQuestionState();
}

class _CampusQuestionState extends ConsumerState<CampusQuestion> {
  bool invalidGrade = false;
  selectedgrade(WidgetRef ref, String grade) {
    double newgrade = double.parse(grade);
    ref.read(gradeStateProvider.notifier).update((state) => newgrade);
  }

  _validategrade(String grade) {
    double? number = double.tryParse(grade);
    if (number == null || number < 1.0 || number > 4.0) {
      setState(() {
        invalidGrade = true;
      });
    } else {
      setState(() {
        invalidGrade = false;
      });
    }
  }

  _selectedcountry(WidgetRef ref, dynamic country) {
    String newcountry = country.toString();

    ref.read(countryStateProvider.notifier).update((state) => newcountry);
  }

  _selectedCity(WidgetRef ref, dynamic country) {
    String newcountry = country.toString();

    ref.read(cityStateProvider.notifier).update((state) => newcountry);
  }
  _selectedAddress(WidgetRef ref, dynamic country) {
    String newcountry = country.toString();

    ref.read(addressStateProvider.notifier).update((state) => newcountry);
  }

  _selectedCourse(WidgetRef ref, dynamic course) {
    String newCourse = course.toString();

    ref.read(courseStateProvider.notifier).update((state) => newCourse);
  }

  @override
  Widget build(BuildContext context) {
    final List country = [
      'Australia',
      'Canada',
      'Usa',
      'Japan',
      'UK',
      'Denmark',
    ];
    final List<String> course = [
      'Computer Science',
      'Agricultural Sciences',
      'Artificial Intelligence',
      'Arts and Humanities',
      'Biology and Biochemistry',
      'Biotechnology and Applied Microbiology',
      'Cardiac and Cardiovascular Systems',
      'Cell Biology',
      'Chemical Engineering',
      'Chemistry',
      'Civil Engineering',
      'Clinical Medicine',
      'Condensed Matter Physics',
      'Economics and Business',
      'Education and Educational Research',
      'Electrical and Electronic Engineering',
      'Endocrinology and Metabolism',
      'Energy and Fuels',
      'Engineering',
      'EnvironmentEcology',
      'Food Science and Technology',
      'Gastroenterology and Hepatology',
      'Geosciences',
      'Immunology',
      'Infectious Diseases',
      'Materials Science',
      'Mathematics',
      'Mechanical Engineering',
      'Meteorology and Atmospheric Sciences',
      'Microbiology',
      'Molecular Biology and Genetics',
      'Nanoscience and Nanotechnology',
      'Neuroscience and Behavior',
      'Oncology',
      'Optics',
      'Pharmacology and Toxicology',
      'Physical Chemistry',
      'Physics',
      'Plant and Animal Science',
      'Polymer Science',
      'Psychiatry Psychology',
      'Public Environmental and Occupational Health',
      'Radiology Nuclear Medicine and Medical Imaging',
      'Social Sciences and Public Health',
      'Space Science',
      'Surgery',
      'Water Resources'
    ];
    String selectedCountry = ref.watch(countryStateProvider);
    String selectedCourse = ref.watch(courseStateProvider);

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
              optionuniversity,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  CustomSkipButton(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Enter our GPA in ${widget.college ? 'school' : '+2'}?',
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
                      LengthLimitingTextInputFormatter(3),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onFieldSubmitted: (newValue) async {
                      await _validategrade(newValue.toString());
                      if (!invalidGrade) {
                        selectedgrade(ref, newValue.toString());
                      }
                    },
                  ),
                ),
              ),
              if (invalidGrade)
                const Text(
                  'Please enter valid grade',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              const SizedBox(height: 10),
              Text(
                widget.college
                    ? 'Enter your address'
                    : 'Which country university are you looking for?',
                style: mytitlemedium(context),
              ),
              widget.college
                  ? Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                            cursorHeight: 30,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                labelText: 'Enter address'),
                            onFieldSubmitted: (newValue) {
                              _selectedAddress(ref, newValue);
                            }),
                      ),
                    )
                  : Card(
                      elevation: 10,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                            itemHeight: 60,
                            value: selectedCountry,
                            items: countrylist,
                            onChanged: (value) {
                              _selectedcountry(ref, value);
                            }),
                      ),
                    ),
              const SizedBox(height: 10),
              if (widget.college == false)
                Text(
                  'Enter your subject name',
                  style: mytitlemedium(context),
                ),
              if (widget.college == false) const SizedBox(height: 10),
              if (widget.college == false)
                Card(
                  elevation: 10,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                        ),
                        value: selectedCourse,
                        itemHeight: 60,
                        items: List.generate(
                            course.length,
                            (index) => DropdownMenuItem(
                                value: course[index],
                                child: Text(course[index]))),
                        onChanged: (value) {
                          _selectedCourse(ref, value);
                        }),
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                'Enter City',
                style: mytitlemedium(context),
              ),
              Card(
                elevation: 10,
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                      cursorHeight: 30,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText:
                              'Enter city to search ${widget.college ? 'college' : 'university'}'),
                      onFieldSubmitted: (newValue) {
                        _selectedCity(ref, newValue);
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Rank how high do you want your  ${widget.college ? 'College rank ' : 'university global score to be'} ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              const CustomSelector(criteria: 'rank'),
              const SizedBox(height: 10),
              Text(
                'Rank how expensive do you want your  ${widget.college ? 'college' : 'university'} to be ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              const CustomSelector(
                criteria: 'expensive',
              ),
              const SizedBox(height: 10),
              Text(
                'Rank how high much enrollment do you want your ${widget.college ? 'college' : 'university'} to have ?',
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
