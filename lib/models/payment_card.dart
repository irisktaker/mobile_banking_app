import 'package:flutter/material.dart';

class PaymentCard {
  String bankLogo;
  String bankName;
  String cardNumber;
  String cardName;
  String exDate;
  String cardHolderName;
  String cardType;
  List<Color> cardBGColor;

  PaymentCard({
    this.bankLogo = "assets/images/bank_logo.png",
    this.bankName = "Dutch Bangla Bank",
    required this.cardNumber,
    required this.cardName,
    required this.exDate,
    required this.cardHolderName,
    required this.cardType,
    required this.cardBGColor,
});
}