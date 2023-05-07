import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/logic/cubit/user_cubit/user_cubit.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import '../../logic/cubit/user_cubit/user_state.dart';
import '../../splash/splash_screen.dart';
import 'provider/index_navigation.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationIndex>(context);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<CartProvider>(context, listen: false).getCart(context);
    // });
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOutState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, RouteName.splash);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: provider.pages[provider.currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: provider.currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Vegitables'),
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_cart_checkout_outlined),
              title: const Text('Cart'),
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.file_copy),
              title: const Text('My Order'),
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.people_alt_rounded),
              title: const Text('Profile'),
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ],
          onItemSelected: (index) {
            Provider.of<NavigationIndex>(context, listen: false)
                .bottomNav(index);
          },
        ),
      ),
    );
  }
}
