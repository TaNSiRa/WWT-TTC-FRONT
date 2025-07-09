// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class WWTITEMtableWidget extends StatelessWidget {
  WWTITEMtableWidget({
    super.key,
    this.BGColorMain,
    // this.TYPEtext,
    // this.SAMPLENAMEtext,
    this.InstrumentName,
    this.ItemName,
    this.BottleNo,
    this.ReportFormat,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.F02,
    this.F03,
    this.F04,
    this.FUCHECK,
    this.isCHECK,
  });
  Color? BGColorMain;
  // String? TYPEtext;
  // String? SAMPLENAMEtext;
  String? InstrumentName;
  String? ItemName;
  String? BottleNo;
  String? ReportFormat;
  String? ACTIONtext;
  bool? isACTION;
  bool? isCHECK;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  Function(String)? F01;
  Function(String)? F02;
  Function(String)? F03;
  Function(String)? F04;
  Function(String)? FUCHECK;

  @override
  Widget build(BuildContext context) {
    // print(F01);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            // //------------------------------  OOP side

            // Expanded(
            //   flex: 1,
            //   child: SizedBox(
            //     height: 24,
            //     width: 24,
            //     child: CheckBoxC(
            //       value: isCHECK ?? false,
            //       getChbox: (value) {
            //         if (FUCHECK != null) {
            //           FUCHECK!(value.toString());
            //         }
            //       },
            //     ),
            //   ),
            // ),

            // //------------------------------
            // Expanded(
            //   flex: 1,
            //   child: EACHCELL(
            //     data: TYPEtext ?? "",
            //     tapCell: (v) {
            //       if (F01 != null) {
            //         F01!("F01");
            //       }
            //     },
            //   ),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: EACHCELL(
            //     data: SAMPLENAMEtext ?? "",
            //     tapCell: (v) {
            //       if (F01 != null) {
            //         F01!("F01");
            //       }
            //     },
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: EACHCELL(
                data: InstrumentName ?? "",
                tapCell: (v) {
                  if (F01 != null) {
                    F01!("F01");
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: EACHCELL(
                data: ItemName ?? "",
                tapCell: (v) {
                  if (F02 != null) {
                    F02!("F02");
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: EACHCELL(
                data: BottleNo ?? "",
                tapCell: (v) {
                  if (F03 != null) {
                    F03!("F03");
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: EACHCELL(
                data: ReportFormat ?? "",
                tapCell: (v) {
                  if (F04 != null) {
                    F04!("F04");
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: isACTION ?? false
                  ? ACTIONCELL(
                      DeleteFN: (v) {
                        DeleteFN!("DeleteFN");
                      },
                      EditFN: (v) {
                        EditFN!("EditFN");
                      },
                    )
                  : EACHCELL(
                      data: ACTIONtext ?? "",
                      tapCell: (v) {},
                    ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: EACHCELL(
            //     data: masterIDtext ?? "",
            //     tapCell: (v) {},
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
