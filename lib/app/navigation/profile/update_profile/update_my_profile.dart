import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/profile_provider.dart';

class UpdateMyProfile extends StatefulWidget {
  const UpdateMyProfile({super.key});

  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfileState();
}

class _UpdateMyProfileState extends State<UpdateMyProfile> {
  // @override
  // void initState() {
  //   getUserData();
  //   super.initState();
  // }

  // void getUserData() async {
  //   final user = Provider.of<ProfileProvider>(context, listen: false);
  //   user.getSavedData(context);
  // }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   ((timeStamp) {
    //     Provider.of<ProfileProvider>(context, listen: false)
    //         .getSavedData(context);
    //   }),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Profile',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, value, _) {
          // print(value.email);
          // log('userEmail ${value.userModel.email}');
          return value.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: [
                        // const Text('Email',
                        //     style: TextStyle(color: Colors.black)),
                        // value.email != null
                        //     ? Text(value.email.toString())
                        //     : const SizedBox(),
                        const SizedBox(height: 12),
                        // name input field
                        profileField(
                          context: context,
                          initialValue: value.userModel.firstName,
                          labelText: 'First',
                          hintText: 'First Name',
                        ),
                        const SizedBox(height: 16),

                        profileField(
                          context: context,
                          initialValue: value.userModel.lastName,
                          labelText: 'Last',
                          hintText: 'Last Name',
                        ),
                        const SizedBox(height: 16),

                        profileField(
                          context: context,
                          initialValue: value.userModel.email,
                          labelText: 'Email',
                          hintText: 'Email Address',
                        ),
                        const SizedBox(height: 16),

                        profileField(
                          context: context,
                          initialValue: value.userModel.phone,
                          labelText: 'Phone',
                          hintText: 'Phone',
                        ),
                        const SizedBox(height: 16),

                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Update'),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget profileField({
    required BuildContext context,
    required String initialValue,
    required String labelText,
    required String hintText,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: (val) =>
          val != null && val.isNotEmpty ? null : 'Required Field',
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        label: Text(
          labelText,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
