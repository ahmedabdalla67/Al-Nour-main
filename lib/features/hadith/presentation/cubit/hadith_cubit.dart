import 'package:bloc/bloc.dart';
import 'package:mesk/core/services/service_locator.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/check_hadith_status_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/download_file_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/get_hadith_files_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/remove_hadith_use_case.dart';
import 'package:meta/meta.dart';

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

  HadithCubitCubit() : super(HadithCubitInitial());

  Future<void> loadHadiths(String fileName) async {
    emit(HadithCubitLoading());
    // final result = await getHadiths(fileName);
    final result = await getIT<GetHadithFilesUseCase>().call(fileName);
    result
        .fold((failure) => HadithCubitFailure(errMessage: failure.errorMessage),
            (hadiths) async {
      final downloadStatus = <String, bool>{};
      for (var file in hadithFilesName.keys) {
        // final statusResult = await checkHadithStatus(file);
        final statusResult = await getIT<CheckHadithStatus>().call(file);
        statusResult.fold((failure) => downloadStatus[file] = false,
            (isDownloaded) => downloadStatus[file] = isDownloaded);
      }
      emit(
          HadithCubitSuccess(hadiths: hadiths, downloadStatus: downloadStatus));
    });
  }

  Future<void> toggleHadithDownload(String fileName, String content) async {
    if (state is! HadithCubitSuccess) return;

    final currentState = state as HadithCubitSuccess;
    final isDownloaded = currentState.downloadStatus[fileName] ?? false;

    final result = isDownloaded
        ? await getIT<RemoveHadith>().call(fileName)
        : await getIT<DownloadFileUseCase>().call(fileName, content);

    result.fold(
        (failure) => emit(HadithCubitFailure(errMessage: failure.errorMessage)),
        (_) => loadHadiths(fileName));
  }
}
