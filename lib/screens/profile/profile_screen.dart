import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: MaterialButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          child: Image.asset(
            "assets/icons/menu.png",
            scale: 2,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            minWidth: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: Image.asset(
                "assets/icons/notification.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
