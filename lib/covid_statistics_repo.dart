import 'package:covid19staticstics/key/key.dart';
import 'package:dio/dio.dart';
import 'covid_statistics_model.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepo{
  late var _dio;

  CovidStatisticsRepo(){
    _dio = Dio(
      BaseOptions(baseUrl: 'http://openapi.data.go.kr',queryParameters: {
        'ServiceKey' : myKey
      }),
    );
  }

  Future<CovidStaticsticsModel> fetchCovidStatistics()async{
    var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson');
    print(response);
    final document = XmlDocument.parse(response.data);
    final items = document.findAllElements('item');
    if(items.isNotEmpty){
      return CovidStaticsticsModel.fromXml(items.first);
    }else{
      return Future.value(null);
    }
  }
}