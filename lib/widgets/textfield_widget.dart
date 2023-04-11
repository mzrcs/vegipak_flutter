import 'package:flutter/material.dart';

Widget textFieldWidget({
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
              Expanded(child: Icon(iconData, color: Colors.green)),
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
                child: Icon(iconData, color: Colors.green),
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
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
  );
}
