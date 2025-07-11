// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/01INCOMMINGMASTER/INCOMMINGMASTERmain.dart';
import '../../page/01INCOMMINGMASTER/INCOMMINGMASTERvar.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/01TYPES.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/02SAMPLENAME.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/03InstrumentName.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/04ItemNameNAME.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/05CUST.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/06WWTITEM.dart';
import '01-1-INCOMMINGMASTERget.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_TYPE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_UNIT_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_ITEMS_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_MACHINENAME_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_METHODE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SPECIFICATION_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_CALCULATE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_COMMENT_DROP extends INCOMMINGMASTERmsg_Event {}

//----------------------------------------------------------------

class INCOMMINGMASTERmsg_TYPE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_UNIT_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_ITEMS_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_MACHINENAME_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_METHODE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SPECIFICATION_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_CALCULATE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_COMMENT_EDIT extends INCOMMINGMASTERmsg_Event {}

//----------------------------------------------------------------

class INCOMMINGMASTERmsg_TYPE_DELETE extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SAMPLENAME_DELETE extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_INSTRUMENTNAME_DELETE extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_ITEMNAME_DELETE extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_CUSTOMER_DELETE extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SPECIFICATION_DELETE extends INCOMMINGMASTERmsg_Event {}

//------------------------------------------------------------------

