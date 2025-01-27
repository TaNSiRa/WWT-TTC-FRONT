import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';

import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/02UNITtable.dart';
import '../../../widget/TABLETTC/02SAMPLENAMEtable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

//context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());

late BuildContext UNITStable_INCcontext;

class UNITStable_INC extends StatelessWidget {
  UNITStable_INC({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    UNITStable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.UNIT_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.UNIT_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.UNIT_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.UNIT_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      }
    } else if (INCOMMINGMASTERvar.UNIT_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.UNIT_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.UNIT_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.iscontrol = true;
              INCOMMINGMASTERvar.TYPEid_UNIT_ACTION = "";
              INCOMMINGMASTERvar.UNIT_UNIT_ACTION = "";
              INCOMMINGMASTERvar.masterID_UNIT_ACTION = "";
              SAMEPLENAMEPOPUP(context);
            },
            child: Container(
              height: 30,
              width: 100,
              color: Colors.blue,
              child: const Center(
                  child: Text(
                "NEW",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: SAMPLENAMEtableWidget(
            BGColorMain: Colors.grey.shade400,
            SAMPLENAMEtext: "SAMPLENAMEtext",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.UNIT_SORT_F = 0;
              if (INCOMMINGMASTERvar.UNIT_SORT_ST == 0) {
                INCOMMINGMASTERvar.UNIT_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.UNIT_SORT_ST == 1) {
                INCOMMINGMASTERvar.UNIT_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.UNIT_SORT_ST == 2) {
                INCOMMINGMASTERvar.UNIT_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_UNITget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: SAMPLENAMEtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              SAMPLENAMEtext: _data[i].f11,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_UNIT = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_UNIT_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_UNIT_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.iscontrol = true;
                INCOMMINGMASTERvar.TYPEid_UNIT_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.UNIT_UNIT_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.masterID_UNIT_ACTION = _data[i].f21;
                SAMEPLENAMEPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void SAMEPLENAMEPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SAMEPLENAMEACTION(),
      );
    },
  );
}

class SAMEPLENAMEACTION extends StatefulWidget {
  const SAMEPLENAMEACTION({super.key});

  @override
  State<SAMEPLENAMEACTION> createState() => _SAMEPLENAMEACTIONState();
}

class _SAMEPLENAMEACTIONState extends State<SAMEPLENAMEACTION> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 450,
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            child: Center(
              child: Text("SAMEPLE NAME"),
            ),
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "SAMEPLE NAME",
            height: 40,
            width: 400,
            isContr: INCOMMINGMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                INCOMMINGMASTERvar.iscontrol = input;
              });
            },
            sValue: INCOMMINGMASTERvar.TYPE_TYPE_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.TYPE_TYPE_ACTION = s;
            },
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "masterID",
            height: 40,
            width: 400,
            isContr: INCOMMINGMASTERvar.iscontrol,
            // isEnabled: INCOMMINGMASTERvar.masterID_ACTION_isEnabled,
            fnContr: (input) {
              setState(() {
                INCOMMINGMASTERvar.iscontrol = input;
              });
            },
            sValue: INCOMMINGMASTERvar.masterID_TYPE_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.masterID_TYPE_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              UNITStable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                  .add(INCOMMINGMASTERmsg_TYPE_EDIT());
            },
            child: Container(
              height: 40,
              width: 200,
              color: Colors.blue,
              child: const Center(
                  child: Text(
                "SAVE",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
