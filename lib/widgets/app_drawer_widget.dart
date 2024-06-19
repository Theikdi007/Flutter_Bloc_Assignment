import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/bloc/navigation_bloc.dart';
import '../helpers/app_constant.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  'Theikdi Nyunt',
                  style: TextStyle(
                    fontSize: FontSize.textSizeLarge,
                    color: MyColor.colorBlueGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text(
              'Category',
              style: TextStyle(
                fontSize: FontSize.textSizeNormal,
                color: MyColor.colorBlueGray,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigateToCategory());
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          const ListTile(
            visualDensity: VisualDensity(vertical: -4),
            title: Text(
              'language',
              style: TextStyle(
                fontSize: FontSize.textSizeLarge,
                color: MyColor.colorBlueGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1,
              color: Colors.black45,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.flag),
            title: Text(
              'Thailand',
              style: TextStyle(
                fontSize: FontSize.textSizeNormal,
                color: MyColor.colorBlueGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.flag),
            title: Text(
              'English',
              style: TextStyle(
                fontSize: FontSize.textSizeNormal,
                color: MyColor.colorBlueGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
