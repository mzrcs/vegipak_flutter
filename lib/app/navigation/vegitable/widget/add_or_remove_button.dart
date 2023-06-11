import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/my_colors.dart';

class AddOrRemoveButton extends StatelessWidget {
  const AddOrRemoveButton({super.key, this.onTap, required this.icon});

  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: MyColors.kGreenColor,
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 32.h,
            width: 32.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
