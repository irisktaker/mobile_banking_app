import 'package:flutter/material.dart';

import '/singleton/singleton.dart';
import '/widgets/payments_cards.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        centerTitle: true,
        title: const Text(
          "All Cards",
          style: TextStyle(
            fontSize: 17,
            fontFamily: "HK Grotesk",
            fontWeight: FontWeight.w500,
            color: Color(0xFF2F394E),
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
      body: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          itemCount: Singleton.instance.paymentCard.length,
          itemBuilder: (context, index) {
            return Container(
              width: size.width,
              height: 200,
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: PaymentsCards(index: index),
            );
          },
        ),
      ),
    );
  }
}
