import 'package:covid19staticstics/utils/xmlutils.dart';
import 'package:xml/xml.dart';

class CovidStaticsticsModel {
  String? createDt;
  String? deathCnt;
  String? decideCnt;
  String? seq;
  String? stateDt;
  String? stateTime;
  String? updateDt;


  CovidStaticsticsModel({
    this.createDt,
    this.deathCnt,
    this.decideCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt,
  });

  factory CovidStaticsticsModel.fromXml(XmlElement xmlElement) {
    return CovidStaticsticsModel(
      createDt: XmlUtils.searchResult(xmlElement, 'createDt'),
      deathCnt: XmlUtils.searchResult(xmlElement, 'deathCnt'),
      decideCnt: XmlUtils.searchResult(xmlElement, 'decideCnt'),
      seq: XmlUtils.searchResult(xmlElement, 'seq'),
      stateDt: XmlUtils.searchResult(xmlElement, 'stateDt'),
      stateTime: XmlUtils.searchResult(xmlElement, 'stateTime'),
      updateDt: XmlUtils.searchResult(xmlElement, 'updateDt'),
    );
  }
}