import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constants/my_colors.dart';

class Utils {
  // Change Focus Node
  // static fieldFocusChange(
  //   BuildContext context,
  //   FocusNode currentNode,
  //   FocusNode nextNode,
  // ) {
  //   currentNode.unfocus();
  //   FocusScope.of(context).requestFocus(nextNode);
  // }

  // Device Type
  // static String getDeviceType() {
  //   final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  //   return data.size.shortestSide < 550 ? 'phone' : 'tablet';
  // }

  // TOAST
  // static toastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //   );
  // }

  // SNACKBAR
  static void snackBarMessage({
    required String message,
    required IconData icons,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icons, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        elevation: 2,
        duration: const Duration(milliseconds: 1500),
        // action: SnackBarAction(
        //   label: 'Open',
        //   onPressed: () => onPress(),
        // ),
      ),
    );
  }

  static Future<void> snackBarPopUp(
    BuildContext context,
    String text,
    Color color,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // DATE FORMAT
  String dateFormat(String date) {
    var parsedDate = DateTime.parse(date);
    // final inputDate = DateFormat.parse(date);
    // return DateFormat('d MMM, yyyy').format(parsedDate);
    return DateFormat('dd/MMM/yy').format(parsedDate);
  }

  // DROPDOWN
  customDropdownButton({
    required BuildContext context,
    // ClientViewModel clientViewModel,
    // ClientViewModel clientProvider,
    required String hintText,
    required String errorText,
    required List<DropdownMenuItem<String>>? items,
    required Function(String?)? onChanged,
    required IconData iconData,
    bool updateDropdown = false,
    String? value,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          value: value,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 17,
              ),
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Icon(iconData, color: MyColors.kGreenColor, size: 24),
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 0.1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 0.1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade100, width: 0.1),
            ),
          ),
          isExpanded: true,
          hint: Text(
            hintText,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 15,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
          ),
          items: items,
          validator: (value) {
            if (value == null) {
              return errorText;
            }
            return null;
          },
          onChanged: onChanged,
          onSaved: (value) {},
          buttonStyleData: const ButtonStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 2, right: 12),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
          ),
          // isDense: true,
          dropdownStyleData: DropdownStyleData(
            maxHeight: MediaQuery.of(context).size.height * 0.60,
            useSafeArea: true,
            elevation: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  // CROP IMAGE
  // Future<File?> cropImage({required File imageFile}) async {
  //   CroppedFile? croppedImage = await ImageCropper().cropImage(
  //     sourcePath: imageFile.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //   );
  //   if (croppedImage == null) return null;
  //   return File(croppedImage.path);
  // }

  // Future<dynamic> getImageFromSource(
  //   BuildContext context,
  //   ImageSource source,
  //   bool toCrop,
  // ) async {
  //   try {
  //     var image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return null;
  //     if (toCrop) {
  //       var croppedImage = await cropImage(imageFile: File(image.path));
  //       return croppedImage;
  //     }
  //   } on PlatformException {
  //     Navigator.of(context).pop();
  //   }
  // }

  // Future<dynamic> getImageFromSource(
  //   BuildContext context,
  //   ImageSource source,
  // ) async {
  //   try {
  //     var image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return null;
  //     // if (toCrop) {
  //     //   var croppedImage = await cropImage(imageFile: File(image.path));
  //     //   return croppedImage;
  //     // }
  //     return File(image.path);
  //   } on PlatformException {
  //     Navigator.of(context).pop();
  //   }
  // }

  // Future<List<Map<String, dynamic>>> selectImages() async {
  //   final images = await ImagePicker().pickMultiImage();
  //   List<Map<String, dynamic>> imageDetails = [];
  //   if (images != null) {
  //     for (var image in images) {
  //       Map<String, dynamic> imageDetail = {};
  //       imageDetail['extension'] = image.path.split('.').last;
  //       imageDetail['imagePath'] = image.path;
  //       imageDetail['image'] =
  //           base64Encode(await File(image.path).readAsBytes());
  //       imageDetails.add(imageDetail);
  //     }
  //   }
  //   return imageDetails;
  // }
}
