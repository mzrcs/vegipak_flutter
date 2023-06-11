import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'provider/index_navigation.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<NavigationIndex>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getUser();
    });
    return Consumer<NavigationIndex>(
      builder: (context, provider, _) {
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
                          child:
                              const Icon(Icons.shopping_cart_checkout_outlined),
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
      },
    );
  }
}
