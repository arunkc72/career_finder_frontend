import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Contoller/university_repository.dart';
import '../../Model/university_model.dart';
import 'individual_page.dart';

final universityFutureProvider = FutureProvider<List<University>>((ref) async {
  var university = ref.watch(universityServiceProvider);
  return university.postUniversity();
});

class UniversityRecommendation extends ConsumerWidget {
  const UniversityRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 35,
            child: Text('Recommended Universities',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(universityFutureProvider).when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IndividualPage(
                            image: '',
                            university: data[index].University_Name.toString(),
                            country: data[index].Country.toString(),
                            city: data[index].City.toString(),
                            enrollment: data[index].Enrollment.toString(),
                            globalScore: data[index].Global_Score.toString(),
                            worldRank: data[index].Rank_In_World.toString(),
                            description: data[index].Description.toString());
                      }));
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          height: 180,
                                          fit: BoxFit.fitHeight,
                                          'assets/images/university.jpg',
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      maxLines: 2,
                                      data[index].University_Name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        maxLines: 2,
                                        '${data[index].City.toString()},${data[index].Country.toString()}'),
                                    Text(
                                      maxLines: 1,
                                      'World Rank :' +
                                          data[index].Rank_In_World.toString(),
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      'Global Score :' +
                                          data[index].Global_Score.toString(),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      'Enrollment :' +
                                          data[index].Enrollment.toString(),
                                      style: TextStyle(
                                          color: Colors.deepPurpleAccent),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Text('$error');
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
