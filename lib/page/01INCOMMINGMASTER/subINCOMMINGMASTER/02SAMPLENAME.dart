// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';

import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLETTC/02SAMPLENAMEtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';
import 'AddOnCustom.dart';

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
          child: buildActionButton(
            label: 'NEW',
            icon: Icons.add,
            color: Colors.blue,
            onTap: () {
              INCOMMINGMASTERvar.iscontrol = true;
              INCOMMINGMASTERvar.TYPEid_UNIT_ACTION = "";
              INCOMMINGMASTERvar.UNIT_UNIT_ACTION = "";
              INCOMMINGMASTERvar.masterID_UNIT_ACTION = "";
              SAMEPLENAMEPOPUP(context);
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
                context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());
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
            child: SAMPLENAMEtableWidget(
              BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_UNIT = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_UNIT_DROP());
                POPUPyn(context, (v) {
                  context.read<INCOMMINGMASTERmsg_Bloc>().add(INCOMMINGMASTERmsg_SAMPLENAME_DELETE());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.iscontrol = true;
                // INCOMMINGMASTERvar.TYPEid_UNIT_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.UNIT_UNIT_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.masterID_UNIT_ACTION = _data[i].f21;
                SAMEPLENAMEPOPUP(context);
              },
              SAMPLENAMEtext: _data[i].f01,
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
      return const Dialog(
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
                    'SAMPLE NAME',
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
                    label: 'Sample Name',
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
                      sValue: INCOMMINGMASTERvar.UNIT_UNIT_ACTION,
                      returnfunc: (String s) {
                        INCOMMINGMASTERvar.UNIT_UNIT_ACTION = s;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        UNITStable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                            .add(INCOMMINGMASTERmsg_UNIT_EDIT());
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
