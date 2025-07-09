// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

//-------------------------------------------------

abstract class P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET2 extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET3 extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_FLUSH extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_Bloc extends Bloc<P20CREATEREQUESTGETDATA_Event, P20CREATEREQUESTGETDATAclass> {
  P20CREATEREQUESTGETDATA_Bloc() : super(P20CREATEREQUESTGETDATAclass()) {
    on<P20CREATEREQUESTGETDATA_GET>((event, emit) {
      return _P20CREATEREQUESTGETDATA_GET(P20CREATEREQUESTGETDATAclass(), emit);
    });

    on<P20CREATEREQUESTGETDATA_GET2>((event, emit) {
      return _P20CREATEREQUESTGETDATA_GET2(P20CREATEREQUESTGETDATAclass(), emit);
    });

    on<P20CREATEREQUESTGETDATA_FLUSH>((event, emit) {
      return _P20CREATEREQUESTGETDATA_FLUSH(P20CREATEREQUESTGETDATAclass(), emit);
    });
  }

  Future<void> _P20CREATEREQUESTGETDATA_GET(
      P20CREATEREQUESTGETDATAclass toAdd, Emitter<P20CREATEREQUESTGETDATAclass> emit) async {
    // List<P20CREATEREQUESTGETDATAclass> output = [];
    P20CREATEREQUESTGETDATAclass output = P20CREATEREQUESTGETDATAclass();
    //-------------------------------------------------------------------------------------

    final response = await Dio().post(
      "${serverGB}TLA/GETALLMASTER",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff['CUSTNAME'].length);
      output.CUSTNAME = [const MapEntry("", "")];
      for (var i = 0; i < databuff['CUSTNAME'].length; i++) {
        output.CUSTNAME.add(MapEntry(
            databuff['CUSTNAME'][i]['CUSTNAME'].toString(), databuff['CUSTNAME'][i]['masterID'].toString()));
      }
      output.TYPE = [const MapEntry("", "")];
      for (var i = 0; i < databuff['TYPE'].length; i++) {
        output.TYPE.add(
            MapEntry(databuff['TYPE'][i]['TYPE'].toString(), databuff['TYPE'][i]['masterID'].toString()));
      }

      output.SAMPLENAME = [const MapEntry("", "")];
      for (var i = 0; i < databuff['SAMPLENAME'].length; i++) {
        output.SAMPLENAME.add(MapEntry(databuff['SAMPLENAME'][i]['SAMPLENAME'].toString(),
            databuff['SAMPLENAME'][i]['masterID'].toString()));
      }

      output.INSTRUMENTNAME = [const MapEntry("", "")];
      for (var i = 0; i < databuff['INSTRUMENTNAME'].length; i++) {
        output.INSTRUMENTNAME.add(MapEntry(databuff['INSTRUMENTNAME'][i]['INSTRUMENTNAME'].toString(),
            databuff['INSTRUMENTNAME'][i]['masterID'].toString()));
      }

      output.ITEMNAME = [const MapEntry("", "")];
      for (var i = 0; i < databuff['ITEMNAME'].length; i++) {
        output.ITEMNAME.add(MapEntry(
            databuff['ITEMNAME'][i]['ITEMNAME'].toString(), databuff['ITEMNAME'][i]['masterID'].toString()));
      }
    }

    output.BottleNOset = [
      const MapEntry("", ""),
      const MapEntry("1", "1"),
      const MapEntry("2", "2"),
      const MapEntry("3", "3"),
      const MapEntry("4", "4"),
      const MapEntry("5", "5"),
      const MapEntry("6", "6"),
      const MapEntry("7", "7"),
      const MapEntry("8", "8"),
      const MapEntry("9", "9"),
      const MapEntry("10", "10"),
      const MapEntry("11", "11"),
      const MapEntry("12", "12"),
    ];
    output.Reportformat = [
      const MapEntry("", ""),
      const MapEntry("1", "1"),
      const MapEntry("2", "2"),
      const MapEntry("3", "3"),
      const MapEntry("4", "4"),
    ];

    emit(output);
  }

  Future<void> _P20CREATEREQUESTGETDATA_GET2(
      P20CREATEREQUESTGETDATAclass toAdd, Emitter<P20CREATEREQUESTGETDATAclass> emit) async {
    // FreeLoadingTan(P20CREATEREQUESTMAINcontext);
    // List<P20CREATEREQUESTGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // print('innnnnnnnnnnnnnn');
    // final response = await Dio().post(
    //   "http://127.0.0.1:14001/02SALTSPRAY/EditData",
    //   data: {
    //     'dataRow': P20CREATEREQUESTVAR.SendEditDataToAPI,
    //   },
    // );

    // print('Sent complete');
  }

  Future<void> _P20CREATEREQUESTGETDATA_FLUSH(
      P20CREATEREQUESTGETDATAclass toAdd, Emitter<P20CREATEREQUESTGETDATAclass> emit) async {
    P20CREATEREQUESTGETDATAclass output = P20CREATEREQUESTGETDATAclass();
    emit(output);
  }
}

class P20CREATEREQUESTGETDATAclass {
  P20CREATEREQUESTGETDATAclass({
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

String savenull(input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
