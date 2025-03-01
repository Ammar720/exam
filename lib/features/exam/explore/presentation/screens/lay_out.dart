import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/auth/login/presentation/view/screens/login.dart';
import 'package:exam/features/auth/register/presentation/screens/register_screen.dart';
import 'package:exam/features/exam/explore/presentation/screens/survay.dart';
import 'package:flutter/material.dart';

class LayOut extends StatefulWidget {
  static const String routeName = '/layout';
  const LayOut({super.key});

  @override
  State<LayOut> createState() => _SurveyState();
}

class _SurveyState extends State<LayOut> {
  int selectedindex = 0;

  List<Widget> screens = [
    const Survay(),
    const RegisterScreen(),
    const Login()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.lightBlue,
          selectedItemColor: AppTheme.blue,
          unselectedItemColor: const Color(0xFF878787),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_document), label: "Result"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: "Profile")
          ],
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          }),
    );
  }
}
