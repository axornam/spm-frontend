import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:studentprojectmanager/util/dialogs.dart';
import 'package:studentprojectmanager/views/home/home.dart';
import 'package:studentprojectmanager/views/profile/profile.dart';
import 'package:studentprojectmanager/views/search/search_page.dart';

import '../util/router.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Dialogs().showExitDialog(context),
      child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: onPageChanged,
            children: <Widget>[
              Home(),
              // Explore(),
              Profile(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.grey[500],
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Feather.home),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Feather.compass),
              //   label: 'Explore',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Feather.settings),
                label: 'Settings',
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {MyRouter.pushPage(context, SearchPage())},
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
