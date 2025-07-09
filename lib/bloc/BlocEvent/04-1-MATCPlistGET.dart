// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/04MATCPlist/04MATCPlistMAIN.dart';
import '../../page/11PATTERNTTC/11PATTERNTTCVAR.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class MATCPlistGET_Event {}

class MATCPlistGET_MATCP extends MATCPlistGET_Event {}

class MATCPlistDELETE_MATCP extends MATCPlistGET_Event {}

class MATCPlistGET_flush extends MATCPlistGET_Event {}

class MATCPlistGET_Bloc extends Bloc<MATCPlistGET_Event, List<MATCPlistClass>> {
  MATCPlistGET_Bloc() : super([]) {
    on<MATCPlistGET_MATCP>((event, emit) {
      return _MATCPlistGET_MATCP([], emit);
    });
    on<MATCPlistGET_flush>((event, emit) {
      return _MATCPlistGET_flush([], emit);
    });
  }
  Future<void> _MATCPlistGET_MATCP(List<MATCPlistClass> toAdd, Emitter<List<MATCPlistClass>> emit) async {
    List<MATCPlistClass> output = [];
    final response = await Dio().post(
      "${serverGB}TLA/GETPATTERN",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(MATCPlistClass(
          CUSTNAME: databuff[i]['CUSTNAME'] != null ? databuff[i]['CUSTNAME'].toString() : '',
          TYPE: databuff[i]['TYPE'] != null ? databuff[i]['TYPE'].toString() : '',
          CUSTNAMEUID: databuff[i]['CUSTNAMEUID'] != null ? databuff[i]['CUSTNAMEUID'].toString() : '',
          TYPEUID: databuff[i]['TYPEUID'] != null ? databuff[i]['TYPEUID'].toString() : '',
          UID: databuff[i]['UID'] != null ? databuff[i]['UID'].toString() : '',
        ));
      }
    }

    emit(output);
  }

  Future<void> _MATCPlistGET_flush(List<MATCPlistClass> toAdd, Emitter<List<MATCPlistClass>> emit) async {
    List<MATCPlistClass> output = [];
    emit(output);
  }
}

class MATCPlistClass {
  MATCPlistClass({
    this.CUSTNAME = '',
    this.TYPE = '',
    this.CUSTNAMEUID = '',
    this.TYPEUID = '',
    this.UID = '',
  });
  String CUSTNAME, TYPE, CUSTNAMEUID, TYPEUID, UID;
}
