import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/users/login/login_screen.dart';
import 'screens/users/registration/registration_screen.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: SizedBox(height: MediaQuery.sizeOf(context).height * 0.045,width: MediaQuery.sizeOf(context).width * 0.35, child: Image.asset('assets/images/colorfull_logo.png')),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,

            tabs: const [
              Tab(text: 'Sign in'),
              Tab(text: 'Sign up'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LoginScreen(),
                RegistrationScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
