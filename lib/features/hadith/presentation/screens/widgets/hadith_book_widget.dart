import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/hadith/presentation/cubit/hadith_cubit.dart';

class HadithBookWidget extends StatelessWidget {
  const HadithBookWidget(
      {super.key, required this.fileName, required this.index});
  final List<String> fileName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: ManageColors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          const Icon(Icons.book),
          const SizedBox(
            width: 10,
          ),
          Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fileName[index]),
              // SizedBox(height: 3,),
              Text(
                "‍٤‍‍٤حديث",
                textDirection: TextDirection.rtl,
                style: getApplicationTheme().textTheme.bodySmall,
              )
            ],
          ),
          const Spacer(),
          BlocBuilder<HadithCubitCubit, HadithCubitState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<HadithCubitCubit>().loadHadiths(fileName[index]);
                  },
                  icon: state is HadithCubitSuccess ? const Icon(Icons.download_done_outlined) : state is HadithCubitLoading ? const CircularProgressIndicator(color: ManageColors.primary,) : const Icon(Icons.file_download_outlined));
            },
          )
        ],
      ),
    );
  }
}
