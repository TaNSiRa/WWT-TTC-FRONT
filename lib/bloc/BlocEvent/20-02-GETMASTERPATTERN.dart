// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, prefer_const_constructors

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
      output.CUSTNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['CUSTNAME'].length; i++) {
        output.CUSTNAME.add(MapEntry(
            databuff['CUSTNAME'][i]['CUSTNAME'].toString(), databuff['CUSTNAME'][i]['masterID'].toString()));
      }
      output.TYPE = [MapEntry("", "")];
      for (var i = 0; i < databuff['TYPE'].length; i++) {
        output.TYPE.add(
            MapEntry(databuff['TYPE'][i]['TYPE'].toString(), databuff['TYPE'][i]['masterID'].toString()));
      }

      output.SAMPLENAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['SAMPLENAME'].length; i++) {
        output.SAMPLENAME.add(MapEntry(databuff['SAMPLENAME'][i]['SAMPLENAME'].toString(),
            databuff['SAMPLENAME'][i]['masterID'].toString()));
      }

      output.INSTRUMENTNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['INSTRUMENTNAME'].length; i++) {
        output.INSTRUMENTNAME.add(MapEntry(databuff['INSTRUMENTNAME'][i]['INSTRUMENTNAME'].toString(),
            databuff['INSTRUMENTNAME'][i]['masterID'].toString()));
      }

      output.ITEMNAME = [MapEntry("", "")];
      for (var i = 0; i < databuff['ITEMNAME'].length; i++) {
        output.ITEMNAME.add(MapEntry(
            databuff['ITEMNAME'][i]['ITEMNAME'].toString(), databuff['ITEMNAME'][i]['masterID'].toString()));
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
