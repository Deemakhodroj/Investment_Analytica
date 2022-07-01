import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/profile.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'language_change_provider.dart';
import 'package:investment_analatyca_testthree/screens/login.dart';
import 'package:investment_analatyca_testthree/screens/real_time_data.dart';
import 'package:investment_analatyca_testthree/screens/Articles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocal,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('ar', ''), // Arabic
          ],
          home: const Scaffold(
            body: loginPage(),
          ),
        );
      }),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 1;
  final List<Widget> _children = [
    const MovementAVG(),
    const RealTimeDataPage(),
    const profilePage()
  ];

  void onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  int _selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_selectedItem],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNavBar(Icons.note, 0),
              buildNavBar(Icons.home_filled, 1),
              buildNavBar(Icons.person, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavBar(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(),
        child: SizedBox(
          width: 80,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 3,
            decoration: index == _selectedItem
                ? BoxDecoration(

                    //ternary operation
                    border: const Border(
                      bottom: BorderSide(width: 4, color: Colors.black),
                    ),
                    color:
                        index == _selectedItem ? Colors.white : Colors.white10)
                : const BoxDecoration(),
            child: Icon(
              icon,
              color: index == _selectedItem ? Colors.black87 : Colors.black38,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
