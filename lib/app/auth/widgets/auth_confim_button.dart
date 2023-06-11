import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/constants/my_colors.dart';

class AuthConfirmButton extends StatelessWidget {
  const AuthConfirmButton({
    Key? key,
    required this.title,
    required this.callBack,
    this.isLoading = false,
  }) : super(key: key);
  final String title;
  final Function()? callBack;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: isLoading! ? MyColors.kGreyColor4 : MyColors.kGreenColor,
        elevation: 4,
        child: InkWell(
          onTap: isLoading! ? null : callBack,
          child: Ink(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading!
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 28,
                      )
                    : Text(
                        title,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
