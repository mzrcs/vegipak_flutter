import 'package:flutter/material.dart';

import '../core/constants/my_colors.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.location_city, color: MyColors.kGreenColor),
              const SizedBox(width: 16),
              title,
              // Text(
              //   provider.selectedAreaName != null
              //       ? provider.selectedAreaName!
              //       : 'Select Area',
              //   style: provider.selectedAreaName != null
              //       ? Theme.of(context).textTheme.displaySmall!.copyWith(
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black87,
              //             fontSize: 16,
              //           )
              //       : Theme.of(context).textTheme.headlineMedium!.copyWith(
              //             fontSize: 15,
              //             color: Colors.grey.shade500,
              //             fontWeight: FontWeight.w500,
              //           ),
              // ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: MyColors.kGreenColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
