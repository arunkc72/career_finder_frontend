import 'package:career_finder/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/job_model.dart';
import '../Utils/constants.dart';
import '../Utils/custom_backbotton.dart';
import '../option_page.dart';
import 'package:http/http.dart' as http;

final jobProvider = StateNotifierProvider<JobPreferences, Job>((ref) {
  return JobPreferences();
});

class JobQuestion extends ConsumerWidget {
  const JobQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobPreferences = ref.read(jobProvider.notifier);
    postjob(WidgetRef ref) async {
      try {
        final job = ref.watch(jobProvider);
        final jobdata = Job(
            jobTitle: job.jobTitle,
            requiredQualification: job.requiredQualification,
            jobLocation: job.jobLocation,
            experience: job.experience,
            salary: job.salary,
            jobType: job.jobType);
        final response =
            await http.post(Uri.parse('$myurl:5000/recommendJobs'),
                headers: {
                  'Content-Type': 'application/json',
                },
                body: jobdata.toJson());
        print(jobdata.toJson());
        if (response.statusCode == 201) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        } else {
          throw Exception('Failed to get data');
        }
      } catch (e) {
        print('Error occured: $e');
      }
    }

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
              postjob(ref);
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
                'What jobTitle do you want to apply in ? ',
                style: mytitlemedium(context),
              ),
              SizedBox(height: 10),
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
                      value: ref.watch(jobProvider).jobTitle,
                      items: positionlist,
                      onChanged: (value) {
                        jobPreferences.setjobTitle(value);
                      }),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'What is your academic requiredQualifications? ',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).requiredQualification == '+2',
                      onpressed: () => jobPreferences.setrequiredQualification('+2'),
                      text: '+2'),
                  CustomSelectionButton(
                      isSelected:
                          ref.watch(jobProvider).requiredQualification == 'Bachelor',
                      onpressed: () =>
                          jobPreferences.setrequiredQualification('Bachelor'),
                      text: 'Bachelor'),
                  CustomSelectionButton(
                      isSelected:
                          ref.watch(jobProvider).requiredQualification == 'Masters',
                      onpressed: () =>
                          jobPreferences.setrequiredQualification('Masters'),
                      text: 'Masters'),
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).requiredQualification == 'PHD',
                      onpressed: () => jobPreferences.setrequiredQualification('PHD'),
                      text: 'PHD'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Select Job Location',
                style: mytitlemedium(context),
              ),
              const SizedBox(
                height: 10,
              ),
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
                      value: ref.watch(jobProvider).jobLocation,
                      items: citylist,
                      onChanged: (value) {
                        jobPreferences.setjobLocation(value);
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Experience',
                        style: mytitlemedium(context),
                      ),
                      const SizedBox(height: 5),
                      Card(
                        elevation: 10,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 40,
                              ),
                              itemHeight: 60,
                              value: ref.watch(jobProvider).experience,
                              items: experiencelist,
                              onChanged: (value) {
                                jobPreferences.setExperience(value);
                              }),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Salary',
                        style: mytitlemedium(context),
                      ),
                      const SizedBox(height: 5),
                      Card(
                        elevation: 10,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 40,
                              ),
                              itemHeight: 60,
                              value: ref.watch(jobProvider).salary,
                              items: salarylist,
                              onChanged: (value) {
                                jobPreferences.setSalary(value);
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Job type? ',
                style: mytitlemedium(context),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).jobType == 'Remote',
                      onpressed: () => jobPreferences.setJobType('Remote'),
                      text: 'Remote'),
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).jobType == 'On-site',
                      onpressed: () => jobPreferences.setJobType('On-site'),
                      text: 'On-site'),
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).jobType == 'Hybrid',
                      onpressed: () => jobPreferences.setJobType('Hybrid'),
                      text: 'Hybrid'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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

class CustomSelectionButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onpressed;
  final String text;

  const CustomSelectionButton(
      {required this.isSelected,
      required this.text,
      required this.onpressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        minimumSize: const Size(50, 50),
        backgroundColor: isSelected ? myPrimaryColor : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: onpressed,
      child: Text(text),
    );
  }
}
