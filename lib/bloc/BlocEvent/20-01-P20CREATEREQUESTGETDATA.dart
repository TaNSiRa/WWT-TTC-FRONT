// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../data/dummyMasterWWT.dart';
import '../../data/global.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET2 extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_GET3 extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_FLUSH extends P20CREATEREQUESTGETDATA_Event {}

class P20CREATEREQUESTGETDATA_Bloc
    extends Bloc<P20CREATEREQUESTGETDATA_Event, List<P20CREATEREQUESTGETDATAclass>> {
  P20CREATEREQUESTGETDATA_Bloc() : super([]) {
    on<P20CREATEREQUESTGETDATA_GET>((event, emit) {
      return _P20CREATEREQUESTGETDATA_GET([], emit);
    });

    on<P20CREATEREQUESTGETDATA_GET2>((event, emit) {
      return _P20CREATEREQUESTGETDATA_GET2([], emit);
    });
    on<P20CREATEREQUESTGETDATA_GET3>((event, emit) {
      return _P20CREATEREQUESTGETDATA_GET3([], emit);
    });
    on<P20CREATEREQUESTGETDATA_FLUSH>((event, emit) {
      return _P20CREATEREQUESTGETDATA_FLUSH([], emit);
    });
  }

  Future<void> _P20CREATEREQUESTGETDATA_GET(
      List<P20CREATEREQUESTGETDATAclass> toAdd, Emitter<List<P20CREATEREQUESTGETDATAclass>> emit) async {
    List<P20CREATEREQUESTGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------

    var input = [];

    var databuff = dummyMasterWWT;
    input = databuff;

    List<P20CREATEREQUESTGETDATAclass> outputdata = input.map((data) {
      return P20CREATEREQUESTGETDATAclass(
        CUSTNAME: savenull(data['CustomerName']),
        TYPE: savenull(data['Type']),
        SAMPLENO: savenull(data['SampleNo']),
        SAMPLENAME: savenull(data['SampleName']),
        BOTTLENO: savenull(data['BottleNo']),
        ITEMNO: savenull(data['ItemNo']),
        INSTRUMENTNAME: savenull(data['Instrumentname']),
        ITEMNAME: savenull(data['ItemName']),
        REPORTFORMAT: savenull(data['ReportFormat']),
      );
    }).toList();

    output = outputdata;
    emit(output);
  }

  Future<void> _P20CREATEREQUESTGETDATA_GET2(
      List<P20CREATEREQUESTGETDATAclass> toAdd, Emitter<List<P20CREATEREQUESTGETDATAclass>> emit) async {
    // FreeLoadingTan(P20CREATEREQUESTMAINcontext);
    List<P20CREATEREQUESTGETDATAclass> output = [];
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

  Future<void> _P20CREATEREQUESTGETDATA_GET3(
      List<P20CREATEREQUESTGETDATAclass> toAdd, Emitter<List<P20CREATEREQUESTGETDATAclass>> emit) async {
    // List<P20CREATEREQUESTGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P20CREATEREQUESTGETDATAclass> datadummy = [
    //   P20CREATEREQUESTGETDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P20CREATEREQUESTGETDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P20CREATEREQUESTGETDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P20CREATEREQUESTGETDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P20CREATEREQUESTGETDATA_FLUSH(
      List<P20CREATEREQUESTGETDATAclass> toAdd, Emitter<List<P20CREATEREQUESTGETDATAclass>> emit) async {
    List<P20CREATEREQUESTGETDATAclass> output = [];
    emit(output);
  }
}

class P20CREATEREQUESTGETDATAclass {
  P20CREATEREQUESTGETDATAclass({
    this.CUSTNAME = '',
    this.TYPE = '',
    this.SAMPLENO = '',
    this.SAMPLENAME = '',
    this.BOTTLENO = '',
    this.ITEMNO = '',
    this.INSTRUMENTNAME = '',
    this.ITEMNAME = '',
    this.REPORTFORMAT = '',
    List<P20CREATEREQUESTGETDATAclass>? data,
  });
  String CUSTNAME;
  String TYPE;
  String SAMPLENO;
  String SAMPLENAME;
  String BOTTLENO;
  String ITEMNO;
  String INSTRUMENTNAME;
  String ITEMNAME;
  String REPORTFORMAT;
}

String savenull(input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
