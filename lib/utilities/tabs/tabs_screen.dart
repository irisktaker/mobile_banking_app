import 'package:flutter/material.dart';

import '/screens/card/card_screen.dart';
import '/screens/chart/chart_screen.dart';
import '/screens/profile/profile_screen.dart';
import '/screens/wallet/wallet_screen.dart';
import '/widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;

  void _selectedTab(int tab) {
    setState(() {
      _selectedTabIndex = tab;
    });
  }

  late List<Map<String, dynamic>> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      {
        'screen': const CardScreen(),
        'title': "Card Screen",
      },
      {
        'screen': const ChartScreen(),
        'title': "Chart Screen",
      },
      {
        'screen': const WalletScreen(),
        'title': "Wallet Screen",
      },
      {
        'screen': const ProfileScreen(),
        'title': "Profile Screen",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: _tabs[_selectedTabIndex]['screen'],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B1F44).withOpacity(0.08),
              offset: const Offset(
                0,
                3,
              ),
              blurRadius: 30,
            ),
          ],
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Colors.white,
          ),
        ),
        child: Center(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF608EE9),
            child: Image.asset(
              "assets/icons/send_money.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btnBarIcon(
                  0,
                  icon: "assets/icons/card.png",
                ),
                btnBarIcon(
                  1,
                  icon: "assets/icons/chart.png",
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                btnBarIcon(
                  2,
                  icon: "assets/icons/wallet.png",
                ),
                btnBarIcon(
                  3,
                  icon: "assets/icons/profile.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btnBarIcon(int index, {required String icon}) {
    return SizedBox(
      height: 50,
      width: 60,
      child: MaterialButton(
        onPressed: () {
          setState(() {
            _selectedTab(index);
          });
        },
        child: Image.asset(
          icon,
          width: 28,
          height: 28,
          color: _selectedTabIndex == index
              ? const Color(0xFF608EE9)
              : const Color(0xFFD4D8E2),
        ),
      ),
    );
  }
}
