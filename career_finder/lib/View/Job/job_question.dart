import 'package:career_finder/View/Job/job_submission.dart';
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
            position: job.position,
            qualification: job.qualification,
            city: job.city,
            experience: job.experience);
        final response = await http.post(Uri.parse('$myurl:3000/jobs/jobs'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jobdata.toJson());
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
              // postjob(ref);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JobSubmisssion()));
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
                'What position do you want to apply in ? ',
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
                        labelText: 'Position Name'),
                  ),
                ),
              ),
              Text(
                'What is your academic qualifications? ',
                style: mytitlemedium(context),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).qualification == '+2',
                      onpressed: () => jobPreferences.setQualification('+2'),
                      text: '+2'),
                  CustomSelectionButton(
                      isSelected:
                          ref.watch(jobProvider).qualification == 'Bachelor',
                      onpressed: () =>
                          jobPreferences.setQualification('Bachelor'),
                      text: 'Bachelor'),
                  CustomSelectionButton(
                      isSelected:
                          ref.watch(jobProvider).qualification == 'Masters',
                      onpressed: () =>
                          jobPreferences.setQualification('Masters'),
                      text: 'Masters'),
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).qualification == 'PHD',
                      onpressed: () => jobPreferences.setQualification('PHD'),
                      text: 'PHD'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Do you want your job to be in your city? ',
                style: mytitlemedium(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).city == 'Yes',
                      onpressed: () => jobPreferences.setcity('Yes'),
                      text: 'Yes'),
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).city == 'No',
                      onpressed: () => jobPreferences.setcity('No'),
                      text: 'No'),
                  CustomSelectionButton(
                      isSelected:
                          ref.watch(jobProvider).city == 'Not important',
                      onpressed: () => jobPreferences.setcity('Not important'),
                      text: 'Not important'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'How many years of experience do you have in this field ?',
                style: mytitlemedium(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                for (var i = 1; i <= 5; i++)
                  CustomSelectionButton(
                      isSelected: ref.watch(jobProvider).experience == i,
                      onpressed: () => jobPreferences.setExperience(i),
                      text: i.toString())
              ]),
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
