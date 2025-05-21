import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';

class BottomNavigation extends StatelessWidget {
  final int activeIndex;

  const BottomNavigation({
    super.key,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.homeScreen,
                (params) => false,
              );
              break;
            }
          case 1:
            {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.categories,
                (params) => false,
              );
              break;
            }
          case 2:
            {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.cart,
                (params) => false,
              );
              break;
            }
          case 3:
            {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.favourite,
                (params) => false,
              );
              break;
            }
          case 4:
            {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.profile,
                (params) => false,
              );
              break;
            }
          default:
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home', //0
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store_outlined),
          label: 'Shop', //1
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Bag', //2
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favourite', //3
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile', //4
        ),
      ],
    );
  }
}
