// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import '../TABLE/00EACHCALL.dart';

class TTF01ATTERNTABLE extends StatelessWidget {
  TTF01ATTERNTABLE({
    super.key,
    this.BGColorMain,
    this.isACTION,
    this.F01,
    this.F02,
    this.F03,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    this.STATUS,
    this.EditFN,
    this.DeleteFN,
  });
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  String? ACTION, F01, F02, F03, PART, PARTNAME, MATERIAL, STATUS;
  bool? isACTION;
  Color? BGColorMain;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: F01 ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: F02 ?? "",
              tapCell: (v) {},
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: EACHCELL(
          //     data: F03 ?? "",
          //     tapCell: (v) {},
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: isACTION ?? false
                ? ACTIONCELL(
                    isdelete: true,
                    DeleteFN: (v) {
                      if (DeleteFN != null) {
                        DeleteFN!("DeleteFN");
                      }
                    },
                    EditFN: (v) {
                      if (EditFN != null) {
                        EditFN!("EditFN");
                      }
                    },
                  )
                : EACHCELL(
                    data: "ACTION",
                    tapCell: (v) {},
                  ),
          ),
        ],
      ),
    );
  }
}
