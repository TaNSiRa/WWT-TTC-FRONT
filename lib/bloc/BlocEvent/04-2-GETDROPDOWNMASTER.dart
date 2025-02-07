import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class GETDROPDOWNGET_Event {}

class GETDROPDOWNGET_LIST extends GETDROPDOWNGET_Event {}

class GETDROPDOWNGET_flush extends GETDROPDOWNGET_Event {}

class GETDROPDOWNMASTER_Bloc
    extends Bloc<GETDROPDOWNGET_Event, GETDROPDOWNMASTERClass> {
  GETDROPDOWNMASTER_Bloc() : super(GETDROPDOWNMASTERClass()) {
    on<GETDROPDOWNGET_LIST>((event, emit) {
      return _GETDROPDOWNGET_LIST(GETDROPDOWNMASTERClass(), emit);
    });
    on<GETDROPDOWNGET_flush>((event, emit) {
      return _GETDROPDOWNGET_flush(GETDROPDOWNMASTERClass(), emit);
    });
  }
  Future<void> _GETDROPDOWNGET_LIST(GETDROPDOWNMASTERClass toAdd,
      Emitter<GETDROPDOWNMASTERClass> emit) async {
    GETDROPDOWNMASTERClass output = GETDROPDOWNMASTERClass();
    final response = await Dio().post(
      serverGB + "TLA/GETALLMASTER",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff['CUSTNAME'].length);
      output.CUSTNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['CUSTNAME'].length; i++) {
        output.CUSTNAME.add(MapEntry(
            databuff['CUSTNAME'][i]['CUSTNAME'].toString(),
            databuff['CUSTNAME'][i]['masterID'].toString()));
      }
      output.TYPE = [MapEntry("", "")];
      for (var i = 0; i < databuff['TYPE'].length; i++) {
        output.TYPE.add(MapEntry(databuff['TYPE'][i]['TYPE'].toString(),
            databuff['TYPE'][i]['masterID'].toString()));
      }

      output.SAMPLENAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['SAMPLENAME'].length; i++) {
        output.SAMPLENAME.add(MapEntry(
            databuff['SAMPLENAME'][i]['SAMPLENAME'].toString(),
            databuff['SAMPLENAME'][i]['masterID'].toString()));
      }

      output.INSTRUMENTNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['INSTRUMENTNAME'].length; i++) {
        output.INSTRUMENTNAME.add(MapEntry(
            databuff['INSTRUMENTNAME'][i]['INSTRUMENTNAME'].toString(),
            databuff['INSTRUMENTNAME'][i]['masterID'].toString()));
      }

      output.ITEMNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['ITEMNAME'].length; i++) {
        output.ITEMNAME.add(MapEntry(
            databuff['ITEMNAME'][i]['ITEMNAME'].toString(),
            databuff['ITEMNAME'][i]['masterID'].toString()));
      }
    }

    output.BottleNOset = [
      MapEntry("", ""),
      MapEntry("1", "1"),
      MapEntry("2", "2"),
      MapEntry("3", "3"),
      MapEntry("4", "4"),
      MapEntry("5", "5"),
      MapEntry("6", "6"),
      MapEntry("7", "7"),
      MapEntry("8", "8"),
      MapEntry("9", "9"),
      MapEntry("10", "10"),
      MapEntry("11", "11"),
      MapEntry("12", "12"),
    ];
    output.Reportformat = [
      MapEntry("", ""),
      MapEntry("1", "1"),
      MapEntry("2", "2"),
      MapEntry("3", "3"),
      MapEntry("4", "4"),
    ];

    emit(output);
  }

  Future<void> _GETDROPDOWNGET_flush(GETDROPDOWNMASTERClass toAdd,
      Emitter<GETDROPDOWNMASTERClass> emit) async {
    GETDROPDOWNMASTERClass output = GETDROPDOWNMASTERClass();
    emit(output);
  }
}

class GETDROPDOWNMASTERClass {
  GETDROPDOWNMASTERClass({
    this.CUSTNAME = const [],
    this.TYPE = const [],
    this.SAMPLENAME = const [],
    this.BottleNOset = const [],
    this.INSTRUMENTNAME = const [],
    this.ITEMNAME = const [],
    this.Reportformat = const [],
  });
  List<MapEntry<String, String>> CUSTNAME;
  List<MapEntry<String, String>> TYPE;
  List<MapEntry<String, String>> SAMPLENAME;

  List<MapEntry<String, String>> BottleNOset;
  List<MapEntry<String, String>> INSTRUMENTNAME;
  List<MapEntry<String, String>> ITEMNAME;
  List<MapEntry<String, String>> Reportformat;
}
