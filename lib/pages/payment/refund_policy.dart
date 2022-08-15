import 'package:flutter/material.dart';

class RefundPolicy extends StatefulWidget {
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  State<RefundPolicy> createState() => _RefundPolicyState();
}

class _RefundPolicyState extends State<RefundPolicy> {
  Widget faqList(String title, String description) {
    return ListTile(title: Text(title), subtitle: Text(description));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Text(
              "Refund Policy",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          faqList("Can a transaction be refunded?",
              "The monthly rent payments once paid will not be refunded through the system. However, you can contact our finance team to execute any adjustments if required."),
          faqList("Can we cancel online payment?",
              "Online payments once done will not be refunded. Any adjustments required shall be done by our finance/contracts management team from backend upon request from the customer."),
          faqList("Can I get my bank to refund a payment?",
              "You can contact KMRL finance team for adjustments in case the payments are successful. In case of failed payments and amount debited from your account, the amount will be refunded by payment gateway side."),
          faqList("How can I get refund from payment gateway?",
              "Refund for failed payments if the amount debited from your bank account will be done by payment gateway. For other concerns you may contact KMRL finance team or contracts management team")
        ],
      ),
    );
  }
}
