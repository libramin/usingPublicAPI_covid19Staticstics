import 'package:covid19staticstics/controller/covid_statistics_cotroller.dart';
import 'package:covid19staticstics/widget/chart.dart';
import 'package:covid19staticstics/widget/covid_statistics_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<CovidStatisticsController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _sizeWidth = _size.width;
    double appBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text(
          '코로나 일별 현황',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
              left: -_sizeWidth / 6,
              top: appBarHeight * 0.2,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() => Text(
                    controller.todayData.value.standardDayString,
                    style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
          Positioned(
            top: _sizeWidth *0.3,
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
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CovidStatisticsViewer(
                                title: '확진자',
                                addedCount: controller
                                    .todayData.value.calcDecideCnt
                                    .toString(),
                                totalCount: controller.todayData.value.decideCnt
                                    .toString(),
                                upDown: controller.calculrateUpDown(
                                    controller.todayData.value.calcDecideCnt)),
                            CovidStatisticsViewer(
                                title: '검사 중',
                                addedCount: controller.todayData.value.calcExamCnt.toString(),
                                totalCount: controller.todayData.value.examCnt.toString(),
                                upDown: controller.calculrateUpDown(
                                    controller.todayData.value.calcExamCnt)),
                            CovidStatisticsViewer(
                                title: '사망자',
                                addedCount: controller
                                    .todayData.value.calcDeathCnt
                                    .toString(),
                                totalCount: controller.todayData.value.deathCnt
                                    .toString(),
                                upDown: controller.calculrateUpDown(
                                    controller.todayData.value.calcDeathCnt)),
                          ],
                        )),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      '확진자 추이',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Obx(() => controller.weekData.value.length == 0
                            ? Container()
                            : CovidChart(
                                covidDatas: controller.weekData.value,
                          maxY: controller.maxDecideValue
                              ))),
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
