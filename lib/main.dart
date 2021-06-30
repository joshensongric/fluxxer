import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:fluxtogether/splash/splash_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'list_events/list_events_widget.dart';
import 'flex_bot/flex_bot_widget.dart';
import 'money/money_widget.dart';
import 'all_chats/all_chats_widget.dart';
import 'account/account_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<FluxtogetherFirebaseUser> userStream;
  FluxtogetherFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = fluxtogetherFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluxtogether',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Center(
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/FT Splash Screen.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : SplashWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Account';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'ListEvents': ListEventsWidget(),
      'FlexBot': FlexBotWidget(),
      'Money': MoneyWidget(),
      'AllChats': AllChatsWidget(),
      'Account': AccountWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_rounded,
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color(0xFF9E9E9E),
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
              size: 32,
            ),
            label: 'Money',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 24,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 24,
            ),
            label: 'Home',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF16CB79),
        unselectedItemColor: Color(0xFF070C0B),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
