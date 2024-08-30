import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/shared_component/home_top_bar.dart';
import 'package:mesk/features/home/presentation/cubit/home_cubit.dart';
import 'package:mesk/features/home/presentation/widgets/custom_container.dart';
import 'package:mesk/features/home/presentation/widgets/list_view_cards.dart';
import 'package:mesk/features/home/presentation/widgets/random_aya.dart';
import 'package:mesk/features/home/presentation/widgets/section_title.dart';
import 'package:mesk/features/home/presentation/widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var children = [
      const SizedBox(
        height: 30,
      ),
      // top Bar
      const HomeTopBar(),

      const SizedBox(
        height: 12,
      ),

      //date and container continue reading
      const CustomContainer(),

      SectionTitle(title: 'الاختصارات', onPressed: () {}),
      const SizedBox(height: 165, child: ListViewCards()),

      const SizedBox(
        height: 20,
      ),
      BlocProvider(
        create: (context) => HomeCubit()..getRandomHomeSurah(3),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is HomeGetSuccess
                ? RandomAya(
                    randomSurah: state.surah,
                  )
                : state is HomeGetFailure
                    ? Text(state.errMessage)
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
          },
        ),
      ),
      SectionTitle(title: 'مقاطع دينية', onPressed: () {}),
      SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: const [
            VideoCard(
                videoId: 'fL5CIf1hdDc',
                videoTitle: 'ستعشق الصلاة بعد سماع هذا الكلام'),
            VideoCard(
                videoId: '_UG1ifj8KDg',
                videoTitle: 'لن تتكاسل عن الصلاة بعد سماع هذا الكلام'),
            VideoCard(
                videoId: 'k1LxNz07rgY', videoTitle: '6 خطوات للخشوع في الصلاة'),
            VideoCard(
                videoId: 'z9VlkgVyLhg',
                videoTitle: 'السيرةالنبوية الحلقة الأولي مع الشيخ بدر المشارى'),
            VideoCard(
                videoId: 'Cut8UA4dSS4',
                videoTitle:
                    'السيرةالنبوية الحلقة الثانية مع الشيخ بدر المشارى'),
            VideoCard(
                videoId: '7CbP4SczIpE',
                videoTitle:
                    'السيرةالنبوية الحلقة الثالثة مع الشيخ بدر المشارى'),
          ],
        ),
      )

      //Image.network('https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',height: 200,width: double.infinity,)
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }
}
