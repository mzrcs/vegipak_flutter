import 'package:flutter/material.dart';
import 'package:vegipak/app/utils/constants.dart';

Widget textFieldWidget1({
  required BuildContext context,
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  void Function(String)? onChanged,
  TextInputType? textInputType,
  bool? isPhoneField = false,
  bool? readOnly = false,
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
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            fontSize: 17,
          ),
      controller: controller,
      cursorColor: kGreenColor,
      readOnly: readOnly!,
      autofocus: false,
      autocorrect: false,
      keyboardType: textInputType,
      obscureText: false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Icon(iconData, color: kGreenColor),
        ),
        prefixText: '  ',
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

Widget phoneFieldWidget({
  required BuildContext context,
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  void Function(String)? onChanged,
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
              Expanded(child: Icon(iconData, color: kGreenColor)),
              if (isPhoneField) textWidget(text: '+92', fontSize: 17),
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
              cursorColor: kGreenColor,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              // validator: (input) => validator(input),

              // onTap: () {
              //   Get.to(const OtpVerificationScreen());
              // },
              // onSubmitted: (String? input) => onSubmit(),
              // onFieldSubmitted: (String? input) => onSubmitted!(),
              onChanged: (value) {
                onChanged!(value);
              },
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

Widget dropDownWidget({
  required Widget hintText,
  required IconData iconData,
  required Function(String?)? onChanged,
  required Object? value,
  required List<DropdownMenuItem<Object>>? items,
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
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(iconData, color: kGreenColor),
              ),
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
          child: DropdownButtonFormField(
            hint: hintText,
            decoration: const InputDecoration(
              // labelText: 'Gulistan-e-Johuar',
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 16, right: 12),
            ),
            isExpanded: false,
            iconEnabledColor: Colors.green,
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: (_) => onChanged,
          ),
        ),
      ],
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
    ),
  );
}
