import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/font_manager.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/azkari/presentation/manager/cubit/azkar_cubit.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key});
  // final AzkarEntity azkarEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if(state is AzkarInitial){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is AzkarSuccess){
            return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: state.azkarList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(right: 10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: ManageColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      state.azkarList[index].category,
                      style: getApplicationTheme()
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.s16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  ],
                ),
              );
            },
          );
          }else{
            return const Text('There is an error');
          }
        },
      ),
    );
  }
}
