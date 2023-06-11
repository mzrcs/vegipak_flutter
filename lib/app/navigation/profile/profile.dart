import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/navigation/profile/provider/profile_provider.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   ((timeStamp) async {
    //     await Provider.of<UserProvider>(context, listen: false).getUser();
    //   }),
    // );
    // print('Email: ${authModel.email}');

    return Scaffold(
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return Consumer<UserProvider>(
      builder: (context, value, _) {
        return ListView(
          // padding: const EdgeInsets.all(16),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).size.height * 0.08,
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value.fullName != null ? value.fullName! : 'Abc',
                  // style: TextStyles.heading3,
                ),
                Text(
                  value.email != null ? value.email! : 'email@gmail.com',
                  // style: TextStyles.body1,
                ),
                const SizedBox(height: 5),
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.editMyProfile);
                  },
                  padding: EdgeInsets.zero,
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
            // const SizedBox(height: 8),
            // // Divider(color: AppColors.text),
            // ListTile(
            //   onTap: () {},
            //   contentPadding: EdgeInsets.zero,
            //   leading: const Icon(Icons.help, color: Colors.green),
            //   title: const Text("Help"),
            // ),
            ListTile(
              onTap: () {
                Provider.of<ProfileProvider>(context, listen: false)
                    .logOut(context);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
