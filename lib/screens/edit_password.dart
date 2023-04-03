// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../globals.dart' as Globals;
// import '../constants.dart' as Constants;

// enum PageStates {
//   SuccessSendingRequest,
//   ErrorSendingRequest,
//   SendingRequest,
//   WaitingFormRequest,
// }

// class EditPassword extends StatefulWidget {
//   const EditPassword({super.key});

//   @override
//   _EditPasswordState createState() => _EditPasswordState();
// }

// class _EditPasswordState extends State<EditPassword> {
//   PageStates _currentPageState = PageStates.WaitingFormRequest;
//   var _newPasswordError = '';
//   var _confirmPasswordError = '';
//   var _actualPasswordError = '';
//   var _errorSendingRequest = '';
//   final _newPasswordTextController = TextEditingController();
//   final _confirmPasswordTextController = TextEditingController();
//   final _actualPasswordTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Editar Contraseña'
//             //style: TextStyle(color: Colors.white),
//             ),
//       ),
//       body: SafeArea(
//         child: _content(),
//       ),
//     );
//   }

//   Widget _content() {
//     switch (_currentPageState) {
//       case PageStates.SendingRequest:
//       case PageStates.WaitingFormRequest:
//       case PageStates.ErrorSendingRequest:
//         return inputForm();
//       // break;
//       case PageStates.SuccessSendingRequest:
//         return success();

//       default:
//         return Container();
//     }
//   }

//   Widget success() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         const SizedBox(height: 50),
//         Image.asset(
//           Constants.IMG_SUCCESS_GREEN,
//           //color: Colors.black,
//           width: 100,
//           height: 100,
//           alignment: Alignment.center,
//           color: Constants.COLOR_PRIMARY,
//         ),
//         const SizedBox(height: 25),
//         Padding(
//           padding: EdgeInsets.only(left: 16, right: 16),
//           child: Text(
//             'Su contraseña ha sido cambiada de manera exitosa',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Constants.COLOR_PRIMARY_TEXT,
//             ),
//           ),
//         ),
//         const SizedBox(height: 50),
//       ],
//     );
//   }

//   Widget inputForm() {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 40),
//             const Text(
//               'Nueva Contraseña',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               decoration: const InputDecoration(icon: Icon(Icons.vpn_key)),
//               cursorColor: Constants.COLOR_CURSOR,
//               obscureText: true,
//               controller: _newPasswordTextController,
//               maxLines: 1,
//               onSubmitted: (value) => this._submitButtonClick(),
//             ),
//             (_newPasswordError.isNotEmpty)
//                 ? Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Text(
//                       _newPasswordError,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Theme.of(context).errorColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 : Container(),
//             const SizedBox(height: 40),
//             const Text(
//               'Confirmar Nueva Contraseña',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                 icon: Icon(Icons.vpn_key),
//               ),
//               // cursorColor: Constants.COLOR_CURSOR,
//               obscureText: true,
//               controller: _confirmPasswordTextController,
//               maxLines: 1,
//               // onSubmitted: (value) => this._submitButtonClick(),
//             ),
//             (_confirmPasswordError.isNotEmpty)
//                 ? Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Text(
//                       _confirmPasswordError,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Theme.of(context).errorColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 : Container(),
//             const SizedBox(
//               height: 40,
//             ),
//             const Text(
//               'Contraseña Actual',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                 icon: Icon(Icons.security),
//               ),
//               // cursorColor: Constants.COLOR_CURSOR,
//               obscureText: true,
//               controller: _actualPasswordTextController,
//               maxLines: 1,
//               onSubmitted: (value) => this._submitButtonClick(),
//             ),
//             (this._actualPasswordError.isNotEmpty)
//                 ? Padding(
//                     padding: EdgeInsets.only(top: 8),
//                     child: Text(
//                       this._actualPasswordError,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Theme.of(context).errorColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 : Container(),
//             SizedBox(
//               height: 40,
//             ),
//             (_errorSendingRequest.isNotEmpty)
//                 ? Padding(
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       _errorSendingRequest,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Theme.of(context).errorColor,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 : Container(),
//             (_currentPageState == PageStates.SendingRequest)
//                 ? ConstrainedBox(
//                     constraints: const BoxConstraints(
//                       minHeight: 50,
//                       minWidth: 50,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                               // Constants.COLOR_PRIMARY,
//                               ),
//                           value: null,
//                         )
//                       ],
//                     ),
//                   )
//                 : Container(
//                     height: 44,
//                     margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           // primary: Constants.COLOR_PRIMARY,
//                           ),
//                       onPressed: this._submitForm,
//                       child: Text(
//                         'Cambiar contraseña',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//             SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _submitButtonClick() {
//     FocusScope.of(context).unfocus();
//     this._submitForm();
//   }

