import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/jobadd_model.dart';
import '../Utils/constants.dart';
import '../Utils/custom_backbotton.dart';
import '../option_page.dart';
import 'job_question.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final jobAddProvider =
    StateNotifierProvider<JobNotifier, JobAdd>((ref) => JobNotifier());

class JobSubmission extends ConsumerStatefulWidget {
  const JobSubmission({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobSubmissionState();
}

class _JobSubmissionState extends ConsumerState<JobSubmission> {
  final _formkey = GlobalKey<FormState>();
  String token = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? storedtoken = prefs.getString('token');
      token = storedtoken!;
    });
  }

  _validateField(String? text) {
    if (text == null || text.isEmpty) {
      return 'Please enter required data';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final jobNotifier = ref.read(jobAddProvider.notifier);
    postjobdata(WidgetRef ref) async {
      try {
        final job = ref.watch(jobAddProvider);
        final newjob = JobAdd(
            jobTitle: job.jobTitle,
            companyName: job.companyName,
            requiredQualification: job.requiredQualification,
            experience: job.experience,
            salary: job.salary,
            jobLocation: job.jobLocation,
            jobType: job.jobType,
            contactEmail: job.contactEmail,
            jobDescription: job.jobDescription);
        final response = await http.post(Uri.parse('$myurl:3000/jobs/jobs'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: newjob.toJson());
        if (response.statusCode == 201) {
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data uploaded successfully')),
          );
        } else if (response.statusCode == 401) {
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error credentials. Login Again')),
          );
        } else {
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error occured.')),
          );
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
              if (_formkey.currentState!.validate()) {
                postjobdata(ref);
              }
            },
            child: const Text('Submit Form', textScaleFactor: 2)),
      ),
      body: Padding(
        padding: myPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                  'Select job position',
                  style: mytitlemedium(context),
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
                        value: ref.watch(jobAddProvider).jobTitle,
                        items: positionlist,
                        onChanged: (value) {
                          jobNotifier.setJobTitle(value);
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter company name ? ',
                  style: mytitlemedium(context),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 10,
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      validator: (value) => _validateField(value),
                      onChanged: (value) =>
                          jobNotifier.setRequiredQualification(value),
                      cursorHeight: 30,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Company Name'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Required qualifications? ',
                  style: mytitlemedium(context),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).requiredQualification ==
                                '+2',
                        onpressed: () =>
                            jobNotifier.setRequiredQualification('+2'),
                        text: '+2'),
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).requiredQualification ==
                                'Bachelor',
                        onpressed: () =>
                            jobNotifier.setRequiredQualification('Bachelor'),
                        text: 'Bachelor'),
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).requiredQualification ==
                                'Masters',
                        onpressed: () =>
                            jobNotifier.setRequiredQualification('Masters'),
                        text: 'Masters'),
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).requiredQualification ==
                                'PHD',
                        onpressed: () =>
                            jobNotifier.setRequiredQualification('PHD'),
                        text: 'PHD'),
                  ],
                ),
                const SizedBox(height: 10),
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
                                value: ref.watch(jobAddProvider).experience,
                                items: experiencelist,
                                onChanged: (value) {
                                  jobNotifier.setExperience(value);
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
                                value: ref.watch(jobAddProvider).salary,
                                items: salarylist,
                                onChanged: (value) {
                                  jobNotifier.setSalary(value);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter Job Location',
                  style: mytitlemedium(context),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 10,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 40,
                        ),
                        itemHeight: 60,
                        value: ref.watch(jobAddProvider).jobLocation,
                        items: citylist,
                        onChanged: (value) {
                          jobNotifier.setJobLocation(value);
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Job type? ',
                  style: mytitlemedium(context),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).jobType == 'Remote',
                        onpressed: () => jobNotifier.setJobType('Remote'),
                        text: 'Remote'),
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).jobType == 'On-site',
                        onpressed: () => jobNotifier.setJobType('On-site'),
                        text: 'On-site'),
                    CustomSelectionButton(
                        isSelected:
                            ref.watch(jobAddProvider).jobType == 'Hybrid',
                        onpressed: () => jobNotifier.setJobType('Hybrid'),
                        text: 'Hybrid'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your contact-email ',
                  style: mytitlemedium(context),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 10,
                  child: SizedBox(
                    height: 60,
                    child: TextFormField(
                      validator: (value) => _validateField(value),
                      onChanged: (value) => jobNotifier.setContactEmail(value),
                      cursorHeight: 30,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Contact-Email'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter job description  ',
                  style: mytitlemedium(context),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 10,
                  child: SizedBox(
                    height: 200,
                    child: TextFormField(
                      validator: (value) => _validateField(value),
                      onChanged: (value) =>
                          jobNotifier.setJobDescription(value),
                      cursorHeight: 30,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Job Description'),
                    ),
                  ),
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
      ),
    );
  }
}
