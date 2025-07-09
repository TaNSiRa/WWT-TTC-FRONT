// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_TYPEget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_UNITget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_ITEMSget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_MACHINENAMEget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_METHODEget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_SPECIALSPECget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_CALCULATEget extends INCOMMINGMASTER_Event {}

class INCOMMINGMASTER_COMMENTget extends INCOMMINGMASTER_Event {}

//INCOMMINGMASTER_COMMENTget
class INCOMMINGMASTER_Bloc extends Bloc<INCOMMINGMASTER_Event, DatasetWithSatatus> {
  INCOMMINGMASTER_Bloc() : super(DatasetWithSatatus(data: [])) {
    on<INCOMMINGMASTER_TYPEget>((event, emit) {
      return _INCOMMINGMASTER_TYPEget(DatasetWithSatatus(data: []), emit);
    });
    on<INCOMMINGMASTER_UNITget>((event, emit) {
      return _INCOMMINGMASTER_UNITget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_ITEMSget>((event, emit) {
      return _INCOMMINGMASTER_ITEMSget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_MACHINENAMEget>((event, emit) {
      return _INCOMMINGMASTER_MACHINENAMEget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_METHODEget>((event, emit) {
      return _INCOMMINGMASTER_METHODEget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_SPECIALSPECget>((event, emit) {
      return _INCOMMINGMASTER_SPECIALSPECget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_CALCULATEget>((event, emit) {
      return _INCOMMINGMASTER_CALCULATEget(DatasetWithSatatus(data: []), emit);
    });

    on<INCOMMINGMASTER_COMMENTget>((event, emit) {
      return _INCOMMINGMASTER_COMMENTget(DatasetWithSatatus(data: []), emit);
    });
  }
  Future<void> _INCOMMINGMASTER_TYPEget(DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    // --------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETTYPE",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "GETTYPE",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['TYPE'] != null ? databuff[i]['TYPE'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _INCOMMINGMASTER_UNITget(DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETSAMPLENAME",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "GETSAMPLENAME",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['SAMPLENAME'] != null ? databuff[i]['SAMPLENAME'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _INCOMMINGMASTER_ITEMSget(DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETINSTRUMENTNAME",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "INSTRUMENTNAME",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['INSTRUMENTNAME'] != null ? databuff[i]['INSTRUMENTNAME'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _INCOMMINGMASTER_MACHINENAMEget(
      DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETITEMNAME",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "ITEMNAME",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['ITEMNAME'] != null ? databuff[i]['ITEMNAME'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _INCOMMINGMASTER_METHODEget(DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETCUSTNAME",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "CUSTNAME",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['CUSTNAME'] != null ? databuff[i]['CUSTNAME'].toString() : "",
            f02: databuff[i]['ADDRESS'] != null ? databuff[i]['ADDRESS'].toString() : "",
            f03: databuff[i]['DEFAULTPERSON'] != null ? databuff[i]['DEFAULTPERSON'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }

    emit(output);
  }

  Future<void> _INCOMMINGMASTER_SPECIALSPECget(
      DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    final response = await Dio().post(
      "${serverGB}TLA/GETWWTITEM",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      output = DatasetWithSatatus(
        status: "OK",
        position: "WWTITEM",
        data: [],
      );
      if (databuff.length > 0) {
        for (int i = 0; i < databuff.length; i++) {
          output.data.add(dataset(
            id: i,
            f01: databuff[i]['INSTRUMENTNAME'] != null ? databuff[i]['INSTRUMENTNAME'].toString() : "",
            f02: databuff[i]['ITEMNAME'] != null ? databuff[i]['ITEMNAME'].toString() : "",
            f03: databuff[i]['BOTTLENO'] != null ? databuff[i]['BOTTLENO'].toString() : "",
            f04: databuff[i]['REPORTFORMAT'] != null ? databuff[i]['REPORTFORMAT'].toString() : "",
            f21: databuff[i]['masterID'] != null ? databuff[i]['masterID'].toString() : "",
          ));
        }
      }
    } else {
      //
    }
    // print(output.data);
    emit(output);
  }

  Future<void> _INCOMMINGMASTER_CALCULATEget(
      DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );

    // final response = await Dio().post(
    //   serverGB + "GET_CALCULATEget_INCOMMING",
    //   data: {},
    // );

    // if (response.statusCode == 200) {
    //   // var databuff = jsonDecode(response.body);
    //   var databuff = response.data;
    //   // print(databuff);
    //   output = DatasetWithSatatus(
    //     status: "OK",
    //     position: "CALCULATEget",
    //     data: [],
    //   );

    //   if (databuff.length > 0) {
    //     for (int i = 0; i < databuff.length; i++) {
    //       output.data.add(dataset(
    //         id: i,
    //         f01: databuff[i]['CALCULATE'] != null
    //             ? databuff[i]['CALCULATE'].toString()
    //             : "",
    //         f02: databuff[i]['FORMULA'] != null
    //             ? databuff[i]['FORMULA'].toString()
    //             : "",

    //         //
    //         f41: databuff[i]['X'] != null ? databuff[i]['X'].toString() : "",
    //         f42: databuff[i]['Y'] != null ? databuff[i]['Y'].toString() : "",
    //         f43: databuff[i]['Z'] != null ? databuff[i]['Z'].toString() : "",
    //         f44: databuff[i]['I'] != null ? databuff[i]['I'].toString() : "",
    //         f45: databuff[i]['K1'] != null ? databuff[i]['K1'].toString() : "",
    //         f46: databuff[i]['K2'] != null ? databuff[i]['K2'].toString() : "",
    //         f47: databuff[i]['K3'] != null ? databuff[i]['K3'].toString() : "",
    //         //
    //         f51: databuff[i]['Xb'] != null ? databuff[i]['Xb'].toString() : "",
    //         f52: databuff[i]['Yb'] != null ? databuff[i]['Yb'].toString() : "",
    //         f53: databuff[i]['Zb'] != null ? databuff[i]['Zb'].toString() : "",
    //         f54: databuff[i]['Ib'] != null ? databuff[i]['Ib'].toString() : "",
    //         f55:
    //             databuff[i]['K1b'] != null ? databuff[i]['K1b'].toString() : "",
    //         f56:
    //             databuff[i]['K2b'] != null ? databuff[i]['K2b'].toString() : "",
    //         f57:
    //             databuff[i]['K3b'] != null ? databuff[i]['K4b'].toString() : "",
    //         //

    //         f21: databuff[i]['masterID'] != null
    //             ? databuff[i]['masterID'].toString()
    //             : "",
    //       ));
    //     }
    //   }
    // } else {
    //   //
    // }

    emit(output);
  }

  Future<void> _INCOMMINGMASTER_COMMENTget(DatasetWithSatatus toAdd, Emitter<DatasetWithSatatus> emit) async {
    //--------------------------------------------------------
    DatasetWithSatatus output = DatasetWithSatatus(
      status: "",
      position: "",
      data: [],
    );
    //--------------------------------------------------------
    // final response = await Dio().post(
    //   serverGB + "GET_COMMENT_INCOMMING",
    //   data: {},
    // );

    // if (response.statusCode == 200) {
    //   // var databuff = jsonDecode(response.body);
    //   var databuff = response.data;
    //   // print(databuff);
    //   output = DatasetWithSatatus(
    //     status: "OK",
    //     position: "COMMENTget",
    //     data: [],
    //   );
    //   if (databuff.length > 0) {
    //     for (int i = 0; i < databuff.length; i++) {
    //       output.data.add(dataset(
    //         id: i,
    //         f01: databuff[i]['COMMENT'] != null
    //             ? databuff[i]['COMMENT'].toString()
    //             : "",
    //         f21: databuff[i]['masterID'] != null
    //             ? databuff[i]['masterID'].toString()
    //             : "",
    //       ));
    //     }
    //   }
    // } else {
    //   //
    // }
    emit(output);
  }
}

class DatasetWithSatatus {
  DatasetWithSatatus({
    this.status = '',
    this.position = '',
    required this.data,
  });
  String status;
  String position;
  List<dataset> data;
}

//_INCOMMINGMASTER_COMMENTget
