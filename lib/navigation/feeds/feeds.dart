import 'package:flutter/material.dart';
import '../../widgets/category_bubble.dart';
import '../../widgets/user_feeds.dart';
import 'image_picker.dart';

class UserFeeds extends StatefulWidget {
  final String userId;
  const UserFeeds({super.key, required this.userId});

  @override
  State<UserFeeds> createState() => _UserFeedsState();
}

final List icons = [
  ['Men & Women Beauty', Icons.person, 1],
  ['Health & Wellness', Icons.person, 2],
  ['Education & Learning', Icons.person, 3],
  ['Technology & IT', Icons.person, 4],
  ['Professional', Icons.person, 5],
  ['Creative & Designs', Icons.person, 6],
  ['Home & Lifestyle', Icons.person, 7],
  ['Hospitality & Travel', Icons.person, 8],
  ['Retail & E-commerce', Icons.person, 9],
  ['Financial & Banking', Icons.person, 10],
  ['Entertainment & Leisure', Icons.person, 11],
  ['Others', Icons.person, 12]
];

class _UserFeedsState extends State<UserFeeds> {
  String selectedCategoryId = '';

  final List<Map<String, dynamic>> categories = [
    {'id': '1', 'name': 'Hon. Dabo'},
    {'id': '2', 'name': 'Kofi ka'},
    {'id': '3', 'name': 'Ama Teeh'},
    {'id': '4', 'name': 'Hon. Kanank'},
    {'id': '5', 'name': 'Hon. Eunice'},
    {'id': '6', 'name': 'Judge Koboo'},
    {'id': '7', 'name': 'BinBah'},
    {'id': '8', 'name': 'Hon. Wale'},
    {'id': '9', 'name': 'Hon. Asake'},
    {'id': '10', 'name': 'Hon. Vincent'},
    {'id': '11', 'name': 'Kwame Keame'},
    {'id': '12', 'name': 'Others'}
  ];

  final List<Map<String, dynamic>> userPosts = [
    {
      'profileUrl': 'https://example.com/profile1.jpg',
      'name': 'John Doe',
      'category': 'Technology & IT',
      'caption': 'Working on a new project!',
      'likes': 123,
      'imageUrl': null,
      'postId': '1',
      'receiverId': '2',
      'likeStatus': true,
      'countComments': '4',
    },
    {
      'profileUrl': 'https://example.com/profile2.jpg',
      'name': 'Jane Smith',
      'category': 'Health & Wellness',
      'caption': 'Starting my day with yoga.',
      'likes': 87,
      'imageUrl': null,
      'postId': '2',
      'receiverId': '3',
      'likeStatus': false,
      'countComments': '2',
    },
  ];

  void addServicePost() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => AddServicePost(
    //               userId: widget.userId,
    //             )));
  }

  void handleCategoryTap(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   automaticallyImplyLeading: false,
          //   floating: true,
          //   snap: true,
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: GestureDetector(
          //         onTap: addServicePost,
          //         child: const Icon(
          //           Icons.add_to_photos_outlined,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(right: 16.0),
          //       child:
          //           Icon(Icons.notification_add_outlined, color: Colors.black),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(right: 16.0),
          //       child: GestureDetector(
          //         // onTap: () => Navigator.push(
          //         //     context,
          //         //     MaterialPageRoute(
          //         //         builder: (context) => MessagingPage(
          //         //               userId: widget.userId,
          //         //               receiverId: '2',
          //         //               receiverName: 'Chris_Idan',
          //         //             ))),
          //         child: const Icon(
          //           Icons.chat_bubble_outline_rounded,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          // Categories
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final categoryId = categories[index]['id'];
                  final categoryName = categories[index]['name'];
                  final iconData = icons.firstWhere(
                      (icon) => icon[0] == categoryName,
                      orElse: () => [null, Icons.help, null])[1];
                  return BubbleCategories(
                    iconData: iconData,
                    text: categoryName,
                    shadowColor: Colors.green,
                    colorData: Color(0xFF2E7D32),
                    categoryId: categoryId,
                    isSelected: selectedCategoryId == categoryId,
                    onTap: () {
                      handleCategoryTap(categoryId);
                    },
                  );
                },
              ),
            ),
          ),
          // User posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final post = userPosts[index];
                return UserPosts(
                  profileUrl: post['profileUrl'],
                  name: post['name'],
                  category: post['category'],
                  caption: post['caption'],
                  likes: post['likes'],
                  imageUrl: post['imageUrl'],
                  onTap: () {
                    // Implement your action here
                  },
                  postId: post['postId'],
                  userId: widget.userId,
                  receiverId: post['receiverId'],
                  likeStatus: post['likeStatus'],
                  countComments: post['countComments'],
                );
              },
              childCount: userPosts.length,
            ),
          ),
        ],
      ),
    );
  }
}
