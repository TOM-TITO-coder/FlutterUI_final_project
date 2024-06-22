import 'package:cambo_travel_app/constants.dart';
import 'package:cambo_travel_app/pages/home_page.dart';
import 'package:cambo_travel_app/pages/sigin_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF7F7F9),
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SignInPage();
                }),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF7F7F9),
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: _buildUI(context),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/images/profile.png",
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            "Ronaldo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "ronaldo@gmail.com",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff7D848D),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          _pointUI(context),
          SizedBox(
            height: size.height * 0.03,
          ),
          _optionSettingUI(context),
        ],
      ),
    );
  }

  Widget _optionSettingUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: size.width,
        height: size.height * 0.38,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Text(
                  "Bookmarked",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.airplane_ticket_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Text(
                  "Previous Trip",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                const Text(
                  "Version",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.2,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pointUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: size.width,
        height: size.height * 0.1,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  "Reward Points",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "360",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
            ),
            const Column(
              children: [
                Text(
                  "Travel Trips",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "238",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
            ),
            const Column(
              children: [
                Text(
                  "Buckets List",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "473",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
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
