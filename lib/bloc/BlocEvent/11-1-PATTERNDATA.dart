// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, prefer_if_null_operators

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/11PATTERNTTC/11PATTERNTTCVAR.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class PATTERNDATAGET_Event {}

class PATTERNDATAGET_MATCP extends PATTERNDATAGET_Event {}

class PATTERNDATAGET_flush extends PATTERNDATAGET_Event {}

class PATTERNDATAGET_Bloc extends Bloc<PATTERNDATAGET_Event, PATTERNDATAClass> {
  PATTERNDATAGET_Bloc() : super(PATTERNDATAClass()) {
    on<PATTERNDATAGET_MATCP>((event, emit) {
      return _PATTERNDATAGET_MATCP(PATTERNDATAClass(), emit);
    });
    on<PATTERNDATAGET_flush>((event, emit) {
      return _PATTERNDATAGET_flush(PATTERNDATAClass(), emit);
    });
  }
  Future<void> _PATTERNDATAGET_MATCP(PATTERNDATAClass toAdd, Emitter<PATTERNDATAClass> emit) async {
    PATTERNDATAClass output = PATTERNDATAClass();

    final response = await Dio().post(
      "${serverGB}TLA/GETPATTERNdata",
      data: {
        "UID": PATTERNTTCVAR.UID,
      },
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      if (databuff.length > 0) {
        output = (PATTERNDATAClass(
          SMAPLENO1: databuff[0]['SMAPLENO1'] != null ? databuff[0]['SMAPLENO1'].toString() : '',
          SMAPLENO1UID: databuff[0]['SMAPLENO1UID'] != null ? databuff[0]['SMAPLENO1UID'].toString() : '',
          SMAPLENO1LIST: [],
          SMAPLENO2: databuff[0]['SMAPLENO2'] != null ? databuff[0]['SMAPLENO2'].toString() : '',
          SMAPLENO2UID: databuff[0]['SMAPLENO2UID'] != null ? databuff[0]['SMAPLENO2UID'].toString() : '',
          SMAPLENO2LIST: [],
          SMAPLENO3: databuff[0]['SMAPLENO3'] != null ? databuff[0]['SMAPLENO3'].toString() : '',
          SMAPLENO3UID: databuff[0]['SMAPLENO3UID'] != null ? databuff[0]['SMAPLENO3UID'].toString() : '',
          SMAPLENO3LIST: [],
          SMAPLENO4: databuff[0]['SMAPLENO4'] != null ? databuff[0]['SMAPLENO4'].toString() : '',
          SMAPLENO4UID: databuff[0]['SMAPLENO4UID'] != null ? databuff[0]['SMAPLENO4UID'].toString() : '',
          SMAPLENO4LIST: [],
          SMAPLENO5: databuff[0]['SMAPLENO5'] != null ? databuff[0]['SMAPLENO5'].toString() : '',
          SMAPLENO5UID: databuff[0]['SMAPLENO5UID'] != null ? databuff[0]['SMAPLENO5UID'].toString() : '',
          SMAPLENO5LIST: [],
          SMAPLENO6: databuff[0]['SMAPLENO6'] != null ? databuff[0]['SMAPLENO6'].toString() : '',
          SMAPLENO6UID: databuff[0]['SMAPLENO6UID'] != null ? databuff[0]['SMAPLENO6UID'].toString() : '',
          SMAPLENO6LIST: [],
          SMAPLENO7: databuff[0]['SMAPLENO7'] != null ? databuff[0]['SMAPLENO7'].toString() : '',
          SMAPLENO7UID: databuff[0]['SMAPLENO7UID'] != null ? databuff[0]['SMAPLENO7UID'].toString() : '',
          SMAPLENO7LIST: [],
          SMAPLENO8: databuff[0]['SMAPLENO8'] != null ? databuff[0]['SMAPLENO8'].toString() : '',
          SMAPLENO8UID: databuff[0]['SMAPLENO8UID'] != null ? databuff[0]['SMAPLENO8UID'].toString() : '',
          SMAPLENO8LIST: [],
          SMAPLENO9: databuff[0]['SMAPLENO9'] != null ? databuff[0]['SMAPLENO9'].toString() : '',
          SMAPLENO9UID: databuff[0]['SMAPLENO9UID'] != null ? databuff[0]['SMAPLENO9UID'].toString() : '',
          SMAPLENO9LIST: [],
          SMAPLENO10: databuff[0]['SMAPLENO10'] != null ? databuff[0]['SMAPLENO10'].toString() : '',
          SMAPLENO10UID: databuff[0]['SMAPLENO10UID'] != null ? databuff[0]['SMAPLENO10UID'].toString() : '',
          SMAPLENO10LIST: [],
        ));

        PATTERNTTCVAR.SAMPLENO[1] =
            databuff[0]['SMAPLENO1'] != null ? databuff[0]['SMAPLENO1'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[2] =
            databuff[0]['SMAPLENO2'] != null ? databuff[0]['SMAPLENO2'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[3] =
            databuff[0]['SMAPLENO3'] != null ? databuff[0]['SMAPLENO3'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[4] =
            databuff[0]['SMAPLENO4'] != null ? databuff[0]['SMAPLENO4'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[5] =
            databuff[0]['SMAPLENO5'] != null ? databuff[0]['SMAPLENO5'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[6] =
            databuff[0]['SMAPLENO6'] != null ? databuff[0]['SMAPLENO6'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[7] =
            databuff[0]['SMAPLENO7'] != null ? databuff[0]['SMAPLENO7'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[8] =
            databuff[0]['SMAPLENO8'] != null ? databuff[0]['SMAPLENO8'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[9] =
            databuff[0]['SMAPLENO9'] != null ? databuff[0]['SMAPLENO9'].toString() : '';
        PATTERNTTCVAR.SAMPLENO[10] =
            databuff[0]['SMAPLENO10'] != null ? databuff[0]['SMAPLENO10'].toString() : '';

        PATTERNTTCVAR.SAMPLENOUID[1] =
            databuff[0]['SMAPLENO1UID'] != null ? databuff[0]['SMAPLENO1UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[2] =
            databuff[0]['SMAPLENO2UID'] != null ? databuff[0]['SMAPLENO2UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[3] =
            databuff[0]['SMAPLENO3UID'] != null ? databuff[0]['SMAPLENO3UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[4] =
            databuff[0]['SMAPLENO4UID'] != null ? databuff[0]['SMAPLENO4UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[5] =
            databuff[0]['SMAPLENO5UID'] != null ? databuff[0]['SMAPLENO5UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[6] =
            databuff[0]['SMAPLENO6UID'] != null ? databuff[0]['SMAPLENO6UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[7] =
            databuff[0]['SMAPLENO7UID'] != null ? databuff[0]['SMAPLENO7UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[8] =
            databuff[0]['SMAPLENO8UID'] != null ? databuff[0]['SMAPLENO8UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[9] =
            databuff[0]['SMAPLENO9UID'] != null ? databuff[0]['SMAPLENO9UID'].toString() : '';
        PATTERNTTCVAR.SAMPLENOUID[10] =
            databuff[0]['SMAPLENO10UID'] != null ? databuff[0]['SMAPLENO10UID'].toString() : '';

        databuff[0]['SMAPLENO1LIST'] =
            databuff[0]['SMAPLENO1LIST'] != null ? databuff[0]['SMAPLENO1LIST'] : [];
        databuff[0]['SMAPLENO2LIST'] =
            databuff[0]['SMAPLENO2LIST'] != null ? databuff[0]['SMAPLENO2LIST'] : [];
        databuff[0]['SMAPLENO3LIST'] =
            databuff[0]['SMAPLENO3LIST'] != null ? databuff[0]['SMAPLENO3LIST'] : [];
        databuff[0]['SMAPLENO4LIST'] =
            databuff[0]['SMAPLENO4LIST'] != null ? databuff[0]['SMAPLENO4LIST'] : [];
        databuff[0]['SMAPLENO5LIST'] =
            databuff[0]['SMAPLENO5LIST'] != null ? databuff[0]['SMAPLENO5LIST'] : [];
        databuff[0]['SMAPLENO6LIST'] =
            databuff[0]['SMAPLENO6LIST'] != null ? databuff[0]['SMAPLENO6LIST'] : [];
        databuff[0]['SMAPLENO7LIST'] =
            databuff[0]['SMAPLENO7LIST'] != null ? databuff[0]['SMAPLENO7LIST'] : [];
        databuff[0]['SMAPLENO8LIST'] =
            databuff[0]['SMAPLENO8LIST'] != null ? databuff[0]['SMAPLENO8LIST'] : [];
        databuff[0]['SMAPLENO9LIST'] =
            databuff[0]['SMAPLENO9LIST'] != null ? databuff[0]['SMAPLENO9LIST'] : [];
        databuff[0]['SMAPLENO10LIST'] =
            databuff[0]['SMAPLENO10LIST'] != null ? databuff[0]['SMAPLENO10LIST'] : [];

        List<LISTITEMBODY> data1 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO1LIST'].length; i++) {
          data1.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO1LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO1LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO1LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO1LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO1LIST = data1;

        List<LISTITEMBODY> data2 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO2LIST'].length; i++) {
          data2.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO2LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO2LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO2LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO2LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO2LIST = data2;

        List<LISTITEMBODY> data3 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO3LIST'].length; i++) {
          data3.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO3LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO3LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO3LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO3LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO3LIST = data3;

        List<LISTITEMBODY> data4 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO4LIST'].length; i++) {
          data4.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO4LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO4LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO4LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO4LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO4LIST = data4;

        List<LISTITEMBODY> data5 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO5LIST'].length; i++) {
          data5.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO5LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO5LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO5LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO5LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO5LIST = data5;

        List<LISTITEMBODY> data6 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO6LIST'].length; i++) {
          data6.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO6LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO6LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO6LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO6LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO6LIST = data6;

        List<LISTITEMBODY> data7 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO7LIST'].length; i++) {
          data7.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO7LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO7LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO7LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO7LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO7LIST = data7;

        List<LISTITEMBODY> data8 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO8LIST'].length; i++) {
          data8.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO8LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO8LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO8LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO8LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO8LIST = data8;

        List<LISTITEMBODY> data9 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO9LIST'].length; i++) {
          data9.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO9LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO9LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO9LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO9LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO9LIST = data9;

        List<LISTITEMBODY> data10 = [];
        for (var i = 0; i < databuff[0]['SMAPLENO10LIST'].length; i++) {
          data10.add(LISTITEMBODY(
            NO: (i + 1).toString(),
            BottleNo: databuff[0]['SMAPLENO10LIST'][i]['BottleNOset'].toString(),
            InstrumentName: databuff[0]['SMAPLENO10LIST'][i]['INSTRUMENTNAME'].toString(),
            ItemName: databuff[0]['SMAPLENO10LIST'][i]['ITEMNAME'].toString(),
            Reportformat: databuff[0]['SMAPLENO10LIST'][i]['Reportformat'].toString(),
          ));
        }
        output.SMAPLENO10LIST = data10;
      }
    }

    emit(output);
  }

  Future<void> _PATTERNDATAGET_flush(PATTERNDATAClass toAdd, Emitter<PATTERNDATAClass> emit) async {
    PATTERNDATAClass output = PATTERNDATAClass();
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
    this.SMAPLENO9 = '',
    this.SMAPLENO9UID = '',
    this.SMAPLENO9LIST = const [],
    this.SMAPLENO10 = '',
    this.SMAPLENO10UID = '',
    this.SMAPLENO10LIST = const [],
  });
  String SMAPLENO1, SMAPLENO1UID;
  String SMAPLENO2, SMAPLENO2UID;
  String SMAPLENO3, SMAPLENO3UID;
  String SMAPLENO4, SMAPLENO4UID;
  String SMAPLENO5, SMAPLENO5UID;
  String SMAPLENO6, SMAPLENO6UID;
  String SMAPLENO7, SMAPLENO7UID;
  String SMAPLENO8, SMAPLENO8UID;
  String SMAPLENO9, SMAPLENO9UID;
  String SMAPLENO10, SMAPLENO10UID;

  List<LISTITEMBODY> SMAPLENO1LIST;
  List<LISTITEMBODY> SMAPLENO2LIST;
  List<LISTITEMBODY> SMAPLENO3LIST;
  List<LISTITEMBODY> SMAPLENO4LIST;
  List<LISTITEMBODY> SMAPLENO5LIST;
  List<LISTITEMBODY> SMAPLENO6LIST;
  List<LISTITEMBODY> SMAPLENO7LIST;
  List<LISTITEMBODY> SMAPLENO8LIST;
  List<LISTITEMBODY> SMAPLENO9LIST;
  List<LISTITEMBODY> SMAPLENO10LIST;
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
