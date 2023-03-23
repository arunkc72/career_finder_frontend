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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          alignment: Alignment.topLeft,
          height: 30,
          child: Text('Recommended Universities',
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
                          country: data[index].address.toString(),
                          city: data[index].city.toString(),
                          description: data[index].discussion.toString());
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
                                data[index].college_name.toString(),
                                style: mytitlemedium(context),
                              ),
                              Text(
                                  '${data[index].city.toString()},${data[index].address.toString()}'),
                              Text(data[index].college_link.toString()),
                              Text(data[index].contact_details.toString()),
                              Text(data[index].course_list.toString()),
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
    );
  }
}
