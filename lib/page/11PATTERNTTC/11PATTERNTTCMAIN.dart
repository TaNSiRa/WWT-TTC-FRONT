// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, deprecated_member_use, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLETTC/SAMPLETABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '../page4.dart';
import '11PATTERNTTCVAR.dart';

late BuildContext PATTERNTTCMAINcontext;

class PATTERNTTCMAIN extends StatefulWidget {
  PATTERNTTCMAIN({
    super.key,
    this.data,
  });
  PATTERNDATAClass? data;
  @override
  State<PATTERNTTCMAIN> createState() => _PATTERNTTCMAINState();
}

class _PATTERNTTCMAINState extends State<PATTERNTTCMAIN> {
  @override
  void initState() {
    super.initState();
    if (PATTERNTTCVAR.UID != '') {
      //
      context.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
      PageName = 'EDIT PATTERN';
    }
  }

  @override
  Widget build(BuildContext context) {
    PATTERNTTCMAINcontext = context;
    PATTERNDATAClass _data = widget.data ?? PATTERNDATAClass();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower('', const Page4());
                        },
                        child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back, color: Colors.white, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  "BACK",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "EDIT PATTERN",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      _buildActionButton(
                        label: 'REFRESH',
                        icon: Icons.refresh,
                        color: Colors.blue,
                        onTap: () {
                          setState(() {
                            context.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 100,
                            child: Text(
                              "CUSTNAME",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 25,
                            width: 100,
                            child: Text(
                              "TYPE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 25,
                            width: 100,
                            child: Text(
                              "UID",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text(
                              PATTERNTTCVAR.CUSTNAME,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text(
                              PATTERNTTCVAR.TYPE,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text(
                              PATTERNTTCVAR.UID,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (int s = 1; s < 11; s++) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          'SAMPLE NO $s',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 16),
                        _buildActionButton(
                          label: PATTERNTTCVAR.SAMPLENO[s],
                          icon: Icons.view_list,
                          color: Colors.green,
                          onTap: () {
                            setState(() {
                              PATTERNTTCVAR.ITEMSETNOint = s;
                              PATTERNTTCVAR.ITEMSETNOstr = PATTERNTTCVAR.ITEMSETNOint.toString();
                              ITEMSET(context);
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        // _buildActionButton(
                        //   label: "NEW SAMPLE",
                        //   icon: Icons.add,
                        //   color: Colors.blue,
                        //   onTap: () {
                        //     setState(() {
                        //     });
                        //   },
                        // ),
                        const Spacer(),
                        _buildActionButton(
                          label: "ADD ITEMS",
                          icon: Icons.playlist_add,
                          color: Colors.blue,
                          onTap: () {
                            PATTERNTTCVAR.ITEMSETNOint = s;
                            PATTERNTTCVAR.ITEMSETNOstr = PATTERNTTCVAR.ITEMSETNOint.toString();

                            PATTERNTTCVAR.ITEMSlist[1] = _data.SMAPLENO1LIST;
                            PATTERNTTCVAR.ITEMSlist[2] = _data.SMAPLENO2LIST;
                            PATTERNTTCVAR.ITEMSlist[3] = _data.SMAPLENO3LIST;
                            PATTERNTTCVAR.ITEMSlist[4] = _data.SMAPLENO4LIST;
                            PATTERNTTCVAR.ITEMSlist[5] = _data.SMAPLENO5LIST;
                            PATTERNTTCVAR.ITEMSlist[6] = _data.SMAPLENO6LIST;
                            PATTERNTTCVAR.ITEMSlist[7] = _data.SMAPLENO7LIST;
                            PATTERNTTCVAR.ITEMSlist[8] = _data.SMAPLENO8LIST;

                            setState(() {
                              ITEMSADD(context);
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildActionButton(
                          label: "CLEAR ITEMS",
                          icon: Icons.clear,
                          color: Colors.red,
                          onTap: () {
                            PATTERNTTCVAR.ITEMSETNOint = s;
                            PATTERNTTCVAR.ITEMSETNOstr = PATTERNTTCVAR.ITEMSETNOint.toString();

                            Dio().post(
                              "${serverGB}TLA/ADDITEMlist",
                              data: {
                                "UID": PATTERNTTCVAR.UID,
                                "SAMPLENO": PATTERNTTCVAR.ITEMSETNOstr,
                                "SAMPLELIST": [],
                              },
                            ).then((c) {
                              if (c.statusCode == 200) {
                                // success
                              }
                              PATTERNTTCMAINcontext.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: SAMPLETABLE(
                            F01: "NO",
                            F02: "BottleNo",
                            F03: "InstrumentName",
                            F04: "ItemName",
                            F05: "Report format",
                            BGColorMain: Colors.grey.shade600,
                          ),
                        ),
                        if (s == 1) ...[
                          for (int i = 0; i < _data.SMAPLENO1LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO1LIST[i].NO,
                                F02: _data.SMAPLENO1LIST[i].BottleNo,
                                F03: _data.SMAPLENO1LIST[i].InstrumentName,
                                F04: _data.SMAPLENO1LIST[i].ItemName,
                                F05: _data.SMAPLENO1LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 2) ...[
                          for (int i = 0; i < _data.SMAPLENO2LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO2LIST[i].NO,
                                F02: _data.SMAPLENO2LIST[i].BottleNo,
                                F03: _data.SMAPLENO2LIST[i].InstrumentName,
                                F04: _data.SMAPLENO2LIST[i].ItemName,
                                F05: _data.SMAPLENO2LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 3) ...[
                          for (int i = 0; i < _data.SMAPLENO3LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO3LIST[i].NO,
                                F02: _data.SMAPLENO3LIST[i].BottleNo,
                                F03: _data.SMAPLENO3LIST[i].InstrumentName,
                                F04: _data.SMAPLENO3LIST[i].ItemName,
                                F05: _data.SMAPLENO3LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 4) ...[
                          for (int i = 0; i < _data.SMAPLENO4LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO4LIST[i].NO,
                                F02: _data.SMAPLENO4LIST[i].BottleNo,
                                F03: _data.SMAPLENO4LIST[i].InstrumentName,
                                F04: _data.SMAPLENO4LIST[i].ItemName,
                                F05: _data.SMAPLENO4LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 5) ...[
                          for (int i = 0; i < _data.SMAPLENO5LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO5LIST[i].NO,
                                F02: _data.SMAPLENO5LIST[i].BottleNo,
                                F03: _data.SMAPLENO5LIST[i].InstrumentName,
                                F04: _data.SMAPLENO5LIST[i].ItemName,
                                F05: _data.SMAPLENO5LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 6) ...[
                          for (int i = 0; i < _data.SMAPLENO6LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO6LIST[i].NO,
                                F02: _data.SMAPLENO6LIST[i].BottleNo,
                                F03: _data.SMAPLENO6LIST[i].InstrumentName,
                                F04: _data.SMAPLENO6LIST[i].ItemName,
                                F05: _data.SMAPLENO6LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 7) ...[
                          for (int i = 0; i < _data.SMAPLENO7LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO7LIST[i].NO,
                                F02: _data.SMAPLENO7LIST[i].BottleNo,
                                F03: _data.SMAPLENO7LIST[i].InstrumentName,
                                F04: _data.SMAPLENO7LIST[i].ItemName,
                                F05: _data.SMAPLENO7LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 8) ...[
                          for (int i = 0; i < _data.SMAPLENO8LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO8LIST[i].NO,
                                F02: _data.SMAPLENO8LIST[i].BottleNo,
                                F03: _data.SMAPLENO8LIST[i].InstrumentName,
                                F04: _data.SMAPLENO8LIST[i].ItemName,
                                F05: _data.SMAPLENO8LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 9) ...[
                          for (int i = 0; i < _data.SMAPLENO9LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO9LIST[i].NO,
                                F02: _data.SMAPLENO9LIST[i].BottleNo,
                                F03: _data.SMAPLENO9LIST[i].InstrumentName,
                                F04: _data.SMAPLENO9LIST[i].ItemName,
                                F05: _data.SMAPLENO9LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ] else if (s == 10) ...[
                          for (int i = 0; i < _data.SMAPLENO10LIST.length; i++) ...[
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
                              child: SAMPLETABLE(
                                F01: _data.SMAPLENO10LIST[i].NO,
                                F02: _data.SMAPLENO10LIST[i].BottleNo,
                                F03: _data.SMAPLENO10LIST[i].InstrumentName,
                                F04: _data.SMAPLENO10LIST[i].ItemName,
                                F05: _data.SMAPLENO10LIST[i].Reportformat,
                                BGColorMain: i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
                                isACTION: true,
                              ),
                            ),
                          ],
                        ],
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ],
      )),
    );
  }
}

void ITEMSET(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Dialog(
        child: Page4GET(),
      );
    },
  );
}

class Page4GET extends StatelessWidget {
  const Page4GET({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GETDROPDOWNMASTER_Bloc(),
        child: BlocBuilder<GETDROPDOWNMASTER_Bloc, GETDROPDOWNMASTERClass>(
          builder: (context, data) {
            return NEWITEMS(
              datain: data,
            );
          },
        ));
  }
}

class NEWITEMS extends StatefulWidget {
  NEWITEMS({
    super.key,
    this.datain,
  });
  GETDROPDOWNMASTERClass? datain;
  @override
  State<NEWITEMS> createState() => _NEWITEMSState();
}

class _NEWITEMSState extends State<NEWITEMS> {
  @override
  void initState() {
    super.initState();
    context.read<GETDROPDOWNMASTER_Bloc>().add(GETDROPDOWNGET_LIST());
  }

  @override
  Widget build(BuildContext context) {
    GETDROPDOWNMASTERClass _datain = widget.datain ??
        GETDROPDOWNMASTERClass(
          CUSTNAME: [
            const MapEntry("", ""),
          ],
          TYPE: [
            const MapEntry("", ""),
          ],
        );
    return Container(
      width: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.blue.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
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
                Text(
                  "ITEM SET NO ${PATTERNTTCVAR.ITEMSETNOstr}",
                  style: const TextStyle(
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
              spacing: 10,
              children: [
                _buildDropdownField(
                  label: 'Item Name',
                  icon: Icons.business,
                  dropdown: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.SAMPLENAME,
                    // listdropdown: [],
                    onChangeinside: (d, k) {
                      setState(() {
                        PATTERNTTCVAR.SAMPLENO[PATTERNTTCVAR.ITEMSETNOint] = k;
                        PATTERNTTCVAR.SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint] = d;
                        // print(d);
                        // print(k);
                      });
                    },
                    value: PATTERNTTCVAR.SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint],
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      Dio().post(
                        "${serverGB}TLA/ADDITEM",
                        data: {
                          "UID": PATTERNTTCVAR.UID,
                          "SAMPLE": PATTERNTTCVAR.SAMPLENO[PATTERNTTCVAR.ITEMSETNOint],
                          "SAMPLEUID": PATTERNTTCVAR.SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint],
                          "SAMPLENO": PATTERNTTCVAR.ITEMSETNOstr,
                        },
                      ).then((c) {
                        //
                        if (c.statusCode == 200) {
                          PATTERNTTCMAINcontext.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
                          Navigator.pop(context);
                        }
                      });
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
          )
        ],
      )),
    );
  }
}

void ITEMSADD(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Dialog(
        child: ITEMSADDssg(),
      );
    },
  );
}

class ITEMSADDssg extends StatelessWidget {
  const ITEMSADDssg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GETDROPDOWNMASTER_Bloc(),
        child: BlocBuilder<GETDROPDOWNMASTER_Bloc, GETDROPDOWNMASTERClass>(
          builder: (context, data) {
            return ITEMSADDs(
              datain: data,
            );
          },
        ));
  }
}

class ITEMSADDs extends StatefulWidget {
  ITEMSADDs({
    super.key,
    this.datain,
  });
  GETDROPDOWNMASTERClass? datain;
  @override
  State<ITEMSADDs> createState() => _ITEMSADDsState();
}

class _ITEMSADDsState extends State<ITEMSADDs> {
  @override
  void initState() {
    super.initState();

    context.read<GETDROPDOWNMASTER_Bloc>().add(GETDROPDOWNGET_LIST());
  }

  @override
  Widget build(BuildContext context) {
    GETDROPDOWNMASTERClass _datain = widget.datain ??
        GETDROPDOWNMASTERClass(
          CUSTNAME: [
            const MapEntry("", ""),
          ],
          TYPE: [
            const MapEntry("", ""),
          ],
        );
    return Container(
      width: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.blue.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                  'ADD ITEM',
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
              spacing: 10,
              children: [
                _buildDropdownField(
                  label: 'Bottle NO',
                  icon: Icons.category,
                  dropdown: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.BottleNOset,
                    onChangeinside: (d, k) {
                      setState(() {
                        // print(d);
                        // print(k);
                        PATTERNTTCVAR.BottleNOsetUID = d;
                        PATTERNTTCVAR.BottleNOset = k;
                      });
                    },
                    value: PATTERNTTCVAR.BottleNOsetUID,
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                _buildDropdownField(
                  label: 'Instrument Name',
                  icon: Icons.category,
                  dropdown: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.INSTRUMENTNAME,
                    onChangeinside: (d, k) {
                      setState(() {
                        // print(d);
                        // print(k);
                        PATTERNTTCVAR.InstrumentNamesetUID = d;
                        PATTERNTTCVAR.InstrumentNameset = k;
                      });
                    },
                    value: PATTERNTTCVAR.InstrumentNamesetUID,
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                _buildDropdownField(
                  label: 'ITEM NAME',
                  icon: Icons.category,
                  dropdown: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.ITEMNAME,
                    onChangeinside: (d, k) {
                      setState(() {
                        // print(d);
                        // print(k);
                        PATTERNTTCVAR.ItemNamesetUID = d;
                        PATTERNTTCVAR.ItemNameset = k;
                      });
                    },
                    value: PATTERNTTCVAR.ItemNamesetUID,
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                _buildDropdownField(
                  label: 'Report format',
                  icon: Icons.category,
                  dropdown: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.Reportformat,
                    onChangeinside: (d, k) {
                      setState(() {
                        // print(d);
                        // print(k);
                        PATTERNTTCVAR.ReportformatsetUID = d;
                        PATTERNTTCVAR.Reportformatset = k;
                      });
                    },
                    value: PATTERNTTCVAR.ReportformatsetUID,
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      List<Map<String, String>> setupdata = [];
                      for (var i = 0; i < PATTERNTTCVAR.ITEMSlist[PATTERNTTCVAR.ITEMSETNOint].length; i++) {
                        setupdata.add({
                          "BottleNOset": PATTERNTTCVAR.ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i].BottleNo,
                          "INSTRUMENTNAME":
                              PATTERNTTCVAR.ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i].InstrumentName,
                          "ITEMNAME": PATTERNTTCVAR.ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i].ItemName,
                          "Reportformat": PATTERNTTCVAR.ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i].Reportformat,
                        });
                      }

                      setupdata.add(
                        {
                          "BottleNOset": PATTERNTTCVAR.BottleNOset,
                          "INSTRUMENTNAME": PATTERNTTCVAR.InstrumentNameset,
                          "ITEMNAME": PATTERNTTCVAR.ItemNameset,
                          "Reportformat": PATTERNTTCVAR.Reportformatset,
                        },
                      );

                      Dio().post(
                        "${serverGB}TLA/ADDITEMlist",
                        data: {
                          "UID": PATTERNTTCVAR.UID,
                          "SAMPLENO": PATTERNTTCVAR.ITEMSETNOstr,
                          // "SAMPLELIST": [
                          //   {
                          //     "BottleNOset": PATTERNTTCVAR.BottleNOset,
                          //     "INSTRUMENTNAME":
                          //         PATTERNTTCVAR.InstrumentNameset,
                          //     "ITEMNAME": PATTERNTTCVAR.ItemNameset,
                          //     "Reportformat": PATTERNTTCVAR.Reportformatset,
                          //   },
                          // ],
                          "SAMPLELIST": setupdata,
                        },
                      ).then((c) {
                        //
                        if (c.statusCode == 200) {
                          PATTERNTTCMAINcontext.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
                          Navigator.pop(context);
                        }
                      });
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
                              'SAVE PATTERN',
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
          )
        ],
      )),
    );
  }
}

Widget _buildActionButton({
  required String label,
  required IconData icon,
  required Color color,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildDropdownField({
  required String label,
  required IconData icon,
  required Widget dropdown,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(icon, color: Colors.blue.shade600, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: dropdown,
      ),
    ],
  );
}
