import 'package:cambo_travel_app/data.dart';
import 'package:cambo_travel_app/models/product.dart';
import 'package:cambo_travel_app/pages/calendar_page.dart';
import 'package:cambo_travel_app/pages/detail_page.dart';
import 'package:cambo_travel_app/pages/favorite_page.dart';
import 'package:cambo_travel_app/pages/profile_page.dart';
import 'package:cambo_travel_app/pages/widgets/card_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  static const List _pages = [
    HomePageUI(),
    CalendarPage(),
    HomePageUI(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: _pages[_selectIndex],
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: "home"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined), label: "Calendar"),
        BottomNavigationBarItem(
          icon: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2563EB),
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          label: "",
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "Favorite"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildUI(context),
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
          _header(context),
          SizedBox(
            height: size.height * 0.013,
          ),
          const Text(
            "Explore the",
            style: TextStyle(
              fontSize: 38,
            ),
          ),
          const Text.rich(
            TextSpan(
              text: "Beautiful",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "\tWorld",
                  style: TextStyle(
                    color: Color(0xff2563EB),
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Destination",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          _listCard(context),
        ],
      ),
    );
  }

  Widget _listCard(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height * 0.48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(title: product.title, urlImg: product.urlImg);
              }));
            },
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(right: 10),
              child: CardProduct(
                title: product.title,
                location: product.location,
                rate: product.rate,
                urlImg: product.urlImg,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _header(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.4,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xffF7F7F9),
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 20,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              const Text(
                "Ronaldo",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF7F7F9),
          ),
          child: const Icon(Icons.notifications_on_outlined),
        )
      ],
    );
  }
}
