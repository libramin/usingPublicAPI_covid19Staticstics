import 'package:covid19staticstics/utils/data_utils.dart';
import 'package:covid19staticstics/utils/xmlutils.dart';
import 'package:xml/xml.dart';

class CovidStatisticsModel {
  String? createDt;
  String? stateTime;
  double? decideCnt;
  double calcDecideCnt = 0;
  double? deathCnt;
  double calcDeathCnt = 0;
  double? examCnt;
  double calcExamCnt = 0;
  double? seq;
  DateTime? stateDt;
  String? updateDt;

  CovidStatisticsModel({
    this.createDt,
    this.stateTime,
    this.decideCnt,
    this.deathCnt,
    this.examCnt,
    this.seq,
    this.stateDt,
    this.updateDt,
  });

  factory CovidStatisticsModel.fromXml(XmlElement xmlElement) {
    return CovidStatisticsModel(
      createDt: XmlUtils.searchResultForString(xmlElement, 'createDt'),
      stateTime: XmlUtils.searchResultForString(xmlElement, 'stateTime'),
      stateDt: XmlUtils.searchResultForString(xmlElement, 'stateDt') != ''
          ? DateTime.parse(
              XmlUtils.searchResultForString(xmlElement, 'stateDt'))
          : null,
      updateDt: XmlUtils.searchResultForString(xmlElement, 'updateDt'),
      deathCnt: XmlUtils.searchResultForDouble(xmlElement, 'deathCnt'),
      decideCnt: XmlUtils.searchResultForDouble(xmlElement, 'decideCnt'),
      examCnt: XmlUtils.searchResultForDouble(xmlElement, 'examCnt'),
      seq: XmlUtils.searchResultForDouble(xmlElement, 'seq'),
    );
  }

  void updateCalculateAboutYesterDay(CovidStatisticsModel yesterDayData) {
    _updateCalcDecideCnt(yesterDayData.decideCnt!);
    _updateCalcExamCnt(yesterDayData.examCnt!);
    _updateCalcDeathCnt(yesterDayData.deathCnt!);
  }

  void _updateCalcDecideCnt(double beforeCnt) {
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _updateCalcExamCnt(double beforeCnt) {
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _updateCalcDeathCnt(double beforeCnt) {
    calcDeathCnt = deathCnt! - beforeCnt;
  }

  String get standardDayString => stateDt == null?'': '${DataUtils.simpleDayFormat(stateDt!)} $stateTime 기준';
}
