// Copyright 2021 The EmOne team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_cable/settingPage.dart';

import 'devicePage.dart';
import 'projectPage.dart';
import 'readingPage.dart';

void main() => runApp(SmartCableApp());

class SmartCableApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Cable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      home: SmartCableHomePage(
          key: UniqueKey(),
          title: 'Smart Cable Demo Home Page',
          restorationId: "SmartCableHomePage"),
    );
  }
}

class SmartCableHomePage extends StatefulWidget {
  SmartCableHomePage({Key key, this.title, this.restorationId})
      : super(key: key);

  final String title;
  final String restorationId;

  @override
  _SmartCableHomePageState createState() => _SmartCableHomePageState();
}

class _SmartCableHomePageState extends State<SmartCableHomePage>
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  final pageView = <Widget>[
    DevicesPage(),
    readingPage(),
    projectPage(),
    settingPage()
  ];
  int _selectedIndex = 0;

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, "restorationId");
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.app_registration), label: "Devices"),
      BottomNavigationBarItem(icon: const Icon(Icons.search), label: "Reading"),
      BottomNavigationBarItem(
          icon: const Icon(Icons.favorite), label: "Project"),
      BottomNavigationBarItem(
          icon: const Icon(Icons.settings_cell), label: "Setting")
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      backgroundColor: Colors.black,

      body: Container(
          child: PageTransitionSwitcher(
              transitionBuilder: (child, animation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: _NavigationAppBar(
                  key: UniqueKey(),
                  item: bottomNavigationBarItems[_currentIndex.value],
                  widget: pageView[_currentIndex.value]))),

      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
          // Navigator.of(context).push(route)
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.38),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class _NavigationAppBar extends StatelessWidget {
  _NavigationAppBar({Key key, this.item, this.widget}) : super(key: key);

  final BottomNavigationBarItem item;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    switch (this.item.label) {
      case 'Devices':
        return widget;
      case 'Reading':
        return widget;
      case 'Project':
        return widget;
      case 'Setting':
        return widget;
    }
  }
}
