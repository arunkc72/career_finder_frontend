import 'package:career_finder/View/Utils/constants.dart';
import 'package:career_finder/View/Course/individual_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Contoller/university_repository.dart';
import '../../Model/university_model.dart';

final universityFutureProvider = FutureProvider<List<University>>((ref) {
  var university = ref.watch(universityServiceProvider);
  return university.postUniversity();
});

class UniversityRecommendation extends ConsumerWidget {
  const UniversityRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: myPadding,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 30,
            child: Text('Recommended Universities',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(universityFutureProvider).when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IndividualCourse(
                            image: '',
                            university: data[index].university_name.toString(),
                            description:
                                data[index].university_name.toString());
                      }));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Placeholder(
                              color: myPrimaryColor,
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].university_name.toString(),
                                  style: mytitlemedium(context),
                                ),
                                Text(data[index].country.toString()),
                                Text(data[index].rank_in_world.toString()),
                                Text(data[index].rank_in_world.toString()),
                                Text(data[index].enrollment.toString()),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Text('$error');
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
