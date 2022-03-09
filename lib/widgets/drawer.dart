import 'package:flutter/material.dart';
import 'package:mobile_banking_app/singleton/singleton.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 190,
            width: size.width,
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 40,
              bottom: 30,
            ),
            color: const Color(0xFF313353),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=717&q=80",
                        scale: 1.6,
                      ),
                      radius: 30,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sunny Aveiro",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: "HK Grotesk",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "arifulisunny@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "HK Grotesk",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: Singleton.instance.drawerData.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 48,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Image.asset(
                              Singleton.instance.drawerData[index].icon,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Text(
                              Singleton.instance.drawerData[index].title,
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
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 60, right: 24, bottom: 15),
                      child: Divider(),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
