import 'package:cambo_travel_app/constants.dart';
import 'package:cambo_travel_app/data.dart';
import 'package:cambo_travel_app/models/plan.dart';
import 'package:cambo_travel_app/pages/home_page.dart';
import 'package:cambo_travel_app/pages/widgets/card_plan.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
          "Scedule",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return const SignInPage();
              //   }),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF7F7F9),
                ),
                child: const Icon(
                  Icons.notifications_active_outlined,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: _buildUI(context)),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _tableCalendarUI(context),
          SizedBox(
            height: size.height * 0.012,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Schedule",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.012,
          ),
          _listPlanUI(context),
        ],
      ),
    );
  }

  Widget _listPlanUI(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.5,
      child: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          Plan plan = plans[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: CardPlan(
              title: plan.title,
              location: plan.location,
              urlImg: plan.urlImg,
              datePlan: plan.datePlan,
            ),
          );
        },
      ),
    );
  }

  Widget _tableCalendarUI(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.2,
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
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.week,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(color: Colors.white),
          selectedTextStyle: TextStyle(color: Colors.white),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.black),
          weekdayStyle: TextStyle(color: Colors.black),
          decoration: BoxDecoration(
            border: Border(),
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
      ),
    );
  }
}
