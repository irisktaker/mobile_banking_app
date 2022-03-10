import 'package:flutter/material.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController cardholderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardTypeController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cardholderNameController.dispose();
    cardNumberController.dispose();
    cardTypeController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF2F394E),
              size: 20,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Add New Card",
            style: TextStyle(
              fontSize: 17,
              fontFamily: "HK Grotesk",
              fontWeight: FontWeight.w500,
              color: Color(0xFF2F394E),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/icons/new_card_page_logo.png",
                ),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "HK Grotesk",
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2F394E),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextFormField(
                        title: "Cardholder Name",
                        hintText: "John Doe",
                        controller: cardholderNameController,
                        keyboardType: TextInputType.name,
                      ),
                      customTextFormField(
                        title: "Card Number",
                        hintText: "XXXX XXXX XXXX XXXX",
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                      ),
                      customTextFormField(
                        title: "Card Type",
                        hintText: "Choose one",
                        controller: cardTypeController,
                        keyboardType: TextInputType.text,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: customTextFormField(
                              title: "Expiry",
                              hintText: "MM/YY",
                              controller: expiryController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Expanded(
                            child: customTextFormField(
                              title: "CCV",
                              hintText: "XXX",
                              controller: cvvController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    print(cardholderNameController.text);
                    print(cardNumberController.text);
                    print(cardTypeController.text);
                    print(expiryController.text);
                    print(cvvController.text);
                  },
                  onLongPress: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF608EE9),
                    onPrimary: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "Add Card",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextFormField({
    required String title,
    required String hintText,
    required TextEditingController? controller,
    required TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 6),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontFamily: "HK Grotesk",
                fontWeight: FontWeight.w400,
                color: Color(0xFFC3C7E5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFC3C7E5),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFC3C7E5),
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFC3C7E5),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
