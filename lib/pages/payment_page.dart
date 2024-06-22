import 'package:cambo_travel_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

// Define an enum
enum Options { option1, option2, option3, option4, option5 }

class _PaymentPageState extends State<PaymentPage> {
  Options _groupValue = Options.option1;

  void _handleRadioValueChange(Options? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Options",
          style: TextStyle(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildUI(context),
        ),
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: const Color(0xfffafafa),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\$27.99",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "View detial bill",
                style: TextStyle(
                  color: Color(0xff2095FD),
                  fontSize: 14,
                ),
              )
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color(0xff2563EB),
              ),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
              ),
            ),
            child: const Text(
              "Proceed to Pay",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryCard(context),
          SizedBox(
            height: size.height * 0.02,
          ),
          _offerContainer(context),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Text(
            "UPI",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: size.height * 0.012,
          ),
          _walletContainer(context),
          SizedBox(
            height: size.height * 0.012,
          ),
          const Text(
            "Credit & Debit Cards",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: size.height * 0.012,
          ),
          _creditContainer(context),
          SizedBox(
            height: size.height * 0.012,
          ),
          const Text(
            "More Payment Options",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: size.height * 0.012,
          ),
          _optionPayment(context),
        ],
      ),
    );
  }

  Widget _optionPayment(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/wallet-3.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Wallet",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/bank.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Net Banking",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/cash.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _creditContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logos_mastercard.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Axis Bank **** **** **** 8395",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Radio(
                  value: Options.option4,
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Image.asset(
                    "assets/images/logos_visa.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "HDFC Bank **** **** **** 6246",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Radio(
                  value: Options.option5,
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    //fixedSize: const Size(24, 24),
                    backgroundColor: Color(0xffD2EAFF),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              const Text(
                "Add New UPI ID",
                style: TextStyle(
                  color: Color(0xff606060),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _walletContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/telegram_pay.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Telegram Wallet",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Radio(
                  value: Options.option3,
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/binance_icon.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Telegram Wallet",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Radio(
                  value: Options.option1,
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.06,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffF5F5F5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/google_pay_icons.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                const Text(
                  "Telegram Wallet",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Radio(
                  value: Options.option2,
                  groupValue: _groupValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    //fixedSize: const Size(24, 24),
                    backgroundColor: Color(0xffD2EAFF),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              const Text(
                "Add New UPI ID",
                style: TextStyle(
                  color: Color(0xff606060),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _offerContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.07,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.airplane_ticket_outlined,
            color: Colors.blue,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          const Text(
            "Offers",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget _summaryCard(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Small Group Tour in Siem Reap",
              style: TextStyle(
                color: Color(0xff606060),
                fontSize: 12,
              ),
            ),
            const Text(
              "Tuk Tuk Siem Reap",
              style: TextStyle(
                color: Color(0xff606060),
                fontSize: 12,
              ),
            ),
            const Text(
              "7:00am to 5:00pm",
              style: TextStyle(
                color: Color(0xff606060),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Color(0xff606060),
                ),
                Text(
                  "Champey Siem Reap Hotel, St168, Siem Reap",
                  style: TextStyle(
                    color: Color(0xff606060),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$27.99",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
