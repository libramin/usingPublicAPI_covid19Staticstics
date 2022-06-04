import 'package:covid19staticstics/covid_statistics_model.dart';
import 'package:covid19staticstics/covid_statistics_repo.dart';
import 'package:get/get.dart';

class CovidStatisticsController extends GetxController{

  late CovidStatisticsRepo _covidStatisticsRepo;
  Rx<CovidStaticsticsModel> covidResultsModel = CovidStaticsticsModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _covidStatisticsRepo = CovidStatisticsRepo();
    fetchCovidState();
  }

  void fetchCovidState() async{
    var results = await _covidStatisticsRepo.fetchCovidStatistics();
    if(results != null){
      covidResultsModel(results);
    }
  }


}