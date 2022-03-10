import 'package:flutter/material.dart';
import 'dart:math' as math;

import '/singleton/singleton.dart';
import '/widgets/payments_cards.dart';
import '/models/payment_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late String cardNumber;
  late String cardName;
  late String exDate;
  late String cardHolderName;
  String cardType = "assets/images/visa_card.png";
  List<Color> cardBGColor = [
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ];
  void deletePaymentCard(
    String cardNumber,
    String cardName,
    String exDate,
    String cardHolderName,
    String cardType,
    List<Color> cardBGColor,
  ) {
    Singleton.instance.paymentCard.add(
      PaymentCard(
        cardNumber: cardNumber,
        cardName: cardName,
        exDate: exDate,
        cardHolderName: cardHolderName,
        cardType: cardType,
        cardBGColor: cardBGColor,
      ),
    );
  }

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
              margin: const EdgeInsets.only(bottom: 16),
              child: MaterialButton(
                  onPressed: () {
                    print("CLICKED");
                  },
                  onLongPress: () {
                    print("LONG PRESS");
                    setState(() {
                      deletePaymentCard(
                        cardNumber,
                        cardName,
                        exDate,
                        cardHolderName,
                        cardType,
                        cardBGColor,
                      );
                      print("Clicked");
                    });
                  },
                  child: PaymentsCards(index: index)),
            );
          },
        ),
      ),
    );
  }
}
