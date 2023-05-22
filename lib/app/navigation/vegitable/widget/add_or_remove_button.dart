import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class AddOrRemoveButton extends StatelessWidget {
  const AddOrRemoveButton({super.key, this.onTap, required this.icon});

  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: kGreenColor,
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Icon(icon, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
