import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Screens/ExploreFolder/add_card.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class PaymentMethodProfile extends StatefulWidget {
  const PaymentMethodProfile({super.key});

  @override
  State<PaymentMethodProfile> createState() => _PaymentMethodProfileState();
}

class _PaymentMethodProfileState extends State<PaymentMethodProfile> {
  String selectedMethod = "Cash";

  Widget paymentTile({
    required String title,
    required IconData icon,
    required String value,
    bool isRadio = true,
    bool hasArrow = false,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    final isSelected = selectedMethod == value;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
        if (isRadio) setState(() => selectedMethod = value);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3, top: 4),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.teal),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
            if (hasArrow)
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
            else
              Radio<String>(
                value: value,
                groupValue: selectedMethod,
                onChanged: (_) => setState(() => selectedMethod = value),
                activeColor: const Color(0xFF4F8C78),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
        leading: LeadingAppBar(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
        
                const Text(
                  "Credit & Debit Card",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                paymentTile(
                  title: "Add Card",
                  icon: Icons.credit_card,
                  value: "Card",
                  hasArrow: true,
                  isRadio: false,
                  onTap: () {
         
                    print("Navigate to Add Card");
                  },
                ),
                const SizedBox(height: 12),

                const Text(
                  "More Payment Options",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                paymentTile(
                  title: "Paypal",
                  icon: Icons.account_balance, 
                  value: "Paypal",
                  iconColor: Colors.blue,
                ),
                paymentTile(
                  title: "Apple Pay",
                  icon: Icons.apple, 
                  value: "ApplePay",
                  iconColor: Colors.black,
                ),
                paymentTile(
                  title: "Google Pay",
                  icon: Icons.payment,
                  value: "GooglePay",
                  iconColor: Colors.red,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height / 7,
              width: Get.width,
              decoration: BoxDecoration(
                color: tertiaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(AddCard());
                  },
                  child: AppButton(title: "Confirm Payment"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
