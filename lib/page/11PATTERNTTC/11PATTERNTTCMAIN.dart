import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import '../../data/global.dart';
import '../../widget/TABLETTC/SAMPLETABLE.dart';
import '../../widget/common/Advancedropdown.dart';
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
    // TODO: implement initState
    super.initState();
    if (PATTERNTTCVAR.UID != '') {
      //
      context.read<PATTERNDATAGET_Bloc>().add(PATTERNDATAGET_MATCP());
    }
  }

  @override
  Widget build(BuildContext context) {
    PATTERNTTCMAINcontext = context;
    PATTERNDATAClass _data = widget.data ?? PATTERNDATAClass();

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
                Row(
                  children: [
                    const SizedBox(
                      child: Center(
                        child: Text("PATTERN"),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<PATTERNDATAGET_Bloc>()
                              .add(PATTERNDATAGET_MATCP());
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          color: Colors.blue,
                          child: Center(child: Text("REFRESH")),
                        ),
                      ),
                    ),
                  ],
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
                              PATTERNTTCVAR.ITEMSETNOint = s;
                              PATTERNTTCVAR.ITEMSETNOstr =
                                  PATTERNTTCVAR.ITEMSETNOint.toString();

                              PATTERNTTCVAR.ITEMSlist[1] = _data.SMAPLENO1LIST;
                              PATTERNTTCVAR.ITEMSlist[2] = _data.SMAPLENO2LIST;
                              PATTERNTTCVAR.ITEMSlist[3] = _data.SMAPLENO3LIST;
                              PATTERNTTCVAR.ITEMSlist[4] = _data.SMAPLENO4LIST;
                              PATTERNTTCVAR.ITEMSlist[5] = _data.SMAPLENO5LIST;
                              PATTERNTTCVAR.ITEMSlist[6] = _data.SMAPLENO6LIST;
                              PATTERNTTCVAR.ITEMSlist[7] = _data.SMAPLENO7LIST;
                              PATTERNTTCVAR.ITEMSlist[8] = _data.SMAPLENO8LIST;
                              setState(() {
                                //[]---
                                ITEMSADD(context);
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
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {
                              PATTERNTTCVAR.ITEMSETNOint = s;
                              PATTERNTTCVAR.ITEMSETNOstr =
                                  PATTERNTTCVAR.ITEMSETNOint.toString();

                              Dio().post(
                                serverGB + "TLA/ADDITEMlist",
                                data: {
                                  "UID": PATTERNTTCVAR.UID,
                                  "SAMPLENO": PATTERNTTCVAR.ITEMSETNOstr,
                                  "SAMPLELIST": [],
                                },
                              ).then((c) {
                                //
                                if (c.statusCode == 200) {}
                                PATTERNTTCMAINcontext.read<
                                        PATTERNDATAGET_Bloc>()
                                    .add(PATTERNDATAGET_MATCP());
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              color: Colors.red,
                              child: Center(child: Text("CLEAR ITEMS")),
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
                        if (s == 1) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO1LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO1LIST[i].NO,
                              F02: _data.SMAPLENO1LIST[i].BottleNo,
                              F03: _data.SMAPLENO1LIST[i].InstrumentName,
                              F04: _data.SMAPLENO1LIST[i].ItemName,
                              F05: _data.SMAPLENO1LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 2) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO2LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO2LIST[i].NO,
                              F02: _data.SMAPLENO2LIST[i].BottleNo,
                              F03: _data.SMAPLENO2LIST[i].InstrumentName,
                              F04: _data.SMAPLENO2LIST[i].ItemName,
                              F05: _data.SMAPLENO2LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 3) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO3LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO3LIST[i].NO,
                              F02: _data.SMAPLENO3LIST[i].BottleNo,
                              F03: _data.SMAPLENO3LIST[i].InstrumentName,
                              F04: _data.SMAPLENO3LIST[i].ItemName,
                              F05: _data.SMAPLENO3LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 4) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO4LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO4LIST[i].NO,
                              F02: _data.SMAPLENO4LIST[i].BottleNo,
                              F03: _data.SMAPLENO4LIST[i].InstrumentName,
                              F04: _data.SMAPLENO4LIST[i].ItemName,
                              F05: _data.SMAPLENO4LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 5) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO5LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO5LIST[i].NO,
                              F02: _data.SMAPLENO5LIST[i].BottleNo,
                              F03: _data.SMAPLENO5LIST[i].InstrumentName,
                              F04: _data.SMAPLENO5LIST[i].ItemName,
                              F05: _data.SMAPLENO5LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 6) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO6LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO6LIST[i].NO,
                              F02: _data.SMAPLENO6LIST[i].BottleNo,
                              F03: _data.SMAPLENO6LIST[i].InstrumentName,
                              F04: _data.SMAPLENO6LIST[i].ItemName,
                              F05: _data.SMAPLENO6LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 7) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO7LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO7LIST[i].NO,
                              F02: _data.SMAPLENO7LIST[i].BottleNo,
                              F03: _data.SMAPLENO7LIST[i].InstrumentName,
                              F04: _data.SMAPLENO7LIST[i].ItemName,
                              F05: _data.SMAPLENO7LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
                            ),
                          ],
                        ] else if (s == 8) ...[
                          for (int i = 0;
                              i < _data.SMAPLENO8LIST.length;
                              i++) ...[
                            SAMPLETABLE(
                              F01: _data.SMAPLENO8LIST[i].NO,
                              F02: _data.SMAPLENO8LIST[i].BottleNo,
                              F03: _data.SMAPLENO8LIST[i].InstrumentName,
                              F04: _data.SMAPLENO8LIST[i].ItemName,
                              F05: _data.SMAPLENO8LIST[i].Reportformat,
                              BGColorMain: i.isEven
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              isACTION: true,
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
                            PATTERNTTCMAINcontext.read<PATTERNDATAGET_Bloc>()
                                .add(PATTERNDATAGET_MATCP());
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

void ITEMSADD(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: ITEMSADDssg(),
      );
    },
  );
}

class ITEMSADDssg extends StatelessWidget {
  ITEMSADDssg({
    Key? key,
  }) : super(key: key);

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
      height: 600,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
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
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "Bottle NO",
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
                    height: 40,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "Instrument Name",
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
                    height: 40,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "ITEMNAME",
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
                    height: 40,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "Report format",
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
                        List<Map<String, String>> setupdata = [];
                        for (var i = 0;
                            i <
                                PATTERNTTCVAR
                                    .ITEMSlist[PATTERNTTCVAR.ITEMSETNOint]
                                    .length;
                            i++) {
                          setupdata.add({
                            "BottleNOset": PATTERNTTCVAR
                                .ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i]
                                .BottleNo,
                            "INSTRUMENTNAME": PATTERNTTCVAR
                                .ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i]
                                .InstrumentName,
                            "ITEMNAME": PATTERNTTCVAR
                                .ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i]
                                .ItemName,
                            "Reportformat": PATTERNTTCVAR
                                .ITEMSlist[PATTERNTTCVAR.ITEMSETNOint][i]
                                .Reportformat,
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
                          serverGB + "TLA/ADDITEMlist",
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
                            PATTERNTTCMAINcontext.read<PATTERNDATAGET_Bloc>()
                                .add(PATTERNDATAGET_MATCP());
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        color: Colors.blue,
                        child: Center(
                          child: Text("ADD"),
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
