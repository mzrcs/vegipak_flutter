import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';

class LogoutAlertWidget extends StatelessWidget {
  const LogoutAlertWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text(
        "Logout?",
        style: TextStyle(fontSize: 20),
      ),
      content: const Text(
        "Are you sure you want to logout ?",
        style: TextStyle(fontSize: 15),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          onPressed: () {
            Provider.of<ProfileProvider>(context, listen: false)
                .logOut(context);
          },
          isDefaultAction: true,
          child: const Text('Yes'),
        ),
      ],
    );

    // return AlertDialog(
    //   title: const Text(
    //     'Logout',
    //     style: TextStyle(
    //       fontSize: 17,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   content: const Text(
    //     'Are you sure want to logout?',
    //     style: TextStyle(
    //       color: Color.fromARGB(255, 78, 77, 77),
    //       letterSpacing: 0.1,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   actions: [
    //     FittedBox(
    //       child: Row(
    //         children: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: const Text(
    //               'No',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               Provider.of<ProfileProvider>(context, listen: false)
    //                   .logOut(context);
    //             },
    //             child: const Text(
    //               'Yes',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
