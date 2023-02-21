import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  final double? itemSize;
  final Color? starColor;
  RatingBarWidget({Key? key, this.itemSize = 18, this.starColor = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      itemSize: itemSize!,
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: .5),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: starColor!,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
