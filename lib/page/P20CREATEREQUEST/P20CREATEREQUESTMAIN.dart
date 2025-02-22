import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../data/global.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Timewid.dart';
import '../page11.dart';
import 'P20CREATEREQUESTVAR.dart';

late BuildContext CREATEREQUESTMAINcontext;

class CREATEREQUESTMAIN extends StatefulWidget {
  CREATEREQUESTMAIN({
    super.key,
  });

  @override
  State<CREATEREQUESTMAIN> createState() => _CREATEREQUESTMAINState();
}

class _CREATEREQUESTMAINState extends State<CREATEREQUESTMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CREATEREQUESTMAINcontext = context;

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
                        child: Text("NEWREQUEST"),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          //
                          NEWREQUESTSET(context);
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          color: Colors.blue,
                          child: Center(child: Text("CREATE")),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

void NEWREQUESTSET(BuildContext contextin) {
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
            return NEWNEWREQUEST(
              datain: data,
            );
          },
        ));
  }
}

class NEWNEWREQUEST extends StatefulWidget {
  NEWNEWREQUEST({
    super.key,
    this.datain,
  });
  GETDROPDOWNMASTERClass? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P20CREATEREQUESTVAR.CUSTNAME = '';
    P20CREATEREQUESTVAR.TYPE = '';
    P20CREATEREQUESTVAR.CUSTNAMEUID = '';
    P20CREATEREQUESTVAR.TYPEUID = '';
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
      height: 500,
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
              child: Text("NEWREQUEST"),
            ),
          ),
          if (P20CREATEREQUESTVAR.page == 0) ...[
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
                          P20CREATEREQUESTVAR.CUSTNAME = k;
                          P20CREATEREQUESTVAR.CUSTNAMEUID = d;
                          // print(d);
                          // print(k);
                        });
                      },
                      value: P20CREATEREQUESTVAR.CUSTNAMEUID,
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
                          P20CREATEREQUESTVAR.TYPE = k;
                          P20CREATEREQUESTVAR.TYPEUID = d;
                          // print(d);
                          // print(k);
                        });
                      },
                      value: P20CREATEREQUESTVAR.TYPEUID,
                      height: 40,
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: Column(
                      children: [
                        Text("Sampling Date"),
                        InkWell(
                          onTap: () {
                            CalendaSelectDate(
                                context, P20CREATEREQUESTVAR.calendaset,
                                (date) {
                              //
                              setState(() {
                                P20CREATEREQUESTVAR.calendasetout =
                                    date.toString();
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                  P20CREATEREQUESTVAR.calendasetout == ''
                                      ? "DATE"
                                      : P20CREATEREQUESTVAR.calendasetout),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: Column(
                      children: [
                        Text("Sampling Time"),
                        InkWell(
                          onTap: () {
                            selectTime(context, P20CREATEREQUESTVAR.timeendset,
                                (date) {
                              //
                              setState(() {
                                P20CREATEREQUESTVAR.timeendsetout =
                                    date.toString();
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                  P20CREATEREQUESTVAR.timeendsetout == ''
                                      ? "TIME"
                                      : P20CREATEREQUESTVAR.timeendsetout),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: AdvanceDropDown(
                      sLabel: "Req type",
                      imgpath: 'assets/icons/icon-down_4@3x.png',
                      listdropdown: [
                        MapEntry("-", ""),
                        MapEntry("Routine", "Routine"),
                        MapEntry("Special", "Special"),
                        MapEntry("Service Lab", "ServiceLab"),
                      ],
                      onChangeinside: (d, k) {
                        setState(() {
                          // P20CREATEREQUESTVAR.TYPE = k;
                          P20CREATEREQUESTVAR.ReqType = d;
                          // print(d);
                          // print(k);
                        });
                      },
                      value: P20CREATEREQUESTVAR.ReqType,
                      height: 40,
                      width: 300,
                    ),
                  ),
                  if (P20CREATEREQUESTVAR.ReqType == "Special")
                    SizedBox(
                      height: 120,
                      width: 300,
                      child: ComInputText(
                        nLimitedChar: 120,
                        // isNumberOnly: true,
                        sLabel: "Special tag",
                        height: 76,
                        width: 300,
                        isContr: P20CREATEREQUESTVAR.iscontrol,
                        // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                        fnContr: (input) {
                          setState(() {
                            P20CREATEREQUESTVAR.iscontrol = input;
                          });
                        },
                        sValue: P20CREATEREQUESTVAR.SpecialDATAs,
                        returnfunc: (String s) {
                          P20CREATEREQUESTVAR.SpecialDATAs = s;
                        },
                      ),
                    ),
                  if (P20CREATEREQUESTVAR.ReqType == "ServiceLab")
                    SizedBox(
                      height: 120,
                      width: 300,
                      child: ComInputText(
                        nLimitedChar: 100,
                        // isNumberOnly: true,
                        sLabel: "ServiceLab tag",
                        height: 120,
                        width: 300,
                        isContr: P20CREATEREQUESTVAR.iscontrol,
                        // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                        fnContr: (input) {
                          setState(() {
                            P20CREATEREQUESTVAR.iscontrol = input;
                          });
                        },
                        sValue: P20CREATEREQUESTVAR.ServiceLabDATAs,
                        returnfunc: (String s) {
                          P20CREATEREQUESTVAR.ServiceLabDATAs = s;
                        },
                      ),
                    ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            P20CREATEREQUESTVAR.page = 1;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          color: Colors.blue,
                          child: Center(
                            child: Text("NEXT"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
          if (P20CREATEREQUESTVAR.page == 1) ...[
            //

            SizedBox(
              height: 70,
              width: 300,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      P20CREATEREQUESTVAR.page = 1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    color: Colors.blue,
                    child: Center(
                      child: Text("COMPLETE"),
                    ),
                  ),
                ),
              ),
            ),
          ]
        ],
      )),
    );
  }
}
