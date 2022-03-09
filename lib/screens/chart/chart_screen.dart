import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../singleton/singleton.dart';
import '../../utilities/linear_chart/linear_chart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  double balance = 3567.12;
  NumberFormat formatter = NumberFormat('#,##,000.00');
  int selectedCalenderTab = 1;

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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        child: ListView(
          children: [
            Container(
              height: 110,
              width: size.width,
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFE7F3FF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Current Balance",
                    style: TextStyle(
                      fontFamily: "HK Grotesk",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF608EE9),
                    ),
                  ),
                  Text(
                    "\$${formatter.format(balance)}",
                    style: const TextStyle(
                      fontFamily: "HK Grotesk",
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF608EE9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: size.width,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(42),
                color: const Color(0xFFFFFFFF),
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
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: (size.width / 3) - 16,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Singleton.instance.chartTabs[index].isSelected
                          ? Singleton.instance.chartTabs[index].color
                          : const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (selectedCalenderTab == index) {
                            Singleton.instance.chartTabs[index].isSelected =
                                !Singleton.instance.chartTabs[index].isSelected;
                          } else {
                            selectedCalenderTab = index;

                            for (var calenderTab
                                in Singleton.instance.chartTabs) {
                              calenderTab.isSelected = false;
                            }

                            Singleton.instance.chartTabs[index].isSelected =
                                !Singleton.instance.chartTabs[index].isSelected;
                          }
                        });
                      },
                      child: Text(
                        Singleton.instance.chartTabs[index].calender,
                        style: TextStyle(
                          color: Singleton.instance.chartTabs[index].isSelected
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFA4ADBD),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: 219,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: LineChartSample(),
            ),
          ],
        ),
      ),
    );
  }
}
