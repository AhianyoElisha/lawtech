import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawtech/Nani/Chat/Chat.dart';
import 'package:lawtech/cubit/app_cubits.dart';
import 'package:lawtech/cubit/app_cubits_states.dart';
import 'package:lawtech/navigation/feeds/feeds.dart';
import 'package:lawtech/navigation/home/home.dart';
import 'package:lawtech/navigation/library/library.dart';
import 'package:lawtech/navigation/qa/q&a_forum.dart';
import 'package:lawtech/navigation/lawyers/search_lawyer.dart';
import 'package:lawtech/navigation/videos/videos.dart';
import 'package:lawtech/widgets/svg_icon.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List pages = [
    const HomePage(),
    const UserFeeds(userId: '1'),
    const ScrollVideosPage(),
    const LibraryPage(),
    const SearchLawyerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubits, CubitStates>(
      listener: (context, state) {
        if (state is SelectedVideoState) {
          setState(() {
            _currentIndex = 2;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message_outlined),
              onPressed: () {
                // Add your onPressed code here!
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
          ],
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (BlocProvider.of<AppCubits>(context).state
                    is SelectedVideoState &&
                _currentIndex == 0) {
              BlocProvider.of<AppCubits>(context).goHome();
            }
          },
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: MySvgIcon(
                  assetName: "icons/apps.svg",
                  assetNameSelected: "icons/apps-dark.svg",
                  isSelected: _currentIndex == 0,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: MySvgIcon(
                  assetName: "icons/comments-question.svg",
                  assetNameSelected: "icons/comments-question-dark.svg",
                  isSelected: _currentIndex == 1,
                ),
                label: "Feeds"),
            BottomNavigationBarItem(
                icon: MySvgIcon(
                  assetName: "icons/film.svg",
                  assetNameSelected: "icons/film-dark.svg",
                  isSelected: _currentIndex == 2,
                ),
                label: "Videos"),
            BottomNavigationBarItem(
                icon: MySvgIcon(
                  assetName: "icons/diary-bookmark-down(2).svg",
                  assetNameSelected: "icons/diary-bookmark-down-dark.svg",
                  isSelected: _currentIndex == 3,
                ),
                label: "Library"),
            BottomNavigationBarItem(
                icon: MySvgIcon(
                  assetName: "icons/gavel.svg",
                  assetNameSelected: "icons/auction.svg",
                  isSelected: _currentIndex == 4,
                ),
                label: "Lawyers"),
          ],
        ),
      ),
    );
  }
}
