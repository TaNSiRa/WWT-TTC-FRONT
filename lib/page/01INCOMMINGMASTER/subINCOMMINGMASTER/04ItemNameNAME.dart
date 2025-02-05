import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/04MACHINENAMEtable.dart';

import '../../../widget/TABLE/08MINITABLE.dart';
import '../../../widget/TABLETTC/04InstrumentNametable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

late BuildContext MACHINENAMEtable_INCcontext;

class MACHINENAMEtable_INC extends StatelessWidget {
  MACHINENAMEtable_INC({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    MACHINENAMEtable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.MACHINENAME_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      }
    } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.MACHINENAME_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.METHOD_MACHINENAME_ACTION = '';
              INCOMMINGMASTERvar.MACHINE_MACHINENAME_ACTION = '';
              INCOMMINGMASTERvar.DESIMAL_MACHINENAME_ACTION = '';
              INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION = '';
              INCOMMINGMASTERvar.MACHINElist_MACHINENAME_ACTION = [];
              ITEMNAMEPOPUP(context);
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
          child: ItemNametableWidget(
            BGColorMain: Colors.grey.shade400,
            // TYPEtext: "TYPE",
            // SAMPLENAMEtext: "SAMPLENAMEtext",
            ItemName: "ItemName",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.MACHINENAME_SORT_F = 0;
              if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 0) {
                INCOMMINGMASTERvar.MACHINENAME_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 1) {
                INCOMMINGMASTERvar.MACHINENAME_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.MACHINENAME_SORT_ST == 2) {
                INCOMMINGMASTERvar.MACHINENAME_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_MACHINENAMEget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: ItemNametableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              // TYPEtext: _data[i].f11,
              // SAMPLENAMEtext: _data[i].f02,

              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_MACHINENAME = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_MACHINENAME_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_MACHINENAME_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.METHOD_MACHINENAME_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.MACHINE_MACHINENAME_ACTION = '';
                INCOMMINGMASTERvar.DESIMAL_MACHINENAME_ACTION = _data[i].f03;
                INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION = _data[i].f21;
                INCOMMINGMASTERvar.MACHINElist_MACHINENAME_ACTION =
                    _data[i].f02.split(',');

                print(INCOMMINGMASTERvar.MACHINElist_MACHINENAME_ACTION);

                ITEMNAMEPOPUP(context);
              },
              ItemName: _data[i].f01,
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void ITEMNAMEPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: ITEMNAMEACTION(),
      );
    },
  );
}

class ITEMNAMEACTION extends StatefulWidget {
  const ITEMNAMEACTION({super.key});

  @override
  State<ITEMNAMEACTION> createState() => _ITEMNAMEACTIONState();
}

class _ITEMNAMEACTIONState extends State<ITEMNAMEACTION> {
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
            sValue: INCOMMINGMASTERvar.MACHINE_MACHINENAME_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.MACHINE_MACHINENAME_ACTION = s;
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
            sValue: INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              MACHINENAMEtable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                  .add(INCOMMINGMASTERmsg_MACHINENAME_EDIT());
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
