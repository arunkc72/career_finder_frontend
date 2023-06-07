import 'package:career_finder/View/Utils/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Utils/appbar.dart';
import 'University-College/college_recommendation.dart';
import 'Course/course_recommendation.dart';
import 'Job/job_recommendation.dart';
import 'Profile/profile_page.dart';
import 'University-College/university_recommendation.dart';

final indexValueProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  _selectedIndex(WidgetRef ref, dynamic newIndex) {
    int newIndex1 = newIndex.toInt();

    ref.read(indexValueProvider.notifier).update((state) => newIndex1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexValueProvider);
    final screen = [
      const UniversityRecommendation(),
      const CourseRecommendation(),
      const JobRecommendation(),
      const CollegeRecommendation(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MySliverAppBar(),
          SliverToBoxAdapter(
            child: screen[index],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
