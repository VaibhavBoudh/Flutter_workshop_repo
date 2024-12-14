import 'package:book_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Drawer Logo
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // shop tile
              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),

              // cart tile
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart_checkout,
                  onTap: () {
                    // pop the drawer first
                    Navigator.pop(context);

                    // go to specified page
                    Navigator.pushNamed(context, '/cart_page');
                  }),
              // AI tile
              MyListTile(
                  text: "ChatBot",
                  icon: Icons.computer_outlined,
                  onTap: () {
                    // pop the drawer first
                    Navigator.pop(context);

                    // got to specified page
                    Navigator.pushNamed(context, '/chat_page');
                  }),
            ],
          ),
          // exit
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: MyListTile(
                text: "Exit",
                icon: Icons.logout,
                onTap: () {
                  // pop the drawer first
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/intro_page');
                }),
          ),
        ],
      ),
    );
  }
}
