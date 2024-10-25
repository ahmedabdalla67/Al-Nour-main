import 'package:flutter/material.dart';
import 'package:mesk/core/shared_component/custom_button.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';

class ZekrContainerWidget extends StatefulWidget {
  const ZekrContainerWidget({super.key, required this.categoryGroup, required this.index});
  final CategoryGroupEntity categoryGroup;
  final int index;

  @override
  State<ZekrContainerWidget> createState() => _ZekrContainerWidgetState();
}

class _ZekrContainerWidgetState extends State<ZekrContainerWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
                    color: ManageColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: ManageColors.gray.withOpacity(0.2)),
                  ),
                  child:  Column(
                    children: [
                      Text(widget.categoryGroup.azkarContent[widget.index].zekr, style: getApplicationTheme().textTheme.headlineMedium, textDirection: TextDirection.rtl,),
                      const SizedBox(height: 20,),
                       Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly  ,
                        textDirection: TextDirection.rtl,
                        children: [
                         CustomButton(
                          color: ManageColors.primary, 
                          text: 'تكرار  ${widget.categoryGroup.azkarContent[widget.index].count!= '' ? widget.categoryGroup.azkarContent[widget.index].count : '1'}/$count',
                          textColor: ManageColors.white, width: 150,
                          onPressed: (){
                            // print('count is $count');
                            if(count < int.parse(widget.categoryGroup.azkarContent[widget.index].count != '' ? widget.categoryGroup.azkarContent[widget.index].count!  : '1')){
                              setState(() {
                                count++;
                              });
                              //print('count is $count');
                            }
                          },
                          ),
                          const CustomButton(color: Colors.transparent, text: 'مشاركة',width: 150,),
                        ],
                      )
                    ],
                  ),
      ),
    );
  }
}


