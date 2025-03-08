import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:mesk/features/hadith/presentation/screens/widgets/hadith_book_widget.dart';

class HadithBooks extends StatelessWidget {
  const HadithBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadithCubitCubit(),
      child: BlocBuilder<HadithCubitCubit, HadithCubitState>(
        builder: (context, state) {
          final hadithFiles = context.read<HadithCubitCubit>().hadithFilesName;
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(),
            body: SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: HadithBookWidget(
                      fileName: hadithFiles.values.toList(),
                      index: index,
                    )),
                itemCount: hadithFiles.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
