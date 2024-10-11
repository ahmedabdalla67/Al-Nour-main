import 'package:flutter/material.dart';
import 'package:mesk/features/azkari/presentation/widgets/zekr_content_list_view.dart';

class ZekrDetailsScreen extends StatelessWidget {
  const ZekrDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      ),
      body: ZekrContentListView(),
    );
  }
}