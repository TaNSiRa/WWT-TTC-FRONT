import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/03ITEMStable.dart';
import '../../../widget/TABLETTC/03InstrumentNametable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

late BuildContext ITEMStable_INCcontext;

class ITEMStable_INC extends StatelessWidget {
  ITEMStable_INC({
    super.key,
    this.data,
    this.TYPEdd,
  });
  List<dataset>? data;
  List<MapEntry<String, String>>? TYPEdd;

  @override
  Widget build(BuildContext context) {
    ITEMStable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      } else if (INCOMMINGMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((a, b) => a.f03.compareTo(b.f03));
      }
    } else if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      } else if (INCOMMINGMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((b, a) => a.f03.compareTo(b.f03));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.TYPEid_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.RESULTFORMAT_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.GRAPHTYPE_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.DOCUMENTS_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.CALCULATE_ITEMS_ACTION = '';
              INCOMMINGMASTERvar.masterID_ITEMS_ACTION = '';
              INSTRUMENTNAMEPOPUP(context);
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
          child: InstrumentNametableWidget(
            BGColorMain: Colors.grey.shade400,
            // TYPEtext: "TYPE",
            // SAMPLENAMEtext: "SAMPLENAMEtext",
            InstrumentName: "Instrument Name",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.ITEMS_SORT_F = 0;
              if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 0) {
                INCOMMINGMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 1) {
                INCOMMINGMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.ITEMS_SORT_ST == 2) {
                INCOMMINGMASTERvar.ITEMS_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_ITEMSget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: InstrumentNametableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              // TYPEtext: _data[i].f11,
              // SAMPLENAMEtext: _data[i].f02,

              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_ITEMS = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_ITEMS_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_ITEMS_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.TYPEid_ITEMS_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.RESULTFORMAT_ITEMS_ACTION = _data[i].f03;
                INCOMMINGMASTERvar.GRAPHTYPE_ITEMS_ACTION = _data[i].f04;
                INCOMMINGMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION =
                    _data[i].f05;
                INCOMMINGMASTERvar.DOCUMENTS_ITEMS_ACTION = _data[i].f06;
                INCOMMINGMASTERvar.CALCULATE_ITEMS_ACTION = _data[i].f07;
                INCOMMINGMASTERvar.masterID_ITEMS_ACTION = _data[i].f21;
                INSTRUMENTNAMEPOPUP(context);
              },
              InstrumentName: _data[i].f01,
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void INSTRUMENTNAMEPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: INSTRUMENTNAMEACTION(),
      );
    },
  );
}

class INSTRUMENTNAMEACTION extends StatefulWidget {
  const INSTRUMENTNAMEACTION({super.key});

  @override
  State<INSTRUMENTNAMEACTION> createState() => _INSTRUMENTNAMEACTIONState();
}

class _INSTRUMENTNAMEACTIONState extends State<INSTRUMENTNAMEACTION> {
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
            sValue: INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION = s;
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
            sValue: INCOMMINGMASTERvar.masterID_ITEMS_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.masterID_ITEMS_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              ITEMStable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                  .add(INCOMMINGMASTERmsg_ITEMS_EDIT());
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
