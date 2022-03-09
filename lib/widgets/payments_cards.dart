// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '/singleton/singleton.dart';

class PaymentsCards extends StatelessWidget {
  int index;

  PaymentsCards({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: active,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: Singleton.instance.paymentCard[index].cardBGColor,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        image: const DecorationImage(
          image: AssetImage("assets/images/visa_card.png"),
          opacity: 0.2,
          alignment: Alignment.topRight,
          scale: 0.6,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                Singleton.instance.paymentCard[index].bankLogo,
                width: 24,
                height: 25,
              ),
              const SizedBox(width: 8),
              Text(
                Singleton.instance.paymentCard[index].bankName,
                style: const TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontFamily: "HK Grotesk",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            Singleton.instance.paymentCard[index].cardNumber,
            style: const TextStyle(
              color: Color(0xFFFEFEFE),
              fontFamily: "HK Grotesk",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            Singleton.instance.paymentCard[index].cardName,
            style: const TextStyle(
              color: Color(0xFFFEFEFE),
              fontFamily: "HK Grotesk",
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exp ${Singleton.instance.paymentCard[index].exDate}",
                style: const TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontFamily: "HK Grotesk",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              Image.asset(
                Singleton.instance.paymentCard[index].cardType,
                width: 53,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
