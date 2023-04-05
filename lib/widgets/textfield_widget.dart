import 'package:flutter/material.dart';

Widget textFieldWidget({
  required String hintText,
  required IconData iconData,
  required TextEditingController controller,
  Function? onSubmitted,
}) {
  // return Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     // Text(
  //     //   title,
  //     //   // style: GoogleFonts.poppins(
  //     //   //   fontSize: 14,
  //     //   //   fontWeight: FontWeight.w400,
  //     //   //   color: const Color(0xffA7A7A7),
  //     //   // ),
  //     // ),
  //     // const SizedBox(height: 6),
  //     TextFormField(
  //       controller: controller,
  //       validator: (input) => validator(input),
  //       // style: GoogleFonts.poppins(
  //       //   fontSize: 14,
  //       //   fontWeight: FontWeight.w600,
  //       //   color: const Color(0xffA7A7A7),
  //       // ),
  //       decoration: InputDecoration(
  //         border: InputBorder.none,
  //         hintText: hintText,
  //         prefixIcon: Padding(
  //           padding: const EdgeInsets.only(left: 5),
  //           child: Icon(iconData, color: Colors.green),
  //         ),
  //       ),
  //     )
  //   ],
  // );

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
          width: 0.5,
          height: 55,
          color: Colors.black.withOpacity(0.2),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: controller,
              // validator: (input) => validator(input),

              // onTap: () {
              //   Get.to(const OtpVerificationScreen());
              // },
              // onSubmitted: (String? input) => onSubmit(),
              onFieldSubmitted: (String? input) => onSubmitted!(),
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

                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
