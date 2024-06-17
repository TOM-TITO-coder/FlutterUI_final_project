import 'package:cambo_travel_app/constants.dart';
import 'package:cambo_travel_app/pages/sigup_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obsecureText = false;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 90,
            left: MediaQuery.of(context).size.width / 2 - 16,
            child: const Column(
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 32,
                  height: 32,
                ),
              ],
            ),
          ),
          Positioned(
            top: 100.0 + 32.0,
            left: MediaQuery.of(context).size.width / 2 - 111,
            child: const SizedBox(
              width: 221,
              child: Text(
                textAlign: TextAlign.center,
                "Sign In to your Account",
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
            top: 100.0 + 32.0 + 100,
            left: MediaQuery.of(context).size.width / 2 - 111,
            child: const Text(
              "Enter your email and password to log in",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Positioned(
            top: 100 + 32 + 100 + 30,
            left: MediaQuery.of(context).size.width / 2 -
                (MediaQuery.of(context).size.width * 0.9 / 2),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.55,
              padding: const EdgeInsets.all(24),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffEDF1F3),
                            strokeAlign: 1,
                          ),
                        ),
                      ),
                      const Text(
                        "or login with",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        width: 100,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              rememberMe = value!;
                            },
                          );
                        },
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6C7278),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
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
                      "LogIn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignUpPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
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
