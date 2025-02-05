import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class PATTERNDATAGET_Event {}

class PATTERNDATAGET_MATCP extends PATTERNDATAGET_Event {}

class PATTERNDATAGET_flush extends PATTERNDATAGET_Event {}

class PATTERNDATAGET_Bloc
    extends Bloc<PATTERNDATAGET_Event, List<PATTERNDATAClass>> {
  PATTERNDATAGET_Bloc() : super([]) {
    on<PATTERNDATAGET_MATCP>((event, emit) {
      return _PATTERNDATAGET_MATCP([], emit);
    });
    on<PATTERNDATAGET_flush>((event, emit) {
      return _PATTERNDATAGET_flush([], emit);
    });
  }
  Future<void> _PATTERNDATAGET_MATCP(List<PATTERNDATAClass> toAdd,
      Emitter<List<PATTERNDATAClass>> emit) async {
    List<PATTERNDATAClass> output = [];
    final response = await Dio().post(
      serverGB + "TLA/GETPATTERN",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(PATTERNDATAClass(
          SMAPLENO1: databuff[i]['SMAPLENO1'] != null
              ? databuff[i]['SMAPLENO1'].toString()
              : '',
          SMAPLENO1UID: databuff[i]['SMAPLENO1UID'] != null
              ? databuff[i]['SMAPLENO1UID'].toString()
              : '',
          SMAPLENO1LIST: [],
          SMAPLENO2: databuff[i]['SMAPLENO2'] != null
              ? databuff[i]['SMAPLENO2'].toString()
              : '',
          SMAPLENO2UID: databuff[i]['SMAPLENO2UID'] != null
              ? databuff[i]['SMAPLENO2UID'].toString()
              : '',
          SMAPLENO2LIST: [],
          SMAPLENO3: databuff[i]['SMAPLENO3'] != null
              ? databuff[i]['SMAPLENO3'].toString()
              : '',
          SMAPLENO3UID: databuff[i]['SMAPLENO3UID'] != null
              ? databuff[i]['SMAPLENO3UID'].toString()
              : '',
          SMAPLENO3LIST: [],
          SMAPLENO4: databuff[i]['SMAPLENO4'] != null
              ? databuff[i]['SMAPLENO4'].toString()
              : '',
          SMAPLENO4UID: databuff[i]['SMAPLENO4UID'] != null
              ? databuff[i]['SMAPLENO4UID'].toString()
              : '',
          SMAPLENO4LIST: [],
          SMAPLENO5: databuff[i]['SMAPLENO5'] != null
              ? databuff[i]['SMAPLENO5'].toString()
              : '',
          SMAPLENO5UID: databuff[i]['SMAPLENO5UID'] != null
              ? databuff[i]['SMAPLENO5UID'].toString()
              : '',
          SMAPLENO5LIST: [],
          SMAPLENO6: databuff[i]['SMAPLENO6'] != null
              ? databuff[i]['SMAPLENO6'].toString()
              : '',
          SMAPLENO6UID: databuff[i]['SMAPLENO6UID'] != null
              ? databuff[i]['SMAPLENO6UID'].toString()
              : '',
          SMAPLENO6LIST: [],
          SMAPLENO7: databuff[i]['SMAPLENO7'] != null
              ? databuff[i]['SMAPLENO7'].toString()
              : '',
          SMAPLENO7UID: databuff[i]['SMAPLENO7UID'] != null
              ? databuff[i]['SMAPLENO7UID'].toString()
              : '',
          SMAPLENO7LIST: [],
          SMAPLENO8: databuff[i]['SMAPLENO8'] != null
              ? databuff[i]['SMAPLENO8'].toString()
              : '',
          SMAPLENO8UID: databuff[i]['SMAPLENO8UID'] != null
              ? databuff[i]['SMAPLENO8UID'].toString()
              : '',
          SMAPLENO8LIST: [],
        ));
      }
    }

    emit(output);
  }

  Future<void> _PATTERNDATAGET_flush(List<PATTERNDATAClass> toAdd,
      Emitter<List<PATTERNDATAClass>> emit) async {
    List<PATTERNDATAClass> output = [];
    emit(output);
  }
}

class PATTERNDATAClass {
  PATTERNDATAClass({
    this.SMAPLENO1 = '',
    this.SMAPLENO1UID = '',
    this.SMAPLENO1LIST = const [],
    this.SMAPLENO2 = '',
    this.SMAPLENO2UID = '',
    this.SMAPLENO2LIST = const [],
    this.SMAPLENO3 = '',
    this.SMAPLENO3UID = '',
    this.SMAPLENO3LIST = const [],
    this.SMAPLENO4 = '',
    this.SMAPLENO4UID = '',
    this.SMAPLENO4LIST = const [],
    this.SMAPLENO5 = '',
    this.SMAPLENO5UID = '',
    this.SMAPLENO5LIST = const [],
    this.SMAPLENO6 = '',
    this.SMAPLENO6UID = '',
    this.SMAPLENO6LIST = const [],
    this.SMAPLENO7 = '',
    this.SMAPLENO7UID = '',
    this.SMAPLENO7LIST = const [],
    this.SMAPLENO8 = '',
    this.SMAPLENO8UID = '',
    this.SMAPLENO8LIST = const [],
  });
  String SMAPLENO1, SMAPLENO1UID;
  String SMAPLENO2, SMAPLENO2UID;
  String SMAPLENO3, SMAPLENO3UID;
  String SMAPLENO4, SMAPLENO4UID;
  String SMAPLENO5, SMAPLENO5UID;
  String SMAPLENO6, SMAPLENO6UID;
  String SMAPLENO7, SMAPLENO7UID;
  String SMAPLENO8, SMAPLENO8UID;

  List<LISTITEMBODY> SMAPLENO1LIST;
  List<LISTITEMBODY> SMAPLENO2LIST;
  List<LISTITEMBODY> SMAPLENO3LIST;
  List<LISTITEMBODY> SMAPLENO4LIST;
  List<LISTITEMBODY> SMAPLENO5LIST;
  List<LISTITEMBODY> SMAPLENO6LIST;
  List<LISTITEMBODY> SMAPLENO7LIST;
  List<LISTITEMBODY> SMAPLENO8LIST;
}

class LISTITEMBODY {
  LISTITEMBODY({
    this.NO = '',
    this.BottleNo = '',
    this.InstrumentName = '',
    this.ItemName = '',
    this.Reportformat = '',
  });
  String NO;
  String BottleNo;
  String InstrumentName;
  String ItemName;
  String Reportformat;
}
