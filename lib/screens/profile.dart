// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nexmove/screens/verify_photo.dart';

// import './common/picture_chooser.dart';
// import './../globals.dart' as Globals;
// import './../constants.dart' as Constants;

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {

//   @override
//   Widget build(BuildContext context) {
    
//     print('llamando build method');
//     print(Globals.sharedPrefs.getString(Constants.PREFS_USER_PHOTO));

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Mi Perfil',
//           //style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 70,
//                     backgroundColor: Colors.grey,
//                     backgroundImage: (Globals.sharedPrefs
//                                 .getString(Constants.PREFS_USER_PHOTO) ==
//                             null)
//                         ? AssetImage(Constants.IMG_NULL_PHOTO)
//                         : NetworkImage(Globals.sharedPrefs
//                             .getString(Constants.PREFS_USER_PHOTO)),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               (!Globals.sharedPrefs.getBool(Constants.PREFS_IS_USER_DRIVER))
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             side: BorderSide(
//                               color: Colors.green,
//                               width: 2
//                             ),
//                             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),                            
//                             shadowColor: Colors.green,
//                           ),
//                           onPressed: () {
//                             showModalBottomSheet(
//                                 context: context,
//                                 builder: (c) {
//                                   return PictureChooser(
//                                       (ImageSource source) async {
//                                     Navigator.pop(context);
//                                     try {
//                                       File file = await ImagePicker.pickImage(
//                                           source: source);
//                                       if (file != null) {
//                                         var args = VerifyPhotoArguments(file);
//                                         var photoUrl = await Navigator.pushNamed(context,
//                                             Constants.ROUTE_VERIFY_PHOTO,
//                                             arguments: args);
//                                         if (photoUrl != null) {
//                                           print('Imprimiendo photo url');
//                                           print(photoUrl);
//                                         }
//                                         //setState(() => this.files.add(file));
//                                       }
//                                     } catch (e) {
//                                       print('Error');
//                                       print(e);
//                                       //_pickImageError = e;
//                                     }
//                                   });
//                                 });
//                           },
//                           child: Text('Editar Foto'),
//                         ),
//                       ],
//                     )
//                   : Container(),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(
//                 color: Colors.grey,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'Nombre',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   '${Globals.sharedPrefs.getString(Constants.PREFS_USER_FIRST_NAME)} ${Globals.sharedPrefs.getString(Constants.PREFS_USER_LAST_NAME)}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Divider(
//                 color: Colors.grey,
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             'Contraseña',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             '********',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   OutlinedButton.icon(
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(
//                         color: Colors.green,
//                         width: 2,
//                       ),
//                       shadowColor: Colors.green
//                     ),
//                     onPressed: () {
//                       Navigator.pushNamed(
//                           context, Constants.ROUTE_EDIT_PASSWORD);
//                     },
//                     label: Text('Editar'),
//                     icon: Icon(
//                       Icons.edit,
//                       color: Colors.green,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 16,
//                   )
//                 ],
//               ),
//               Divider(
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
