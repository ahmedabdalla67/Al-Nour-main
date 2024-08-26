import 'package:flutter/material.dart';
import 'package:mesk/core/shared_component/custom_button.dart';
import 'package:mesk/core/utils/colors.dart';
import 'package:mesk/core/utils/theme_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(
              width: 10,
            ),
            Text(
              'الاثنين 16 محرم 1446',
              style: getApplicationTheme().textTheme.titleMedium,
            ),
          ],
        ),
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.3,
                    image: AssetImage('assets/images/background1.jpg')),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/quran_logo.png',
                  width: 120,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'القراءة من حيث توقفت',
                      style: getApplicationTheme()
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ManageColors.white),
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'توقفت عند صورة ',
                          style: getApplicationTheme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ManageColors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'البقرة',
                          style: getApplicationTheme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ManageColors.hover),
                        )
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'صفحة',
                          style: getApplicationTheme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ManageColors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '22',
                          style: getApplicationTheme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ManageColors.hover),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomButton()
                  ],
                )
              ],
            ),
          )
        ])
      ],
    );
  }
}
