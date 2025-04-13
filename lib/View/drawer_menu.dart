import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xfff5d491),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_2_rounded),
                          title: Text("تبدیل تاریخ"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.settings_rounded),
                          title: Text("تنظیمات"),
                          onTap: () {},
                        ),
                        //
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text("درباره"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
