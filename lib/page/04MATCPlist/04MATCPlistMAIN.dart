import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-1-MATCPlistGET.dart';
import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLE/12-SEARCHMATCP.dart';
import '../../widget/TABLETTC/TTCPATTERNTABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../05INSPECTIONstd/INSPECTIONstdVAR.dart';
import '../06INSPECTIONstdN/P6INSPECTIONstdNvar.dart';
import '../11PATTERNTTC/11PATTERNTTCVAR.dart';
import '../page11.dart';
import '../page5.dart';
import '../page6.dart';
import '04MATCPlistMAINvar.dart';

late BuildContext MATCPlistMAINcontext;

class MATCPlistMAIN extends StatefulWidget {
  MATCPlistMAIN({
    super.key,
    this.data,
  });
  List<MATCPlistClass>? data;
  @override
  State<MATCPlistMAIN> createState() => _MATCPlistMAINState();
}

class _MATCPlistMAINState extends State<MATCPlistMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PATTERNTTCVAR.UID = '';
    context.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
  }

  // int pagelist = 0;
  // int pageselect = 0;

  // int FPint = 0;
  // int LPint = 0;

  @override
  Widget build(BuildContext context) {
    MATCPlistMAINcontext = context;
    List<MATCPlistClass> _datainput = widget.data ?? [];
    List<MATCPlistClass> _data = [];
    if (MATCPlistMAINvar.Search != '') {
      for (var i = 0; i < _datainput.length; i++) {
        String CP_S = _datainput[i].CUSTNAME.toUpperCase();
        String FG_S = _datainput[i].TYPE.toUpperCase();
        String CUS_S = _datainput[i].UID.toUpperCase();

        if (CP_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            FG_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            CUS_S.contains(MATCPlistMAINvar.Search.toUpperCase())) {
          _data.add(_datainput[i]);
        }
      }
    } else {
      _data = _datainput;
    }

    if (_data.length != 0) {
      if (_data.length <= 20) {
        MATCPlistMAINvar.FPint = 0;
        MATCPlistMAINvar.LPint = _data.length;
      } else {
        if (_data.length > 0) {
          MATCPlistMAINvar.pagelist = (_data.length ~/ 20);

          if (20 * MATCPlistMAINvar.pagelist > _data.length) {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist - 1;
          } else {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist;
          }
          MATCPlistMAINvar.FPint = 20 * MATCPlistMAINvar.pageselect;
          if (MATCPlistMAINvar.pageselect == MATCPlistMAINvar.pagelist) {
            // LPint = FPint + (_data.length - 20 * pagelist);
            MATCPlistMAINvar.LPint = _data.length;
          } else {
            MATCPlistMAINvar.LPint = 20 * MATCPlistMAINvar.pageselect + 19;
            // LPint = _data.length;
          }
        }
      }
    }

    // print("----------------");
    // print(FPint);
    // print(LPint);
    // print("----------------");

    return SingleChildScrollView(
      child: SizedBox(
        height: 1200,
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 400,
                      child: ComInputText(
                        height: 40,
                        width: 400,
                        isContr: MATCPlistMAINvar.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            MATCPlistMAINvar.iscontrol = input;
                          });
                        },
                        sValue: MATCPlistMAINvar.Search,
                        returnfunc: (String s) {
                          setState(() {
                            MATCPlistMAINvar.pageselect = 0;
                            MATCPlistMAINvar.Search = s;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          MATCPlistMAINvar.iscontrol = true;
                          MATCPlistMAINvar.Search = '';

                          MATCPlistMAINvar.FPint = 0;
                          MATCPlistMAINvar.LPint = 0;
                          MATCPlistMAINvar.pagelist = 0;
                          MATCPlistMAINvar.pageselect = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        color: Colors.red,
                        child: Center(child: Text("CLEAR")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          MATCPlistMAINvar.iscontrol = true;
                          MATCPlistMAINvar.Search = '';

                          MATCPlistMAINvar.FPint = 0;
                          MATCPlistMAINvar.LPint = 0;
                          MATCPlistMAINvar.pagelist = 0;
                          MATCPlistMAINvar.pageselect = 0;

                          PATTERNSET(context);
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        color: Colors.blue,
                        child: Center(child: Text("NEW PATTERN")),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          context
                              .read<MATCPlistGET_Bloc>()
                              .add(MATCPlistGET_MATCP());
                        });
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
            ),
            _data.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 2500,

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            // color: Colors.orange,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          // height: 1000,
                          // width: 1000,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: TTF01ATTERNTABLE(
                                  F01: "CUSTNAME",
                                  F02: "TYPE",
                                  F03: "UID",
                                  BGColorMain: Colors.grey.shade600,
                                ),
                              ),
                              for (int i = MATCPlistMAINvar.FPint;
                                  i < MATCPlistMAINvar.LPint;
                                  i++) ...[
                                // for (int i = 0; i < _data.length; i++) ...[
                                SizedBox(
                                  height: 40,
                                  child: TTF01ATTERNTABLE(
                                    F01: _data[i].CUSTNAME,
                                    F02: _data[i].TYPE,
                                    F03: _data[i].UID,
                                    BGColorMain: i.isEven
                                        ? Colors.grey.shade50
                                        : Colors.grey.shade200,
                                    isACTION: true,
                                    EditFN: (v) {
                                      PATTERNTTCVAR.CUSTNAME =
                                          _data[i].CUSTNAME;
                                      PATTERNTTCVAR.TYPE = _data[i].TYPE;

                                      PATTERNTTCVAR.CUSTNAMEUID =
                                          _data[i].CUSTNAMEUID;
                                      PATTERNTTCVAR.TYPEUID = _data[i].TYPEUID;
                                      PATTERNTTCVAR.UID = _data[i].UID;
                                      //
                                      CuPage = Page11();
                                      MainBodyContext.read<ChangePage_Bloc>()
                                          .add(ChangePage_nodrower());
                                    },
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: InkWell(
                                  onTap: () {
                                    //
                                    if (MATCPlistMAINvar.pageselect > 0) {
                                      setState(() {
                                        MATCPlistMAINvar.pageselect--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/icon-L@3x.png'))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                    MATCPlistMAINvar.pageselect.toString() +
                                        " / " +
                                        MATCPlistMAINvar.pagelist.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: InkWell(
                                  onTap: () {
                                    //
                                    if (MATCPlistMAINvar.pageselect <
                                        MATCPlistMAINvar.pagelist) {
                                      setState(() {
                                        MATCPlistMAINvar.pageselect++;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/icon-R@3x.png'))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: 1000,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 30),
                              CircularProgressIndicator(),
                              SizedBox(width: 20),
                              Text("Loading"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

void PATTERNSET(BuildContext contextin) {
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
            return NEWPATTERN(
              datain: data,
            );
          },
        ));
  }
}

class NEWPATTERN extends StatefulWidget {
  NEWPATTERN({
    super.key,
    this.datain,
  });
  GETDROPDOWNMASTERClass? datain;
  @override
  State<NEWPATTERN> createState() => _NEWPATTERNState();
}

class _NEWPATTERNState extends State<NEWPATTERN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MATCPlistMAINvar.CUSTNAME = '';
    MATCPlistMAINvar.TYPE = '';
    MATCPlistMAINvar.CUSTNAMEUID = '';
    MATCPlistMAINvar.TYPEUID = '';
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
                    sLabel: "CUSTNAME",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.CUSTNAME,
                    onChangeinside: (d, k) {
                      setState(() {
                        MATCPlistMAINvar.CUSTNAME = k;
                        MATCPlistMAINvar.CUSTNAMEUID = d;
                        // print(d);
                        // print(k);
                      });
                    },
                    value: MATCPlistMAINvar.CUSTNAMEUID,
                    height: 40,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: AdvanceDropDown(
                    sLabel: "TYPE",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: _datain.TYPE,
                    onChangeinside: (d, k) {
                      setState(() {
                        MATCPlistMAINvar.TYPE = k;
                        MATCPlistMAINvar.TYPEUID = d;
                        // print(d);
                        // print(k);
                      });
                    },
                    value: MATCPlistMAINvar.TYPEUID,
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
                          serverGB + "TLA/NEWPATTERN",
                          data: {
                            "CUSTNAME": MATCPlistMAINvar.CUSTNAME,
                            "TYPE": MATCPlistMAINvar.TYPE,
                            "CUSTNAMEUID": MATCPlistMAINvar.CUSTNAMEUID,
                            "TYPEUID": MATCPlistMAINvar.TYPEUID,
                            "UID": "",
                          },
                        ).then((c) {
                          //
                          if (c.statusCode == 200) {
                            // MATCPlistMAINcontext.read<GETDROPDOWNMASTER_Bloc>()
                            //     .add(GETDROPDOWNGET_LIST());
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
