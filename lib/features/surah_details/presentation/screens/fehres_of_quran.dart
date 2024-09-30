import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/surah_details/presentation/manager/cubit/surah_info_cubit.dart';

class FehresOfQuran extends StatelessWidget {
  const FehresOfQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SurahInfoCubit()..getSurahList(),
        child: BlocBuilder<SurahInfoCubit, SurahInfoState>(
          builder: (context, state) {
            if(state is SurahInfoLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is SurahInfoFailure){
              return Dialog(
                backgroundColor: ManageColors.card2,
                child: Text(state.errMessage),
              );
            }
            else if(state is SurahInfoSuccess){
              return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: state.surahInfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ManageColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(state.surahInfo[index].index.toString()),
                          Column(
                            children: [
                              Text(state.surahInfo[index].titleAr,
                                  style: getApplicationTheme()
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontWeight: FontWeight.w500)),
                              Text(
                                state.surahInfo[index].type,
                                style: getApplicationTheme()
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: ManageColors.gray),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
            }else{
              return Text('There is an error');
            }
          },
        ),
      ),
    );
  }
}
