import 'package:cambo_travel_app/constants.dart';
import 'package:cambo_travel_app/pages/sigin_page.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obsecureText = false;
  bool rememberMe = false;

  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: primaryColor,
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
              ),
              Container(
                color: const Color(0xffF6F8FA),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: MediaQuery.of(context).size.width / 2 -
                (MediaQuery.of(context).size.width * 0.4 / 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Text(
                textAlign: TextAlign.center,
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2 -
                (MediaQuery.of(context).size.width * 0.48 / 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const SignInPage();
                        }),
                      );
                    },
                    child: const Text(
                      "LogIn",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 -
                (MediaQuery.of(context).size.width * 0.9 / 2),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.73,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "First Name",
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xffEDF1F3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xffEDF1F3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "2002-06-01",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEDF1F3),
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    readOnly: true, // Prevents keyboard from appearing
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), // Adjust as needed
                        lastDate: DateTime(2101), // Adjust as needed
                      );
                      if (pickedDate != null) {
                        // Format and set the date to the text field
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // Use a controller to set the value of the text field
                        _dateController.text = formattedDate;
                      }
                    },
                    controller: _dateController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "email@gmail.com",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEDF1F3),
                        ),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: IntlPhoneField(
                          decoration: const InputDecoration(
                            hintText: "99 326932",
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xffEDF1F3),
                              ),
                            ),
                          ),
                          initialCountryCode: 'KH',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextField(
                    obscureText: !obsecureText,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffEDF1F3),
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock_outlined),
                      prefixIconColor: Colors.grey,
                      suffixIcon: IconButton(
                        icon: obsecureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignInPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      elevation: 0,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(
                        color: Color(0xffEFF0F6),
                      ),
                      foregroundColor: primaryColor,
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.004,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffEDF1F3),
                            strokeAlign: 1,
                          ),
                        ),
                      ),
                      const Text(
                        "Or",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffEDF1F3),
                            strokeAlign: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(
                        color: Color(0xffEFF0F6),
                      ),
                      foregroundColor: primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
