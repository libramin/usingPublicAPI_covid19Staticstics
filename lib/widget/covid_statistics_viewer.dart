import 'package:flutter/material.dart';

import '../canvas/arrow_clip_path.dart';

class CovidStatisticsViewer extends StatelessWidget {
  final String title;
  final Color titleColor;
  final String addedCount;
  final String totalCount;
  final Color subValueColor;
  final double appBarHeight;
  final double spacing;
  final ArrowDirection upDown;
  final bool dense;

  CovidStatisticsViewer(
      {Key? key,
      this.appBarHeight = 15,
      required this.title,
      this.titleColor = const Color(0xff4c4e5d),
      required this.addedCount,
      required this.totalCount,
      this.subValueColor = Colors.black87,
      this.spacing = 10,
      required this.upDown,
      this.dense = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var color = Colors.black87;

    switch (upDown) {
      case ArrowDirection.UP:
        color = Colors.red;
        break;
      case ArrowDirection.MIDDLE:
        break;
      case ArrowDirection.DOWN:
        color = Colors.blue;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: dense? 15 : 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: spacing*0.3,
        ),
        Row(
          children: [
            ClipPath(
              clipper: ArrowClipPath(direction: upDown),
              child: Container(
                color: color,
                width: appBarHeight * 0.8,
                height: appBarHeight * 0.8,
              ),
            ),
            SizedBox(
              width: spacing,
            ),
            Text(
              addedCount.toString(),
              style: TextStyle(
                color: color,
                fontSize: dense? 20 : 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        SizedBox(
          height: spacing*0.3,
        ),
        Text(
          '$totalCount',
          style: TextStyle(
            color: subValueColor,
            fontSize: dense? 15 : 20
          ),
        )
      ],
    );
  }
}
