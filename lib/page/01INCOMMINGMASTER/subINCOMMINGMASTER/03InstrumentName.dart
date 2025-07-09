// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLETTC/03InstrumentNametable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';
import 'AddOnCustom.dart';

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
          child: buildActionButton(
            label: 'NEW',
            icon: Icons.add,
            color: Colors.blue,
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
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
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
                context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_ITEMSget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: i.isEven ? Colors.white : Colors.grey.shade50,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 0.5,
                ),
              ),
            ),
            child: InstrumentNametableWidget(
              BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
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
                  context.read<INCOMMINGMASTERmsg_Bloc>().add(INCOMMINGMASTERmsg_INSTRUMENTNAME_DELETE());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION = _data[i].f01;
                // INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.RESULTFORMAT_ITEMS_ACTION = _data[i].f03;
                INCOMMINGMASTERvar.GRAPHTYPE_ITEMS_ACTION = _data[i].f04;
                INCOMMINGMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = _data[i].f05;
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
      return const Dialog(
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
    return SizedBox(
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade600,
                    Colors.blue.shade800,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'INSTRUMENT NAME',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  buildInputField(
                    label: 'Instrument Name',
                    icon: Icons.business,
                    widget: ComInputText(
                      nLimitedChar: 100,
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
                  ),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        ITEMStable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                            .add(INCOMMINGMASTERmsg_ITEMS_EDIT());
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green.shade600,
                              Colors.green.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'SAVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
