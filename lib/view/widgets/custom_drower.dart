import 'package:cocking_time/constant.dart';
import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:cocking_time/view/screens/about_us_screen.dart';
import 'package:cocking_time/view/screens/category_screen.dart';
import 'package:cocking_time/view/screens/favorites_screen.dart';
import 'package:cocking_time/view/screens/home_screen.dart';
import 'package:cocking_time/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Coocking Time',
                style: googleStyle(context),
                // style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.grey[400]
                  : Colors.white,
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: SettingsCubit.get(context).switchValue
                    ? Colors.grey[400]
                    : Colors.white),
            title: Text(
              'Home Page',
              style: googleStyleSmall(context),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: SettingsCubit.get(context).switchValue
                    ? Colors.grey[400]
                    : Colors.white),
            title: Text(
              'Category',
              style: googleStyleSmall(context),
            ),
            leading: Icon(
              Icons.fastfood,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.grey[400]
                  : Colors.white,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, CategoryScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.grey[400]
                  : Colors.white,
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: SettingsCubit.get(context).switchValue
                    ? Colors.grey[400]
                    : Colors.white),
            title: Text(
              'Favorites',
              style: googleStyleSmall(context),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, FavoritesScreen.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: SettingsCubit.get(context).switchValue
                    ? Colors.grey[400]
                    : Colors.white),
            title: Text(
              'Settings',
              style: googleStyleSmall(context),
            ),
            leading: Icon(
              Icons.settings,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.grey[400]
                  : Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(context, SettingaScreen.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.0,
                color: SettingsCubit.get(context).switchValue
                    ? Colors.grey[400]
                    : Colors.white),
            title: Text(
              'About Us',
              style: googleStyleSmall(context),
            ),
            leading: Icon(
              Icons.info,
              color: SettingsCubit.get(context).switchValue
                  ? Colors.grey[400]
                  : Colors.white,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, AboutUsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
