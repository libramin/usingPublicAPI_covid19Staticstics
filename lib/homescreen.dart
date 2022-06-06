import 'package:covid19staticstics/canvas/arrow_clip_path.dart';
import 'package:covid19staticstics/utils/data_utils.dart';
import 'package:covid19staticstics/widget/chart.dart';
import 'package:covid19staticstics/widget/covid_statistics_viewer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;
    double _sizeWidth = _size.width;
    double appBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text(
          '코로나 일별 현황', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
              left: -_sizeWidth / 6,
              top: appBarHeight * 1.5,
              child: Image.asset(
                'assets/virus.png',
                width: _sizeWidth * 0.7,
                height: _sizeWidth * 0.7,
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text('00.00 00:00 기준',
                  style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          Positioned(
            right: appBarHeight * 0.5,
            top: appBarHeight * 1.3,
            child: CovidStatisticsViewer(
              dense: false,
              title: '확진자',
              titleColor: Colors.black87.withOpacity(0.6),
              upDown: ArrowDirection.UP,
              addedCount: DataUtils.numFormat(18762),
              totalCount: DataUtils.numFormat(23491),
              subValueColor: Colors.black87.withOpacity(0.6),
              appBarHeight: appBarHeight,
           ),
          ),
          Positioned(
            top: _sizeWidth / 1.8,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CovidStatisticsViewer(
                            title: '격리해제',
                            addedCount: DataUtils.numFormat(1040),
                            totalCount: DataUtils.numFormat(16532),
                            upDown: ArrowDirection.UP),
                        CovidStatisticsViewer(
                            title: '검사 중',
                            addedCount: DataUtils.numFormat(3341.0),
                            totalCount: DataUtils.numFormat(285734),
                            upDown: ArrowDirection.DOWN),
                        CovidStatisticsViewer(
                            title: '사망자',
                            addedCount: DataUtils.numFormat(2),
                            totalCount: DataUtils.numFormat(2039),
                            upDown: ArrowDirection.MIDDLE),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '확진자 추이',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: CovidChart()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
