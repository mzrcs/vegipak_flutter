import 'package:flutter/material.dart';
import 'package:vegipak/app/navigation/profile/widgets/logout_alert.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import '../../custom/annotated_widget.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            settingTileTitle('Account'),
            const SizedBox(height: 12),
            settingTileItem(
              title: 'Reset Password',
              icon: Icons.lock_outline,
              onTap: () {
                Navigator.pushNamed(context, RouteName.updatePassword);
              },
            ),
            settingTileItem(
              title: 'Logout',
              icon: Icons.logout,
              trailing: false,
              onTap: () {
                showDialog(
                  // barrierColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => const LogoutAlertWidget(),
                );
              },
            ),
            const SizedBox(height: 16),
            settingTileTitle('Help & Support'),
            const SizedBox(height: 12),
            settingTileItem(
              title: 'Report a problem',
              icon: Icons.info_outline,
              onTap: () {},
            ),
            settingTileItem(
              title: 'FAQs',
              icon: Icons.question_mark,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget settingTileTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      child: Text(title),
    );
  }

  Widget settingTileItem({
    required VoidCallback onTap,
    required String title,
    required IconData icon,
    bool trailing = true,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(icon, size: 22),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
      ),
      trailing: trailing
          ? const Icon(Icons.arrow_forward_ios_rounded, size: 20)
          : null,
    );
  }
}
