import 'package:career_finder/Model/college_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Contoller/college_repository.dart';
import '../Utils/constants.dart';
import 'individual_page.dart';

final collegeFutureProvider = FutureProvider<List<College>>((ref) async {
  var college = ref.watch(collegeServiceProvider);
  return college.postcollege();
});

class CollegeRecommendation extends ConsumerWidget {
  const CollegeRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            height: 35,
            child: Text('Recommended Colleges',
                textAlign: TextAlign.start, style: myLargeTitle(context)),
          ),
          ref.watch(collegeFutureProvider).when(
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
                        return IndividualPage(
                            image: '',
                            university: data[index].college_name.toString(),
                            country: data[index].college_address.toString(),
                            city: data[index].college_city_name.toString(),
                            description:
                                data[index].college_city_name.toString());
                      }));
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
                                          'assets/college.jpg',
                                        ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      data[index].college_name.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      '${data[index].college_city_name.toString()},${data[index].college_address.toString()}',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      "Available Subjects:",
                                      style: TextStyle(color: Colors.brown),
                                    ),

                                    Text(
                                      maxLines: 1,
                                      data[index].subject1.toString(),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      data[index].subject2.toString(),
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    // Text(maxLines: 1,data[index].subject3.toString()),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
