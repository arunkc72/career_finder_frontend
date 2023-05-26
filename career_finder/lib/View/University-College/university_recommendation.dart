
import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              print(data.toString());
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
                            university: data[index].University_Name.toString(),
                            country: data[index].Country.toString(),
                            city: data[index].City.toString(),
                            enrollment: data[index].Enrollment.toString(),
                            globalScore: data[index].Global_Score.toString(),
                            worldRank: data[index].Rank_In_World.toString(),
                            description: data[index].Description.toString());
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
                            Expanded(
                                child: SvgPicture.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg')),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].University_Name.toString(),
                                  style: mytitlemedium(context),
                                ),
                                Text(
                                    '${data[index].City.toString()},${data[index].Country.toString()}'),
                                Text(data[index].Rank_In_World.toString()),
                                Text(data[index].Rank_In_World.toString()),
                                Text(data[index].Enrollment.toString()),
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
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
