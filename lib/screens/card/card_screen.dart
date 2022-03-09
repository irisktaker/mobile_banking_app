import 'package:flutter/material.dart';

import '/widgets/payments_cards.dart';
import '/singleton/singleton.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.90);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
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
        body: ListView(
          children: [
            Container(
              width: size.width,
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: PageView.builder(
                pageSnapping: true,
                controller: pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemCount: Singleton.instance.paymentCard.length,
                itemBuilder: (context, index) {
                  bool active = index == currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                    margin: active
                        ? const EdgeInsets.symmetric(horizontal: 7)
                        : const EdgeInsets.only(
                            top: 34,
                            right: 7,
                            left: 7,
                          ),
                    child: PaymentsCards(
                      index: index,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 152,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Frequently Used ",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "HK Grotesk",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F394E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 111,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Singleton.instance.frequentlyUsed.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 14),
                                  Container(
                                    width: 67,
                                    height: 67,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Singleton.instance
                                          .frequentlyUsed[index].bgColor,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        Singleton.instance.frequentlyUsed[index]
                                            .icon,
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Singleton.instance.frequentlyUsed[index].text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "HK Grotesk",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F394E),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Service",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "HK Grotesk",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2F394E),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  serviceCard(
                    icon: "assets/icons/open_account.png",
                    txt: "Open Account",
                    color: const Color(0xFFFDEEEA),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  serviceCard(
                    icon: "assets/icons/manage_card.png",
                    txt: "Manage Card",
                    color: const Color(0xFFE4F3F4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard({
    required String icon,
    required String txt,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        height: 115,
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: color,
                image: DecorationImage(
                  image: AssetImage(
                    icon,
                  ),
                  scale: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              txt,
              style: const TextStyle(
                fontSize: 17,
                fontFamily: "HK Grotesk",
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F394E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
