import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:vegipak/screens/all_vegitables.dart';
import 'package:vegipak/screens/my_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int totalItems = 0;
  late Widget _screen;
  void onCartChange(totalItems) {
    setState(() {
      totalItems = totalItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        _screen = AllVegitables(
          onCartChange: (itemsCount) {
            setState(() {
              totalItems = itemsCount;
            });
          },
        );
        break;
      case 1:
        _screen = MyCartScreen(onCartChange: (itemsCount) {
          setState(() {
            totalItems = itemsCount;
          });
        });
        break;
      case 2:
        // _screen = const MyOrders();
        break;
      case 3:
        // _screen = const MyProfile();
        break;
      default:
        _screen = AllVegitables(onCartChange: (itemsCount) {
          setState(() {
            totalItems = itemsCount;
          });
        });
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screen,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Vegitables'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:
                //  totalItems > 0
                //     ? Badge(
                //         position: BadgePosition.topEnd(top: -20),
                //         badgeContent: Text(
                //           '$totalItems',
                //           style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold),
                //         ),
                //         child: const Icon(Icons.shopping_cart_checkout_outlined),
                //       )
                //     :
                const Icon(Icons.shopping_cart_checkout_outlined),
            title: const Text('Cart'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.file_copy),
            title: const Text(
              'My Orders',
            ),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people_alt_rounded),
            title: const Text('Profile'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
