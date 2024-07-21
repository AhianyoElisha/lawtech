// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'add_feeds.dart';

// class AddServicePost extends StatefulWidget {
//   final String userId;
//   const AddServicePost({super.key, required this.userId});

//   @override
//   State<AddServicePost> createState() => _AddServicePostState();
// }

// class _AddServicePostState extends State<AddServicePost> {
//   File? _image;
//   final TextEditingController _captionController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => pickImage());
//   }

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }

//   void _navigateToNextPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             NextPage(image: _image, caption: _captionController.text),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Post',
//             style: TextStyle(
//                 color: Colors.purple[800],
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.purple[800]),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: _navigateToNextPage,
//             child: Text(
//               'Next',
//               style: TextStyle(
//                   color: Colors.purple[800],
//                   fontWeight: FontWeight.w500,
//                   fontSize: 18),
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   width: double.infinity,
//                   color: Colors.grey[100],
//                   child: _image == null
//                       ? Center(child: Text('No image selected.'))
//                       : Image.file(_image!, fit: BoxFit.contain),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _captionController,
//                   decoration: InputDecoration(
//                     hintText: 'Write a caption...',
//                     border: InputBorder.none,
//                   ),
//                   maxLines: null,
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 80,
//             right: 20,
//             child: FloatingActionButton(
//               onPressed: pickImage,
//               child: Icon(
//                 Icons.add_a_photo_outlined,
//                 color: Colors.white,
//               ),
//               backgroundColor: Colors.purple[300],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
