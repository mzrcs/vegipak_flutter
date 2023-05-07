import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/profile/provider/profile_provider.dart';
import 'package:vegipak/widgets/button_widget.dart';

import '../../logic/cubit/user_cubit/user_cubit.dart';
import '../../logic/cubit/user_cubit/user_state.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SizedBox(
    //     height: MediaQuery.of(context).size.height * 1,
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //         top: MediaQuery.of(context).size.height * 0.08,
    //         bottom: MediaQuery.of(context).size.height * 0.03,
    //       ),
    //       child: Column(
    //         children: [
    //           const Center(
    //             child: CircleAvatar(
    //               radius: 60, // Image radius
    //               backgroundImage:
    //                   NetworkImage('https://dummyimage.com/300/090.png/fff'),
    //             ),
    //           ),
    //           const SizedBox(height: 8),
    //           const Center(
    //             child: Text(
    //               "Salman Rasheed",
    //               style: TextStyle(fontFamily: 'Roboto', fontSize: 22),
    //             ),
    //           ),
    //           const Spacer(),
    //           Consumer<ProfileProvider>(
    //             builder: (context, value, child) {
    //               return Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 20),
    //                 child: myButton(
    //                   'Logout',
    //                   () {
    //                     Provider.of<ProfileProvider>(context, listen: false)
    //                         .logOut(context);
    //                   },
    //                   loading: value.isLoading,
    //                 ),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserLoadingState || state is UserInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserErrorState) {
          return Center(child: Text(state.message));
        } else if (state is UserLoggedInState) {
          return userProfile();
        } else {
          return const SizedBox();
        }
      }),
    );
  }

  Widget userProfile() {
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
            const Text(
              "Muhammad Haseeb",
              // style: TextStyles.heading3,
            ),
            const Text(
              "haseeb@gmail.com",
              // style: TextStyles.body1,
            ),
            const SizedBox(height: 5),
            CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const Text("Edit Profile"),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Divider(color: AppColors.text),
        ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.help, color: Colors.green),
          title: const Text("Help"),
        ),
        ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.help, color: Colors.green),
          title: const Text("Privacy Policy"),
        ),
        ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.help, color: Colors.green),
          title: const Text("Terms of Use"),
        ),
        ListTile(
          onTap: () {},
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.settings, color: Colors.green),
          title: const Text("Settings"),
        ),
        ListTile(
          onTap: () {
            BlocProvider.of<UserCubit>(context).signOut();
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
  }
}
