import 'package:flutter/material.dart';

import '../TABLE/00EACHCALL.dart';

class SAMPLETABLE extends StatelessWidget {
  SAMPLETABLE({
    super.key,
    this.BGColorMain,
    this.isACTION,
    this.F01,
    this.F02,
    this.F03,
    this.F04,
    this.F05,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    this.STATUS,
    this.EditFN,
  });
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  String? ACTION, F01, F02, F03, F04, F05, PART, PARTNAME, MATERIAL, STATUS;
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
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: F03 ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: F04 ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: F05 ?? "",
              tapCell: (v) {},
            ),
          ),
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
