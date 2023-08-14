import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/components/no_internet_widget.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
// import '../profile/provider/profile_provider.dart';
// import '../vegitable/provider/product_provider.dart';
import 'provider/index_navigation.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      log('$state');
    } else if (state == AppLifecycleState.inactive) {
      log('$state');
      // Provider.of<ProfileProvider>(context, listen: false).logOut(context);
    } else if (state == AppLifecycleState.detached) {
      log('$state');
    } else if (state == AppLifecycleState.paused) {
      log('$state');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<NavigationIndex>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getGeneralSetting();
      Provider.of<UserProvider>(context, listen: false).getUser();
      Provider.of<NavigationIndex>(context, listen: false).checkInternet();
    });
    return Consumer<NavigationIndex>(
      builder: (context, provider, _) {
        if (provider.connectInternet) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: provider.pages[provider.currentIndex],
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: Colors.white,
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
                  icon: Consumer<CartProvider>(builder: (context, value, _) {
                    return value.totalProductCount == 0
                        ? const Icon(Icons.shopping_cart_checkout_outlined)
                        : Badge(
                            label: Text(value.cartList.length.toString()),
                            child: const Icon(
                                Icons.shopping_cart_checkout_outlined),
                          );
                  }),
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
          );
        } else {
          return NoInternet();
        }
      },
    );
  }
}
