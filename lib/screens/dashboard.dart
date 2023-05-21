// import 'package:flutter/material.dart';
// // import '../constants.dart' as Constants;
// // import '../globals.dart' as Globals;

// import '../constants.dart' as Constants;
// import '../globals.dart' as Globals;

// class Choice {
//   final String title;
//   final IconData? icon;
//   final String imageIcon;
//   const Choice({
//     required this.title,
//     required this.icon,
//     required this.imageIcon,
//   });
// }

// class Dashboard extends StatelessWidget {
//   // final LoginLogoutListener loginLogoutListener;
//   final List<Choice> choices = const <Choice>[
//     Choice(title: 'Hoy', icon: Icons.local_shipping, imageIcon: ''),
//     Choice(title: 'Programados', icon: Icons.today, imageIcon: ''),
//     Choice(title: 'Realizados', icon: Icons.done_outline, imageIcon: ''),
//     Choice(
//         title: 'Mis Ofertas',
//         icon: null,
//         imageIcon: 'assets/images/dollar.png'),
//   ];

//   const Dashboard();

//   @override
//   Widget build(BuildContext context) {
//     // int userOfferType =
//     //     Globals.sharedPrefs.get(Constants.PREFS_USER_OFFER_TYPE);
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Menú'),
//       ),
//       drawer: drawerMenu(context),
//       body: SafeArea(
//         child: Container(
//           color: const Color.fromARGB(255, 234, 237, 241),
//           child: GridView.count(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               crossAxisSpacing: 2.0,
//               mainAxisSpacing: 2.0,
//               crossAxisCount:
//                   (MediaQuery.of(context).orientation == Orientation.portrait)
//                       ? 2
//                       : 3,
//               children: [
//                 ...List.generate(choices.length, (index) {
//                   Choice choice = choices[index];
//                   // if (choice.title == 'Mis Ofertas' && userOfferType == 1) {
//                   //   return const SizedBox(width: 0);
//                   // }
//                   return Center(
//                     child: ChoiceCard(
//                       choice: choices[index],
//                       onTap: (String choice) {
//                         print(choice);
//                         AssignedTripFilters filter;
//                         String title = 'Viajes para hoy';

//                         if (choice == 'Hoy') {
//                           filter = AssignedTripFilters.Today;
//                         } else if (choice == 'Programados') {
//                           filter = AssignedTripFilters.Scheduled;
//                           title = 'Viajes programados';
//                         } else if (choice == 'Realizados') {
//                           filter = AssignedTripFilters.Accomplished;
//                           title = 'Viajes realizados';
//                         } else if (choice == 'Mis Ofertas') {
//                           filter = AssignedTripFilters.Accomplished;
//                           title = 'Mis Ofertas';
//                           return Navigator.pushNamed(
//                               context, Constants.ROUTE_TRIPS_DEALS_LIST);
//                         }

//                         Navigator.pushNamed(
//                           context,
//                           Constants.ROUTE_ASSIGNED_TRIPS,
//                           arguments: AssignedTripsArguments(
//                             title,
//                             //this.loginLogoutListener,
//                             filter,
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 })
//               ]),
//         ),
//       ),
//     );
//   }

//   Widget drawerMenu(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             otherAccountsPictures: <Widget>[],
//             accountEmail:
//                 Text(Globals.sharedPrefs.getString(Constants.PREFS_USER_EMAIL)),
//             accountName: Text(
//                 '${Globals.sharedPrefs.getString(Constants.PREFS_USER_FIRST_NAME)} ${Globals.sharedPrefs.getString(Constants.PREFS_USER_LAST_NAME)}'),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.grey,
//               backgroundImage:
//                   (Globals.sharedPrefs.getString(Constants.PREFS_USER_PHOTO) ==
//                           null)
//                       ? AssetImage(Constants.IMG_NULL_PHOTO)
//                       : NetworkImage(Globals.sharedPrefs
//                           .getString(Constants.PREFS_USER_PHOTO)),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.account_circle),
//             title: Text('Mi Perfil'),
//             onTap: () {
//               Navigator.pushNamed(context, Constants.ROUTE_PROFILE);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.local_shipping),
//             title: Text('Mis Vehiculos'),
//             onTap: () {
//               Navigator.pushNamed(context, Constants.ROUTE_VEHICLE_LISTING);
//             },
//           ),
//           ListTile(
//             leading: Image.asset(
//               'assets/images/driver.png',
//               //color: Colors.black,
//               width: 27,
//             ),
//             title: Text('Mis Conductores'),
//             onTap: () {
//               Navigator.pushNamed(
//                   context, Constants.ROUTE_VEHICLE_ASSIGNED_DRIVERS,
//                   arguments: false);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.power_settings_new),
//             title: Text('Cerrar sesión'),
//             onTap: () async {
//               // Update the state of the app
//               // ...
//               // Then close the drawer
//               Navigator.pop(context);
//               Globals.sharedPrefs.setString(
//                 Constants.PREFS_ROOT_ROUTE_NAME,
//                 Constants.ROUTE_LOGIN,
//               );
//               //Navigator.pushReplacementNamed(context, RoutingConstants.LoginRoute);
//               this.loginLogoutListener.onLogout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChoiceCard extends StatelessWidget {
//   final Choice choice;
//   final Function onTap;

//   const ChoiceCard({Key? key, required this.choice, required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
//     return Card(
//         elevation: 7,
//         color: Colors.white,
//         child: InkWell(
//           onTap: onTap(choice.title),
//           child: Center(
//             child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   choice.icon == null
//                       ? Image.asset(
//                           choice.imageIcon,
//                           //color: Colors.black,
//                           width: 100,
//                           alignment: Alignment.center,
//                         )
//                       : Icon(choice.icon, size: 100.0, color: Colors.green),
//                   Text(choice.title, style: textStyle),
//                 ]),
//           ),
//         ));
//   }
// }
