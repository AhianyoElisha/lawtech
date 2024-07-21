// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// // import 'package:mime/mime.dart';

// class NextPage extends StatelessWidget {
//   final File? image;
//   final String caption;

//   const NextPage({Key? key, required this.image, required this.caption})
//       : super(key: key);

//   Future<void> addPost() async {
//     const apiUrl = 'https://servipac-production.up.railway.app/api/addPost/';

//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//         ..fields['caption'] = caption
//         ..fields['service_id'] = '4';

//       if (image != null) {
//         var mimeType = lookupMimeType(image!.path);
//         var file = await http.MultipartFile.fromPath(
//           'image',
//           image!.path,
//           contentType: MediaType.parse(mimeType!),
//         );
//         request.files.add(file);
//       }

//       var response = await request.send();
//       if (response.statusCode == 200) {
//         print('Post added successfully');
//       } else {
//         print('Failed to add post: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Confirm Post',
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
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 9,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       color: Colors.white,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20.0, vertical: 25),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               height: 100,
//                               width: 100,
//                               color: Colors.grey,
//                               child: Image.file(image!, fit: BoxFit.contain),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 25),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Caption:',
//                                 style: TextStyle(fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 caption,
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.location_on),
//                     title: Text('Add Location'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.person_add),
//                     title: Text('Tag People'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.remove_red_eye),
//                     title: Text('Targeted Eye'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               width: double.infinity,
//               child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: GestureDetector(
//                     onTap: addPost,
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.purple[800]!, Colors.pink[200]!],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Share',
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
