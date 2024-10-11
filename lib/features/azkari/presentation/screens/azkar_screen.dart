import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesk/features/azkari/presentation/manager/cubit/azkar_cubit.dart';
import 'package:mesk/features/azkari/presentation/widgets/azkar_list_view_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..getAzkarDataList(),
      child: const Scaffold(
        body: AzkarListView(),
      ),
    );
  }
}
