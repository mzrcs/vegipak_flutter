import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/my_colors.dart';

Widget textFieldWidget1({
  required BuildContext context,
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  required Function validator,
  void Function(String)? onChanged,
  TextInputType? textInputType,
  final List<TextInputFormatter>? inputFormatters,
  bool? isPhoneField = false,
  bool? readOnly = false,
  int? maxLines = 1,
}) {
  return Container(
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
    child: TextFormField(
      validator: (value) => validator(value),
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black87.withOpacity(0.9),
            fontSize: 16,
          ),
      controller: controller,
      maxLines: maxLines,
      cursorColor: MyColors.kGreenColor,
      readOnly: readOnly!,
      autofocus: false,
      autocorrect: false,
      keyboardType: textInputType,
      obscureText: false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: maxLines! > 1
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(iconData, color: MyColors.kGreenColor),
              ),
        prefixText: maxLines > 1 ? '' : '  ',
        filled: true,
        fillColor: Colors.white,
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        // errorText: 'This is the error text',
      ),
    ),
  );
}

Widget textFieldPasswordWidget1({
  required BuildContext context,
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  required Function validator,
  required Function onIconPress,
  required bool obscureText,
  void Function(String)? onChanged,
  TextInputType? textInputType,
  final List<TextInputFormatter>? inputFormatters,
  bool? readOnly = false,
  int? maxLines = 1,
}) {
  return Container(
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
    child: TextFormField(
      validator: (value) => validator(value),
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black87.withOpacity(0.9),
            fontSize: 16,
          ),
      controller: controller,
      maxLines: maxLines,
      cursorColor: MyColors.kGreenColor,
      readOnly: readOnly!,
      autofocus: false,
      autocorrect: false,
      keyboardType: textInputType,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: maxLines! > 1
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(iconData, color: MyColors.kGreenColor),
              ),

        suffixIcon: GestureDetector(
          onTap: () => onIconPress(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              obscureText
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              color: MyColors.kGreenColor,
            ),
          ),
        ),
        prefixText: maxLines > 1 ? '' : '  ',
        filled: true,
        fillColor: Colors.white,
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        // errorText: 'This is the error text',
      ),
    ),
  );
}

// Widget textFieldWidget2({
//   required BuildContext context,
//   required String hintText,
//   required TextEditingController controller,
//   required Function validator,
//   void Function(String)? onChanged,
//   TextInputType? textInputType,
//   bool? isPhoneField = false,
//   bool? readOnly = false,
// }) {
//   return TextFormField(
//     validator: (value) => validator(value),
//     // validator: (String? value) {
//     //   if (value == null || value.isEmpty) {
//     //     return 'Required';
//     //   }
//     //   return null;
//     // },
//     textAlign: TextAlign.start,
//     textAlignVertical: TextAlignVertical.center,
//     style: Theme.of(context).textTheme.displaySmall!.copyWith(
//           fontWeight: FontWeight.w400,
//           color: Colors.black87,
//           fontSize: 17,
//         ),
//     controller: controller,
//     cursorColor: MyColors.kGreenColor,
//     readOnly: readOnly!,
//     autofocus: false,
//     autocorrect: false,
//     keyboardType: textInputType,
//     obscureText: false,
//     textInputAction: TextInputAction.done,
//     decoration: InputDecoration(
//       // prefixIcon: Padding(
//       //   padding: const EdgeInsets.only(left: 6),
//       //   child: Icon(iconData, color: MyColors.kGreenColor),
//       // ),
//       prefixText: ' ',
//       filled: true,
//       fillColor: Colors.white,
//       isCollapsed: true,
//       contentPadding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
//       hintText: hintText,
//       hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
//             fontSize: 15,
//             color: Colors.grey.shade500,
//             fontWeight: FontWeight.w500,
//           ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(6),
//         borderSide: BorderSide(color: Colors.grey.shade100, width: 0.1),
//       ),

//       // errorText: 'This is the error text',
//     ),
//   );
// }

Widget phoneFieldWidget({
  required BuildContext context,
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  void Function(String)? onChanged,
  TextInputType? keyboardType = TextInputType.phone,
  List<TextInputFormatter>? inputFormatters,
  bool? isPhoneField = false,
  bool? readOnly = false,
}) {
  return Container(
    width: double.infinity,
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 3,
          blurRadius: 10,
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Expanded(
          flex: isPhoneField! ? 2 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Icon(iconData, color: MyColors.kGreenColor)),
              if (isPhoneField) textWidget(text: '+92', fontSize: 16),
              if (isPhoneField) const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          width: 0.4,
          height: 55,
          color: Colors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: controller,
              readOnly: readOnly!,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              cursorColor: MyColors.kGreenColor,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              // validator: (input) => validator(input),

              // onTap: () {
              //   Get.to(const OtpVerificationScreen());
              // },
              // onSubmitted: (String? input) => onSubmit(),
              // onFieldSubmitted: (String? input) => onSubmitted!(),
              // onChanged: (value) {
              //   onChanged!(value);
              // },
              decoration: InputDecoration(
                // hintStyle: GoogleFonts.poppins(
                //   fontSize: 12,
                //   fontWeight: FontWeight.normal,
                // ),
                hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: hintText,

                // errorStyle: const TextStyle(
                //   color: Colors.transparent,
                //   fontSize: 0,
                //   height: 0,
                // ),
                // suffixIcon:
                //     isSuffixIconVisible! ? const Icon(Icons.check) : null,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget profileUpdateField({
  required BuildContext context,
  // required String initialValue,
  required String labelText,
  required String hintText,
  required TextEditingController controller,
  required Function validator,
  final List<TextInputFormatter>? inputFormatters,
  bool readOnly = false,
  TextInputType? textInputType,
}) {
  return TextFormField(
    // initialValue: initialValue,
    validator: (value) => validator(value),
    inputFormatters: inputFormatters,
    readOnly: readOnly,
    // validator: (val) =>
    //     val != null && val.isNotEmpty ? null : 'Required Field',
    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
    controller: controller,
    keyboardType: textInputType,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: hintText,
      label: Text(
        labelText,
        style: const TextStyle(fontSize: 14),
      ),
    ),
  );
}

Widget textWidget({
  required String text,
  double fontSize = 12,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: Colors.grey.shade500,
      fontWeight: FontWeight.w400,
    ),
  );
}
