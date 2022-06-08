import 'package:covid19staticstics/key/key.dart';
import 'package:dio/dio.dart';
import '../model/covid_statistics_model.dart';
import 'package:xml/xml.dart';

class CovidStatisticsRepo{
  late var _dio;
//   final bookshelfXml =
//   '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
//     <response>
// <header>
// <resultCode>00</resultCode>
// <resultMsg>NORMAL SERVICE.</resultMsg>
// </header>
// <body>
// <items>
// <item>
// <createDt>2022-06-03 09:08:18.729</createDt>
// <deathCnt>24229</deathCnt>
// <decideCnt>18141803</decideCnt>
// <seq>899</seq>
// <stateDt>20220603</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:58:37.902</updateDt>
// </item>
// <item>
// <createDt>2022-06-02 08:58:19.746</createDt>
// <deathCnt>24212</deathCnt>
// <decideCnt>18129261</decideCnt>
// <seq>898</seq>
// <stateDt>20220602</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:58:54.426</updateDt>
// </item>
// <item>
// <createDt>2022-06-01 09:07:30.461</createDt>
// <deathCnt>24197</deathCnt>
// <decideCnt>18119367</decideCnt>
// <seq>897</seq>
// <stateDt>20220601</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:59:08.601</updateDt>
// </item>
// <item>
// <createDt>2022-05-31 08:55:39.977</createDt>
// <deathCnt>24176</deathCnt>
// <decideCnt>18103577</decideCnt>
// <seq>896</seq>
// <stateDt>20220531</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:59:23.637</updateDt>
// </item>
// <item>
// <createDt>2022-05-30 09:01:30.847</createDt>
// <deathCnt>24167</deathCnt>
// <decideCnt>18086392</decideCnt>
// <seq>895</seq>
// <stateDt>20220530</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:59:37.203</updateDt>
// </item>
// <item>
// <createDt>2022-05-29 09:05:28.382</createDt>
// <deathCnt>24158</deathCnt>
// <decideCnt>18080257</decideCnt>
// <seq>894</seq>
// <stateDt>20220529</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 08:59:51.863</updateDt>
// </item>
// <item>
// <createDt>2022-05-28 09:09:18.909</createDt>
// <deathCnt>24139</deathCnt>
// <decideCnt>18067610</decideCnt>
// <seq>893</seq>
// <stateDt>20220528</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-04 09:00:06.316</updateDt>
// </item>
// <item>
// <createDt>2022-05-27 09:03:34.444</createDt>
// <deathCnt>24103</deathCnt>
// <decideCnt>18053236</decideCnt>
// <seq>892</seq>
// <stateDt>20220527</stateDt>
// <stateTime>00:00</stateTime>
// <updateDt>2022-06-03 09:11:10.578</updateDt>
// </item>
//
// </items>
// <numOfRows>10</numOfRows>
// <pageNo>1</pageNo>
// <totalCount>2</totalCount>
// </body>
// </response>''';

  CovidStatisticsRepo(){
    _dio = Dio(
      BaseOptions(baseUrl: 'http://openapi.data.go.kr'),
    );
  }

  Future<List<CovidStatisticsModel>> fetchCovidStatistics({String? startDate, String? endDate})async{
    var query = Map<String,String>();
    query.putIfAbsent('serviceKey', () => myKey);
    if(startDate !=null) query.putIfAbsent('startCreateDt', () => startDate);
    if(endDate !=null) query.putIfAbsent('endCreateDt', () => endDate);

    var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson',queryParameters: query);
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if(results.isNotEmpty){
      return results.map<CovidStatisticsModel>((element) => CovidStatisticsModel.fromXml(element)).toList();
    }else{
      return Future.value(null);
    }
  }
}