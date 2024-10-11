import 'package:flutter/material.dart';
import 'package:mesk/core/shared_component/custom_button.dart';
import 'package:mesk/core/utils/colors.dart';

class ZekrContainerWidget extends StatelessWidget {
  const ZekrContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
                    color: ManageColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
                  ),
                  child: const Column(
                    children: [
                      Text('Zekr'),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: TextDirection.rtl,
                        children: [
                          CustomButton(color: ManageColors.primary, text: 'تكرار',textColor: ManageColors.white, width: 150,),
                          CustomButton(color: Colors.transparent, text: 'مشاركة',width: 150,),
                        ],
                      )
                    ],
                  ),
      ),
    );
  }
}