import 'package:flutter/material.dart';

import '../canvas/arrow_clip_path.dart';

class CovidStatisticsViewer extends StatelessWidget {
  final String title;
  final String addedCount;
  final String totalCount;
  final ArrowDirection upDown;

  CovidStatisticsViewer(
      {Key? key,
      required this.title,
      required this.addedCount,
      required this.totalCount,
      required this.upDown,
      })
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
          style: const TextStyle(
            color: Color(0xff4c4e5d),
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height:3,
        ),
        Row(
          children: [
            ClipPath(
              clipper: ArrowClipPath(direction: upDown),
              child: Container(
                color: color,
                width: 10,
                height: 10,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              addedCount,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          totalCount,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15
          ),
        )
      ],
    );
  }
}
