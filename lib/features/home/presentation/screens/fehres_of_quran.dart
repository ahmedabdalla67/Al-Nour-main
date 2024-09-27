import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class FehresOfQuran extends StatelessWidget {
  const FehresOfQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8,),
        itemCount: 5,
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
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1'),
                  Column(
                    children: [
                      Text('سورة الفاتحة', style: getApplicationTheme().textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500)),
                      Text('اياتها 7 - مكية', style: getApplicationTheme().textTheme.bodyMedium!.copyWith(color: ManageColors.gray),)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}