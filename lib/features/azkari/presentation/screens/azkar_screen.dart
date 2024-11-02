import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/azkari/presentation/manager/cubit/azkar_cubit.dart';
import 'package:mesk/features/azkari/presentation/widgets/azkar_list_view_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..getAzkarDataList(),
      child: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<AzkarCubit, AzkarState>(
                builder: (BuildContext context, state) {
              if (state is OpenSearchField) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    autofocus: true,
                    onChanged: (query) {
                      context.read<AzkarCubit>().getSearchResult(query);
                    },
                    style: getApplicationTheme().textTheme.headlineMedium,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: ManageColors.primary),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: ManageColors.gray),
                      ),
                      hintText: '... ابحث عن اذكارك',
                    ),
                  ),
                );
              } else {
                return Text(
                  'أذكارى',
                  style: getApplicationTheme().textTheme.headlineLarge,
                );
              }
            }),
            leading: BlocBuilder<AzkarCubit, AzkarState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () =>
                      context.read<AzkarCubit>().toggleSearchIcon(),
                  icon: Icon(
                    context.read<AzkarCubit>().isSearchIcon
                        ? Icons.close
                        : Icons.search,
                  ),
                );
              },
            ),
          ),
          body: const AzkarListView(),
        );
      }),
    );
  }
}
