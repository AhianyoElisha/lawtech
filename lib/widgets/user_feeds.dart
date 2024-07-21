import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class UserPosts extends StatefulWidget {
  final String profileUrl;
  final String name;
  final String category;
  final String caption;
  final int likes;
  final bool likeStatus;
  final VoidCallback onTap;
  final String postId;
  final String userId;
  final String receiverId;
  final String countComments;
  final String? imageUrl;

  const UserPosts({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.category,
    required this.caption,
    required this.likes,
    required this.likeStatus,
    required this.onTap,
    required this.postId,
    required this.userId,
    required this.receiverId,
    required this.countComments,
    required this.imageUrl,
  });

  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts>
    with SingleTickerProviderStateMixin {
  late int _likes;
  late bool _likeStatus;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _showHeartOverlay = false;
  List<List<dynamic>> finalComments = [];
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
    _likeStatus = widget.likeStatus;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _loadStaticComments();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Widget loadImages() {
    if (widget.imageUrl != null) {
      return Image.network(
        widget.imageUrl!,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Icon(Icons.error);
        },
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'img/lawyer.avif',
        fit: BoxFit.cover,
      );
    }
  }

  void _addComment(String comment) {
    setState(() {
      finalComments.add([
        finalComments.length + 1,
        "User",
        "https://example.com/user.jpg",
        comment,
      ]);
      _commentController.clear();
    });
  }

  void _loadStaticComments() {
    finalComments = [
      [
        1,
        "Alice",
        "https://example.com/alice.jpg",
        "Nice post!",
      ],
      [
        2,
        "Bob",
        "https://example.com/bob.jpg",
        "Great picture!",
      ],
    ];
  }

  void _comments() {
    _showCommentsBottomSheet();
  }

  void _toggleLike() {
    setState(() {
      if (_likeStatus) {
        _likes -= 1;
        _likeStatus = false;
      } else {
        _likes += 1;
        _likeStatus = true;
      }
    });
  }

  void _onDoubleTap() {
    _toggleLike();
    setState(() {
      _showHeartOverlay = true;
    });
    _animationController.forward().then((_) {
      _animationController.reverse().then((_) {
        setState(() {
          _showHeartOverlay = false;
        });
      });
    });
  }

  void _showCommentsBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: finalComments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(finalComments[index][2]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            finalComments[index][1],
                            style: const TextStyle(
                              color: Color.fromRGBO(26, 208, 38, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(finalComments[index][3]),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              textAlign: TextAlign.justify,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: 'Add comment here',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF6A1B9A)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () =>
                                _addComment(_commentController.text),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: widget.profileUrl.isNotEmpty
                      ? NetworkImage(widget.profileUrl)
                      : const AssetImage('img/profile_picture.jpg')
                          as ImageProvider,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "1d",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to messaging page
                  },
                  child: const Icon(Icons.more_vert),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onDoubleTap: _onDoubleTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.grey[200],
                    child: loadImages(),
                  ),
                  if (_showHeartOverlay)
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: const Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                        size: 100,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: _toggleLike,
                  child: Icon(
                    _likeStatus
                        ? Icons.thumb_up_alt
                        : Icons.thumb_up_alt_outlined,
                    color: _likeStatus ? Colors.blue : Colors.grey,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  _likes.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: _comments,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.comment_outlined,
                        color: Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.countComments,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Icon(
                    Icons.share,
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ExpandableText(
              widget.caption,
              expandText: 'more',
              collapseText: 'less',
              maxLines: 2,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _comments,
              child: Text(
                'View all ${widget.countComments} comments',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
