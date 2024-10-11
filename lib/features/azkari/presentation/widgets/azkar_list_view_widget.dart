import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/functions/custom_navigation.dart';
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
          if(state is AzkarLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is AzkarSuccess){
            return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: state.azkarList.length,
            itemBuilder: (context, index) {
              final categoryGroup = state.azkarList[index];
              return Container(
                padding: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: ManageColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Flexible(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        state.azkarList[index].category,
                        style: getApplicationTheme()
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: FontSize.s16),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          customNavigate(context, '/zekrDetails',extra: categoryGroup);
                        },
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
