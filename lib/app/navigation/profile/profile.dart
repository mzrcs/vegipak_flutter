import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';

import '../../utils/routes/routes_name.dart';
import '../navigation_bar/provider/index_navigation.dart';
// import 'package:vegipak/app/navigation/profile/provider/profile_provider.dart';
// import 'package:vegipak/app/utils/routes/routes_name.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    Provider.of<NavigationIndex>(context, listen: false).checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.profileSetting);
            },
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return Consumer<UserProvider>(
      builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: MyColors.kGreenColor,
                  child: Text(
                    value.fullName != null ? value.fullName![0] : 'V',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                value.fullName != null ? value.fullName! : 'Abc',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value.email != null ? value.email! : 'email@gmail.com',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.editMyProfile);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.kGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
