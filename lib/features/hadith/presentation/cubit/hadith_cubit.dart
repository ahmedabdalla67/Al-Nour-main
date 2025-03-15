import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/check_hadith_status_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/download_file_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/get_hadith_files_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/remove_hadith_use_case.dart';
import 'package:mesk/features/hadith/presentation/screens/hadith_content_Screen.dart';

part 'hadith_state.dart';

class HadithCubitCubit extends Cubit<HadithCubitState> {
  final Map<String, String> hadithFilesName = {
    'abi_daud.json': 'سنن أبي داود',
    'ahmed.json': 'الإمام أحمد',
    'bukhari.json': "صحيح البخاري",
    'darimi.json': "سنن الدارمي",
    'ibn_maja.json': "سنن ابن ماجه",
    'malik.json': "الإمام مالك",
    'muslim.json': "صحيح مسلم",
    'nasai.json': "سنن النسائي الكبري",
    'trmizi.json': "جامع الترمذي"
  };

  final Map<String, bool> downloadStatus = {};

  HadithCubitCubit() : super(HadithCubitInitial()) {
    // Initialize downloadStatus when the cubit is created
    _initializeDownloadStatus();
  }

  Future<void> _initializeDownloadStatus() async {
    for (var file in hadithFilesName.keys) {
      final statusResult = await getIT<CheckHadithStatus>().call(file);
      statusResult.fold(
        (failure) => downloadStatus[file] = false,
        (isDownloaded) => downloadStatus[file] = isDownloaded,
      );
    }
  }

  Future<void> loadHadiths(String fileName) async {
    emit(HadithCubitLoading());
    // final result = await getHadiths(fileName);
    final result = await getIT<GetHadithFilesUseCase>().call(fileName);
    result
        .fold((failure) => HadithCubitFailure(errMessage: failure.errorMessage),
            (hadiths) async {
      for (var file in hadithFilesName.keys) {
        // final statusResult = await checkHadithStatus(file);
        final statusResult = await getIT<CheckHadithStatus>().call(file);
        statusResult.fold((failure) => downloadStatus[file] = false,
            (isDownloaded) {
          downloadStatus[file] = isDownloaded;
          print('dowloadeddfile---> $isDownloaded');
        });
      }
      emit(
          HadithCubitSuccess(hadiths: hadiths, downloadStatus: downloadStatus));
    });
  }

  Future<void> toggleHadithDownload(
      String fileName, List<HadithEntity> content) async {
    // Get the current download status
    final isDownloaded = downloadStatus[fileName] ?? false;

    emit(HadithCubitLoading());
    // Perform the download or remove operation
    final result = isDownloaded
        ? await getIT<RemoveHadith>()
            .call(fileName) // Remove if already downloaded
        : await getIT<DownloadFileUseCase>()
            .call(fileName, content); // Download and cache

    result.fold(
      (failure) => emit(HadithCubitFailure(errMessage: failure.errorMessage)),
      (_) {
        // Update the downloadStatus map
        downloadStatus[fileName] = !isDownloaded;

        // Emit the new state with the updated downloadStatus
        emit(HadithCubitSuccess(
          hadiths: content, // Pass the actual hadiths if needed
          downloadStatus: downloadStatus,
        ));
      },
    );
  }

  Future<void> navigateToHadithContent(
      String fileName, BuildContext context) async {
    final result = await getIT<HadithRepo>().getHadiths(fileName);

    result.fold((failure) {
      // Show an error message if the content is not found
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.errorMessage)),
      );
    }, (content) {
      // Navigate to the content screen with the cached content
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HadithContentScreen(content: content),
        ),
      );
    });
  }
}
