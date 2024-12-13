import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:mesk/core/connectioin/network_info.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/features/azkari/data/data_sources/local_data_source.dart';
import 'package:mesk/features/azkari/data/repository/azkar_repository_impl.dart';
import 'package:mesk/features/azkari/domain/useCase/azkar_use_case.dart';
import 'package:mesk/features/hadith/data_layer/data_source/local_data_source.dart';
import 'package:mesk/features/hadith/data_layer/data_source/remote_data_source.dart';
import 'package:mesk/features/hadith/data_layer/repository/hadith_repo_impl.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/check_hadith_status_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/download_file_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/get_hadith_files_use_case.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/remove_hadith_use_case.dart';
import 'package:mesk/features/home/data/data_sources/home_local_data_source.dart';
import 'package:mesk/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mesk/features/home/data/repository/home_repo_impl.dart';
import 'package:mesk/features/home/domain/useCases/home_data_use_case.dart';
import 'package:mesk/features/surah_details/data/data_sources/local_data_sourse.dart';
import 'package:mesk/features/surah_details/data/repository/surah_list_repo_imp.dart';
import 'package:mesk/features/surah_details/domain/useCase/surah_list_use_case.dart';

final getIT = GetIt.instance;
void setupServiceLocator() {
  getIT.registerSingleton<CacheHelper>(CacheHelper());

  getIT.registerSingleton<AppData>(AppData());

  getIT.registerSingleton<HomeDataUseCase>(
    HomeDataUseCase(
      homeRepo: HomeRepoImpl(
        remoteDataSource: HomeRemoteDataSource(appData: AppData()),
        localDataSource: HomeLocalDataSource(cache: getIT<CacheHelper>()),
        networkInfo: NetworkInfoImp(
          InternetConnection(),
        ),
      ),
    ),
  );

  getIT.registerLazySingleton<SurahListUseCase>(
    () => SurahListUseCase(
      surahListRepo: SurahListRepoImp(
        localDataSourse: LocalDataSourse(),
      ),
    ),
  );

  getIT.registerLazySingleton<AzkarUseCase>(
    () => AzkarUseCase(
      azkarRepo: AzkarRepoImpl(
        localDataSource: LocalDataSource(),
      ),
    ),
  );
  //----------------------
  //--! Hadith Injection
  // getIT.registerLazySingleton<GetHadithFilesUseCase>(
  //   () => GetHadithFilesUseCase(
  //     hadithRepo: HadithRepoImpl(
  //       localDataSource:
  //           HadithLocalDataSourceImpl(cacheHelper: getIT<CacheHelper>()),
  //       remoteDataSource: RemoteDataSourceImpl(),
  //     ),
  //   ),
  // );

  //->! Hadith Repository Singleton
  getIT.registerLazySingleton<HadithRepo>(
    () => HadithRepoImpl(
      localDataSource:
          HadithLocalDataSourceImpl(cacheHelper: getIT<CacheHelper>()),
      remoteDataSource: RemoteDataSourceImpl(),
    ),
  );

  //->! Get Hadith Files Singleton
  getIT.registerLazySingleton<GetHadithFilesUseCase>(
    () => GetHadithFilesUseCase(
      hadithRepo: getIT<HadithRepo>(),
    ),
  );

  //-->! Download File Singleton
  getIT.registerLazySingleton<DownloadFileUseCase>(
    () => DownloadFileUseCase(
      hadithRepo: getIT<HadithRepo>(),
    ),
  );

  //-->! Check Hadith Status
  getIT.registerLazySingleton<CheckHadithStatus>(
    () => CheckHadithStatus(
      repository: getIT<HadithRepo>(),
    ),
  );

  //-->! remove Hadith Singleton
  getIT.registerLazySingleton<RemoveHadith>(
    () => RemoveHadith(
      repository: getIT<HadithRepo>(),
    ),
  );
}
