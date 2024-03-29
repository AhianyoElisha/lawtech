import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawtech/navigation/home.dart';
import 'package:lawtech/navigation/library.dart';
import 'package:lawtech/navigation/q&a_forum.dart';
import 'package:lawtech/navigation/search_lawyer.dart';
import 'package:lawtech/navigation/videos.dart';
import 'package:lawtech/widgets/svg_icon.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List pages = [
    HomePage(),
    LibraryPage(),
    ScrollVideosPage(),
    SearchLawyerPage(),
    QAForumPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: MySvgIcon(assetName: "icons/apps.svg", assetNameSelected: "icons/apps-dark.svg", isSelected: _currentIndex == 0,), label: "Home"),
          BottomNavigationBarItem(icon: MySvgIcon(assetName: "icons/diary-bookmark-down(2).svg", assetNameSelected: "icons/diary-bookmark-down-dark.svg", isSelected: _currentIndex == 1,), label: "Library"),
          BottomNavigationBarItem(icon: MySvgIcon(assetName: "icons/film.svg", assetNameSelected: "icons/film-dark.svg", isSelected: _currentIndex == 2,), label: "Videos"),
          BottomNavigationBarItem(icon: MySvgIcon(assetName: "icons/gavel.svg", assetNameSelected: "icons/auction.svg", isSelected: _currentIndex == 3,), label: "Lawyers"),
          BottomNavigationBarItem(icon: MySvgIcon(assetName: "icons/comments-question.svg", assetNameSelected: "icons/comments-question-dark.svg", isSelected: _currentIndex == 4,), label: "Q&A"),
        ],
      ),
    );
  }
}
