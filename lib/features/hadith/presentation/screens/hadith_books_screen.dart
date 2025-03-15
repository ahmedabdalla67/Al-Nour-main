import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:mesk/features/hadith/presentation/screens/widgets/hadith_book_widget.dart';

class HadithBooks extends StatelessWidget {
  const HadithBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadithCubitCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(),
        body: BlocBuilder<HadithCubitCubit, HadithCubitState>(
          builder: (context, state) {
            final hadithFiles =
                context.read<HadithCubitCubit>().hadithFilesName;
            final downloadStatus = state is HadithCubitSuccess
                ? state.downloadStatus
                : <String, bool>{};

            final contentFile =
                state is HadithCubitSuccess ? state.hadiths : <HadithEntity>[];

            return ListView.builder(
              itemCount: hadithFiles.length,
              itemBuilder: (context, index) {
                final fileName = hadithFiles.keys.toList()[index];
                final isDownloaded = downloadStatus[fileName] ?? false;
                // print('downloadStatus $downloadStatus');
                // print('isDownloaded ${downloadStatus[fileName]}');

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: state is HadithCubitLoading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.black.withOpacity(0.7),
                          color: ManageColors.primary.withOpacity(0.3),
                        )
                      : HadithBookWidget(
                          fileName: hadithFiles.values.toList(),
                          index: index,
                          isDownloaded: isDownloaded,
                          onDownloadPressed: () {
                            context
                                .read<HadithCubitCubit>()
                                .toggleHadithDownload(fileName, contentFile);
                          },
                          onCardPressed: () {
                            context
                                .read<HadithCubitCubit>()
                                .navigateToHadithContent(fileName, context);
                          },
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