//   void _submitForm() async {
//     var trimmedNewPassword = this._newPasswordTextController.text;
//     var trimmedConfirmPassword = this._confirmPasswordTextController.text;
//     var trimmedActualPassword = this._actualPasswordTextController.text;
//     var formHaserror = false;

//     this._errorSendingRequest = '';
//     this._newPasswordError =
//         this._confirmPasswordError = this._actualPasswordError = '';

//     if (trimmedNewPassword.isEmpty) {
//       formHaserror = true;
//       this._newPasswordError = 'Introduzca su nueva contraseña';
//     }

//     if (trimmedConfirmPassword.isEmpty) {
//       formHaserror = true;
//       this._confirmPasswordError = 'Confirme su nueva contraseña';
//     }

//     if (trimmedActualPassword.isEmpty) {
//       formHaserror = true;
//       this._actualPasswordError = 'Introduzca su contraseña actual';
//     }

//     if (formHaserror) {
//       this.setState(() {});
//       return;
//     }

//     if (trimmedNewPassword != trimmedConfirmPassword) {
//       formHaserror = true;
//       this._confirmPasswordError = 'La contraseña no coincide';
//     }

//     if (formHaserror) {
//       this.setState(() {});
//       return;
//     }

//     setState(() {
//       this._currentPageState = PageStates.SendingRequest;
//     });

//     try {
//       var postBody = {
//         'new_password': trimmedNewPassword,
//         'repeat_password': trimmedConfirmPassword,
//         'password': trimmedActualPassword,
//       };

//       var token = Globals.sharedPrefs.getString(Constants.PREFS_TOKEN);
//       var url = Constants.API_UPDATE_PASSWORD;
//       var response = await http.post(Uri.parse(url), body: postBody, headers: {
//         'Authorization': 'Bearer $token',
//       });

//       print(response.statusCode);
//       print(response.body);

//       if (response.statusCode == 422) {
//         var extractedData = json.decode(response.body) as Map<String, dynamic>;
//         if (extractedData.containsKey('errors')) {
//           var errors = extractedData['errors'] as Map;
//           if (errors.containsKey('new_password')) {
//             this._newPasswordError = errors['new_password'][0];
//           }

//           if (errors.containsKey('repeat_password')) {
//             this._confirmPasswordError = errors['repeat_password'][0];
//           }

//           if (errors.containsKey('password')) {
//             this._actualPasswordError = errors['password'][0];
//           }

//           if (errors.containsKey('not_password')) {
//             this._actualPasswordError = errors['not_password'][0];
//           }

//           setState(() {
//             this._currentPageState = PageStates.WaitingFormRequest;
//           });
//         }
//         return;
//       }

//       if (response.statusCode != 200) {
//         setState(() {
//           this._errorSendingRequest =
//               'Ha ocurrido un error inesperado, por favor, intente nuevamente';
//           this._currentPageState = PageStates.ErrorSendingRequest;
//         });
//         return;
//       }

//       setState(() {
//         this._currentPageState = PageStates.SuccessSendingRequest;
//       });
//     } catch (error) {
//       print(error);

//       setState(() {
//         this._errorSendingRequest =
//             'Ha ocurrido un error inesperado, por favor, intente nuevamente';
//         this._currentPageState = PageStates.ErrorSendingRequest;
//       });
//     }
//   }
// }
