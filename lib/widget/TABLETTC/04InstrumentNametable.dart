// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class ItemNametableWidget extends StatelessWidget {
  ItemNametableWidget({
    super.key,
    this.BGColorMain,
    // this.TYPEtext,
    // this.SAMPLENAMEtext,
    this.ItemName,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.FUCHECK,
    this.isCHECK,
  });
  Color? BGColorMain;
  // String? TYPEtext;
  // String? SAMPLENAMEtext;
  String? ItemName;
  String? ACTIONtext;
  bool? isACTION;
  bool? isCHECK;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  Function(String)? F01;
  Function(String)? FUCHECK;

  @override
  Widget build(BuildContext context) {
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
                data: ItemName ?? "",
                tapCell: (v) {
                  if (F01 != null) {
                    F01!("F01");
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
            //   flex: 1,
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
