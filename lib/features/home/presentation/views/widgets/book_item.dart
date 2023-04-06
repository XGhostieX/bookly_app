import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imageUrl;
  const BookItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          // Assets.testImage,
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

// Card(
//   color: Colors.orangeAccent,
//   shape:
//       RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//   child: Image.asset(
//     Assets.testImage,
//     height: 300,
//   ),

//     ClipRRect(
//   borderRadius: BorderRadius.circular(16),
//   child: Image.asset(
//     Assets.testImage,
//     // height: 300,
//   ),
// )
