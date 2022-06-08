import 'package:covid19staticstics/canvas/arrow_clip_path.dart';
import 'package:covid19staticstics/model/covid_statistics_model.dart';
import 'package:covid19staticstics/repository/covid_statistics_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CovidStatisticsController extends GetxController{

  late CovidStatisticsRepo _covidStatisticsRepo;
  Rx<CovidStatisticsModel> _todayData = CovidStatisticsModel().obs;
  RxList<CovidStatisticsModel> _weekData = <CovidStatisticsModel>[].obs;
  double maxDecideValue = 0;

  @override
  void onInit() {
    super.onInit();
    _covidStatisticsRepo = CovidStatisticsRepo();
    fetchCovidState();
  }

  void fetchCovidState() async{
    var startDate = DateFormat('yyyyMMdd').format(DateTime.now().subtract(Duration(days: 6)));
    var endDate = DateFormat('yyyyMMdd').format(DateTime.now());
    var results = await _covidStatisticsRepo.fetchCovidStatistics(startDate: startDate,endDate: endDate);
    print(results.length);
    if(results.isNotEmpty){
      for(var i = 0; i < results.length; i++){
        if(i<results.length-1) {
          results[i].updateCalculateAboutYesterDay(results[i + 1]);
          if(maxDecideValue < results[i].calcDecideCnt){
            maxDecideValue = results[i].calcDecideCnt;
          }
        }
      }
      _weekData.addAll(results.sublist(0,results.length -1).reversed);
      _todayData(_weekData.last);
    }
  }

  Rx<CovidStatisticsModel> get todayData => _todayData;
  RxList<CovidStatisticsModel> get weekData => _weekData;

  ArrowDirection calculrateUpDown(double value){
    if(value == 0){
      return ArrowDirection.MIDDLE;
    }else if(value > 0){
      return ArrowDirection.UP;
    }else {
      return ArrowDirection.DOWN;
    }
  }
}