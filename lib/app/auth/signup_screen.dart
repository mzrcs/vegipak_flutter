// import 'package:flutter/material.dart';
// import '../../utils/routes/routes_name.dart';
// import '../../widgets/button_widget.dart';
// import '../../widgets/logo_widget.dart';
// import '../../widgets/textfield_widget.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 logoWidget(),
//                 const SizedBox(height: 30),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                   child: Column(
//                     children: [
//                       textFieldWidget(
//                         hintText: 'First Name',
//                         iconData: Icons.person,
//                         controller: firstNameController,
        
//                       ),
//                       const SizedBox(height: 12),
//                       textFieldWidget(
//                         hintText: 'Last Name',
//                         iconData: Icons.person,
//                         controller: lastNameController,
                  
//                       ),
//                       const SizedBox(height: 12),
//                       textFieldWidget(
//                         hintText: 'Email',
//                         iconData: Icons.email,
//                         controller: emailController,
                   
//                       ),
//                       const SizedBox(height: 12),
//                       textFieldWidget(
//                         hintText: 'Password',
//                         iconData: Icons.lock,
//                         controller: emailController,
                
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: myButton('Sign up', () {}),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: myTextButton(
//                     'Already have an account? Sign in',
//                     () => Navigator.of(context).pushNamed(RouteName.login),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
