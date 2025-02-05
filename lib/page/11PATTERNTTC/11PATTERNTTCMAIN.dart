import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../data/global.dart';
import '../../widget/TABLETTC/SAMPLETABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '11PATTERNTTCVAR.dart';

class PATTERNTTCMAIN extends StatefulWidget {
  const PATTERNTTCMAIN({super.key});

  @override
  State<PATTERNTTCMAIN> createState() => _PATTERNTTCMAINState();
}

class _PATTERNTTCMAINState extends State<PATTERNTTCMAIN> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 800,
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  child: Center(
                    child: Text("PATTERN"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text("CUSTNAME"),
                          ),
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text("TYPE"),
                          ),
                          SizedBox(
                            height: 25,
                            width: 300,
                            child: Text("UID"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                            child: Text(PATTERNTTCVAR.CUSTNAME),
                          ),
                          SizedBox(
                            height: 25,
                            child: Text(PATTERNTTCVAR.TYPE),
                          ),
                          SizedBox(
                            height: 25,
                            child: Text(PATTERNTTCVAR.UID),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          for (int s = 1; s < 9; s++) ...[
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
                        SizedBox(
                          child: Text('SAMPLE NO ${s}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                //[]---
                                PATTERNTTCVAR.ITEMSETNOint = s;
                                PATTERNTTCVAR.ITEMSETNOstr =
                                    PATTERNTTCVAR.ITEMSETNOint.toString();

                                ITEMSET(context);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color: Colors.green,
                              child: Center(
                                  child: Text(PATTERNTTCVAR.SAMPLENO[s])),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                //[]---
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color: Colors.blue,
                              child: Center(child: Text("NEW SAMPLE")),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                //[]---
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color: Colors.blue,
                              child: Center(child: Text("ADD ITEMS")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SAMPLETABLE(
                          F01: "NO",
                          F02: "BottleNo",
                          F03: "InstrumentName",
                          F04: "ItemName",
                          F05: "Report format",
                          BGColorMain: Colors.grey.shade600,
                        ),
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
      return Dialog(
        child: Page4GET(),
      );
    },
  );
}

class Page4GET extends StatelessWidget {
  Page4GET({
    Key? key,
  }) : super(key: key);

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
    // TODO: implement initState
    super.initState();

    context.read<GETDROPDOWNMASTER_Bloc>().add(GETDROPDOWNGET_LIST());
  }

  @override
  Widget build(BuildContext context) {
    GETDROPDOWNMASTERClass _datain = widget.datain ??
        GETDROPDOWNMASTERClass(
          CUSTNAME: [
            MapEntry("", ""),
          ],
          TYPE: [
            MapEntry("", ""),
          ],
        );
    return Container(
      height: 300,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            child: Center(
              child: Text("ITEM SET NO " + PATTERNTTCVAR.ITEMSETNOstr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "CUSTNAME",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.SAMPLENAME,
                    // listdropdown: [],
                    onChangeinside: (d, k) {
                      setState(() {
                        PATTERNTTCVAR.SAMPLENO[PATTERNTTCVAR.ITEMSETNOint] = k;
                        PATTERNTTCVAR.SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint] =
                            d;
                        // print(d);
                        // print(k);
                      });
                    },
                    value:
                        PATTERNTTCVAR.SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint],
                    height: 40,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        Dio().post(
                          serverGB + "TLA/ADDITEM",
                          data: {
                            "UID": PATTERNTTCVAR.UID,
                            "SAMPLE": PATTERNTTCVAR
                                .SAMPLENO[PATTERNTTCVAR.ITEMSETNOint],
                            "SAMPLEUID": PATTERNTTCVAR
                                .SAMPLENOUID[PATTERNTTCVAR.ITEMSETNOint],
                            "SAMPLENO": PATTERNTTCVAR.ITEMSETNOstr,
                          },
                        ).then((c) {
                          //
                          if (c.statusCode == 200) {
                            context
                                .read<GETDROPDOWNMASTER_Bloc>()
                                .add(GETDROPDOWNGET_LIST());
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        color: Colors.blue,
                        child: Center(
                          child: Text("SAVE"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
