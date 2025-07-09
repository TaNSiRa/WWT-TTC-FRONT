// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLETTC/06WWTITEMtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';
import 'AddOnCustom.dart';

late BuildContext WWTITEMtable_INCcontext;

class WWTITEMtable_INC extends StatelessWidget {
  WWTITEMtable_INC({
    super.key,
    this.data,
    this.ITEMSdd,
    this.METHODdd,
  });
  List<dataset>? data;
  List<MapEntry<String, String>>? ITEMSdd;
  List<MapEntry<String, String>>? METHODdd;

  @override
  Widget build(BuildContext context) {
    WWTITEMtable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 0) {
      // print('0');
    } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 1) {
      // print('1');
      if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 2) {
        _data.sort((a, b) => a.f03.compareTo(b.f03));
      }
    } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 2) {
      // print('2');
      if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 2) {
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
              INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = '';
              CUSTPOPUP(context);
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
          child: WWTITEMtableWidget(
            BGColorMain: Colors.grey.shade400,
            InstrumentName: "Instrument Name",
            ItemName: "Item Name",
            BottleNo: "Bottle No",
            ReportFormat: "Report Format",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.SPECIALSPEC_SORT_F = 0;
              if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 0) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 1) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 2) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 0;
                context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_SPECIALSPECget());
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
            child: WWTITEMtableWidget(
              BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION = _data[i].f03;
                INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION = _data[i].f04;
                INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = _data[i].f21;
                // print(INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION);
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_METHODE_DROP());
                POPUPyn(context, (v) {
                  context.read<INCOMMINGMASTERmsg_Bloc>().add(INCOMMINGMASTERmsg_SPECIFICATION_DELETE());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION = _data[i].f03;
                INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION = _data[i].f04;
                INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = _data[i].f21;
                CUSTPOPUP(context);
              },
              InstrumentName: _data[i].f01,
              ItemName: _data[i].f02,
              BottleNo: _data[i].f03,
              ReportFormat: _data[i].f04,
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void CUSTPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Dialog(
        child: CUSTACTION(),
      );
    },
  );
}

class CUSTACTION extends StatefulWidget {
  const CUSTACTION({super.key});

  @override
  State<CUSTACTION> createState() => _CUSTACTIONState();
}

class _CUSTACTIONState extends State<CUSTACTION> {
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
                    'WWT ITEM',
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
                      sValue: INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION,
                      returnfunc: (String s) {
                        INCOMMINGMASTERvar.INSTRUMENTNAME_SPECIALSPEC_ACTION = s;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField(
                    label: 'Item Name',
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
                      sValue: INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION,
                      returnfunc: (String s) {
                        INCOMMINGMASTERvar.ITEMNAME_SPECIALSPEC_ACTION = s;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField(
                    label: 'Bottle No',
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
                      sValue: INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION,
                      returnfunc: (String s) {
                        INCOMMINGMASTERvar.BOTTLENO_SPECIALSPEC_ACTION = s;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInputField(
                    label: 'Report Format',
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
                      sValue: INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION,
                      returnfunc: (String s) {
                        INCOMMINGMASTERvar.REPORTFORMAT_SPECIALSPEC_ACTION = s;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        WWTITEMtable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                            .add(INCOMMINGMASTERmsg_SPECIFICATION_EDIT());
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