class INCOMMINGMASTERmsg_FULSH extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_Bloc extends Bloc<INCOMMINGMASTERmsg_Event, String> {
  INCOMMINGMASTERmsg_Bloc() : super('') {
    on<INCOMMINGMASTERmsg_TYPE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_TYPE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_UNIT_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_UNIT_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_ITEMS_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_ITEMS_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_MACHINENAME_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_MACHINENAME_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_METHODE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_METHODE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_SPECIFICATION_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_SPECIFICATION_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_CALCULATE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_CALCULATE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_COMMENT_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_COMMENT_DROP('', emit);
    });
    //----------------------------------------------

    on<INCOMMINGMASTERmsg_TYPE_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_TYPE_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_UNIT_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_UNIT_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_ITEMS_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_ITEMS_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_MACHINENAME_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_MACHINENAME_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_METHODE_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_METHODE_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_SPECIFICATION_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_SPECIFICATION_EDIT('', emit);
    });

    //----------------------------------------------

    on<INCOMMINGMASTERmsg_TYPE_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_TYPE_DELETE('', emit);
    });

    on<INCOMMINGMASTERmsg_SAMPLENAME_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_SAMPLENAME_DELETE('', emit);
    });

    on<INCOMMINGMASTERmsg_INSTRUMENTNAME_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_INSTRUMENTNAME_DELETE('', emit);
    });

    on<INCOMMINGMASTERmsg_ITEMNAME_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_ITEMNAME_DELETE('', emit);
    });

    on<INCOMMINGMASTERmsg_CUSTOMER_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_CUSTOMER_DELETE('', emit);
    });

    on<INCOMMINGMASTERmsg_SPECIFICATION_DELETE>((event, emit) {
      return _INCOMMINGMASTERmsg_SPECIFICATION_DELETE('', emit);
    });

    // on<INCOMMINGMASTERmsg_CALCULATE_EDIT>((event, emit) {
    //   return _INCOMMINGMASTERmsg_CALCULATE_EDIT('', emit);
    // });

    // on<INCOMMINGMASTERmsg_COMMENT_EDIT>((event, emit) {
    //   return _INCOMMINGMASTERmsg_COMMENT_EDIT('', emit);
    // });

    //INCOMMINGMASTERmsg_CALCULATE_EDIT

    //

    on<INCOMMINGMASTERmsg_FULSH>((event, emit) {
      return _INCOMMINGMASTERmsg_FULSH('', emit);
    });
  }

  Future<void> _INCOMMINGMASTERmsg_TYPE_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      "${serverGB}DROP_TYPE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_TYPE,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_UNIT_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_UNIT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_UNIT,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_ITEMS_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_ITEMS_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_ITEMS,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_ITEMSget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_MACHINENAME_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_MACHINENAME_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_MACHINENAME,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_MACHINENAMEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_METHODE_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_METHODE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_METHODE,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_METHODEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_SPECIFICATION_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_SPECIALSPECget());
    emit(output);
  }

  //INCOMMINGMASTERmsg_CALCULATE_DROP
  Future<void> _INCOMMINGMASTERmsg_CALCULATE_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}DROP_CALCULATE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_CALCULATE,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_CALCULATEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_COMMENT_DROP(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      "${serverGB}DROP_COMMENT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_COMMENT,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_COMMENTget());
    emit(output);
  }

  //-------------------------------------

  Future<void> _INCOMMINGMASTERmsg_TYPE_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETTYPE",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_TYPE_ACTION,
        "TYPE": INCOMMINGMASTERvar.TYPE_TYPE_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());
    Navigator.pop(TYPEStable_INCContext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_UNIT_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETSAMPLENAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_UNIT_ACTION,
        "SAMPLENAME": INCOMMINGMASTERvar.UNIT_UNIT_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());
    Navigator.pop(UNITStable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_ITEMS_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETINSTRUMENTNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_ITEMS_ACTION,
        "INSTRUMENTNAME": INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_ITEMSget());
    Navigator.pop(ITEMStable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_MACHINENAME_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETITEMNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION,
        "ITEMNAME": INCOMMINGMASTERvar.METHOD_MACHINENAME_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_MACHINENAMEget());
    Navigator.pop(MACHINENAMEtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_METHODE_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETCUSTNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_METHOD_ACTION,
        "ADDRESS": INCOMMINGMASTERvar.ADDRESS_METHOD_ACTION,
        "CUSTNAME": INCOMMINGMASTERvar.ITEM_METHOD_ACTION,
        "DEFAULTPERSON": INCOMMINGMASTERvar.DEFAULTPERSON_METHOD_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_METHODEget());
    Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_EDIT(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/SETWWTITEM",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION,
        "INSTRUMENTNAME": INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION,
        "ITEMNAME": INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION,
        "BOTTLENO": INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION,
        "REPORTFORMAT": INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_SPECIALSPECget());
    Navigator.pop(WWTITEMtable_INCcontext);
    emit(output);
  }

  //-------------------------------------

  Future<void> _INCOMMINGMASTERmsg_TYPE_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETETYPE",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_TYPE,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SAMPLENAME_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETESAMPLENAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_UNIT,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_INSTRUMENTNAME_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETEINSTRUMENTNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_ITEMS,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_ITEMSget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_ITEMNAME_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETEITEMNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_MACHINENAME,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_MACHINENAMEget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_CUSTOMER_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETECUSTNAME",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_METHOD_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_METHODEget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_DELETE(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      "${serverGB}TLA/DELETEWWTITEM",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_SPECIALSPECget());
    // Navigator.pop(CUSTtable_INCcontext);
    emit(output);
  }

  // Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_EDIT(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';
  //   final response = await Dio().post(
  //     serverGB + "EDIT_SPECIFICATION_INCOMMING",
  //     data: {
  //       "ITEMs": INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION,
  //       "SPECIFICATION": INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION,
  //       "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION,
  //     },
  //   );
  //   INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
  //       .add(INCOMMINGMASTER_SPECIALSPECget());
  //   Navigator.pop(SPECIALSPECtable_INCcontext);
  //   emit(output);
  // }

  // Future<void> _INCOMMINGMASTERmsg_CALCULATE_EDIT(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';
  //   final response = await Dio().post(
  //     serverGB + "EDIT_CALCULATE_INCOMMING",
  //     data: {
  //       "CALCULATE": INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION,
  //       "FORMULA": INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION,
  //       "X": INCOMMINGMASTERvar.X_CALCULATE_ACTION,
  //       "Xb": INCOMMINGMASTERvar.Xb_CALCULATE_ACTION,
  //       "Y": INCOMMINGMASTERvar.Y_CALCULATE_ACTION,
  //       "Yb": INCOMMINGMASTERvar.Yb_CALCULATE_ACTION,
  //       "Z": INCOMMINGMASTERvar.Z_CALCULATE_ACTION,
  //       "Zb": INCOMMINGMASTERvar.Zb_CALCULATE_ACTION,
  //       "I": INCOMMINGMASTERvar.I_CALCULATE_ACTION,
  //       "Ib": INCOMMINGMASTERvar.Ib_CALCULATE_ACTION,
  //       "K1": INCOMMINGMASTERvar.K1_CALCULATE_ACTION,
  //       "K1b": INCOMMINGMASTERvar.K1b_CALCULATE_ACTION,
  //       "K2": INCOMMINGMASTERvar.K2_CALCULATE_ACTION,
  //       "K2b": INCOMMINGMASTERvar.K2b_CALCULATE_ACTION,
  //       "K3": INCOMMINGMASTERvar.K3_CALCULATE_ACTION,
  //       "K3b": INCOMMINGMASTERvar.K3b_CALCULATE_ACTION,
  //       "masterID": INCOMMINGMASTERvar.masterID_CALCULATE_ACTION,
  //     },
  //   );
  //   INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
  //       .add(INCOMMINGMASTER_CALCULATEget());
  //   Navigator.pop(CALCULATEtable_INCcontext);
  //   emit(output);
  // }

  // Future<void> _INCOMMINGMASTERmsg_COMMENT_EDIT(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';
  //   final response = await Dio().post(
  //     serverGB + "EDIT_COMMENT_INCOMMING",
  //     data: {
  //       "masterID": INCOMMINGMASTERvar.masterID_COMMENT_ACTION,
  //       "COMMENT": INCOMMINGMASTERvar.COMMENT_COMMENT_ACTION,
  //     },
  //   );
  //   INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
  //       .add(INCOMMINGMASTER_COMMENTget());
  //   Navigator.pop(COMMENTtable_INCContext);
  //   emit(output);
  // }

  //

  Future<void> _INCOMMINGMASTERmsg_FULSH(String toAdd, Emitter<String> emit) async {
    String output = '';

    emit(output);
  }
}
