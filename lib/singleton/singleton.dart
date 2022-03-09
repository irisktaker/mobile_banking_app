import 'package:flutter/material.dart';
import 'package:mobile_banking_app/models/drawer_data.dart';
import 'package:mobile_banking_app/models/frequently_used.dart';
import 'package:mobile_banking_app/models/payment_card.dart';
import 'package:mobile_banking_app/models/transaction_history.dart';

import '../models/chart_tabs.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<PaymentCard> paymentCard = [
    PaymentCard(
      cardNumber: "**** ****  **** 1690",
      cardName: "Platinum Plus",
      exDate: "01/22",
      cardHolderName: "Sunny Aveiro",
      cardType: "assets/images/visa_card.png",
      cardBGColor: [
        const Color(0xFF1E1D1D),
        const Color(0xFF535353),
      ],
    ),
    PaymentCard(
      cardNumber: "**** ****  **** 7777",
      cardName: "Platinum Plus",
      exDate: "06/23",
      cardHolderName: "Sunny Aveiro",
      cardType: "assets/images/master_card.png",
      cardBGColor: [
        const Color(0xFF312984),
        const Color(0xFF867BF5),
      ],
    ),
    PaymentCard(
      cardNumber: "**** ****  **** 7741",
      cardName: "Platinum Plus",
      exDate: "04/21",
      cardHolderName: "Sunny Aveiro",
      cardType: "assets/images/visa_card.png",
      cardBGColor: [
        const Color(0xFF278181),
        const Color(0xFF71D8D8),
      ],
    ),
  ];

  List<FrequentlyUsed> frequentlyUsed = [
    FrequentlyUsed(
      icon: "assets/icons/phone.png",
      bgColor: const Color(0xFF38D79F).withOpacity(0.08),
      text: "Mobile\nRecharge",
    ),
    FrequentlyUsed(
      icon: "assets/icons/bill_payment.png",
      bgColor: const Color(0xFFFF6E66).withOpacity(0.08),
      text: "Bill\nPayment",
    ),
    FrequentlyUsed(
      icon: "assets/icons/bank_transfer.png",
      bgColor: const Color(0xFFFFC633).withOpacity(0.08),
      text: "Bank\nTransfer",
    ),
    FrequentlyUsed(
      icon: "assets/icons/request_money.png",
      bgColor: const Color(0xFF3642DA).withOpacity(0.08),
      text: "Request\nMoney",
    ),
    FrequentlyUsed(
      icon: "assets/icons/transaction_history.png",
      bgColor: const Color(0xFFDA36CA).withOpacity(0.08),
      text: "Transaction\nHistory",
    ),
  ];

  List<DrawerData> drawerData = [
    DrawerData(
      icon: "assets/icons/statistics.png",
      title: "My Statistics",
    ),
    DrawerData(
      icon: "assets/icons/invitation.png",
      title: "Invite Friends",
    ),
    DrawerData(
      icon: "assets/icons/settings.png",
      title: "Settings",
    ),
    DrawerData(
      icon: "assets/icons/disvover.png",
      title: "Discover",
    ),
    DrawerData(
      icon: "assets/icons/report.png",
      title: "Report",
    ),
    DrawerData(
      icon: "assets/icons/reminder.png",
      title: "Reminder",
    ),
  ];

  List<ChartTabs> chartTabs = [
    ChartTabs(
      calender: "Day",
      isSelected: false,
    ),
    ChartTabs(
      calender: "Month",
      isSelected: true,
    ),
    ChartTabs(
      calender: "Yearly",
      isSelected: false,
    ),
  ];

  List<TransactionHistory> transactionHistory = [
    TransactionHistory(
      moneyTransactionArrow: "assets/icons/recieved_money.png",
      title: "UBER Ride",
      date: "27-Apr",
      time: "08:25pm",
      amount: 574.00,
      statues: "-",
    ),
    TransactionHistory(
      moneyTransactionArrow: "assets/icons/send.png",
      title: "Received Money",
      date: "25-Apr",
      time: "10:50am",
      amount: 2047.00,
      statues: "+",
    ),
    TransactionHistory(
      moneyTransactionArrow: "assets/icons/recieved_money.png",
      title: "Popular Diagonestic ",
      date: "26-Mar",
      time: "11:25am",
      amount: 2076.00,
      statues: "-",
    ),
    TransactionHistory(
      moneyTransactionArrow: "assets/icons/send.png",
      title: "Pizza Hut",
      date: "23-Mar",
      time: "09:50pm",
      amount: 354.00,
      statues: "-",
    ),
  ];
}
