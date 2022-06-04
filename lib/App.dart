import 'package:covid19staticstics/covid_statistics_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<CovidStatisticsController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코로나현황'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Obx((){
          var info = controller.covidResultsModel.value;
          return Column(
            children: [
              Text('기준일 : ${info.stateDt??''}'),
              Text('기준시간 : ${info.stateTime??''}'),
              Text('확진자수 : ${info.decideCnt??''}'),
              Text('사망자수 : ${info.deathCnt??''}'),
            ],
          );
        }),
      ),
    );
  }
}
