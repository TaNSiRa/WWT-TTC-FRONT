// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, no_leading_underscores_for_local_identifiers, deprecated_member_use, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-1-MATCPlistGET.dart';
import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLETTC/TTCPATTERNTABLE.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import '../11PATTERNTTC/11PATTERNTTCVAR.dart';
import '../page11.dart';
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
    super.initState();
    PATTERNTTCVAR.UID = '';
    context.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
    PageName = 'CREATE PATTERN';
  }

  @override
  Widget build(BuildContext context) {
    MATCPlistMAINcontext = context;
    List<MATCPlistClass> _datainput = widget.data ?? [];
    List<MATCPlistClass> _data = [];

    // Search functionality
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

    // Pagination logic
    if (_data.isNotEmpty) {
      if (_data.length <= 20) {
        MATCPlistMAINvar.FPint = 0;
        MATCPlistMAINvar.LPint = _data.length;
      } else {
        if (_data.isNotEmpty) {
          MATCPlistMAINvar.pagelist = (_data.length ~/ 20);

          if (20 * MATCPlistMAINvar.pagelist > _data.length) {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist - 1;
          } else {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist;
          }
          MATCPlistMAINvar.FPint = 20 * MATCPlistMAINvar.pageselect;
          if (MATCPlistMAINvar.pageselect == MATCPlistMAINvar.pagelist) {
            MATCPlistMAINvar.LPint = _data.length;
          } else {
            MATCPlistMAINvar.LPint = 20 * MATCPlistMAINvar.pageselect + 19;
          }
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search and Actions Section
                _buildSearchAndActions(),

                const SizedBox(height: 30),

                // Data Table Section
                _data.isNotEmpty ? _buildDataTable(_data) : _buildLoadingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndActions() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search & Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ComInputText(
                    height: 50,
                    width: double.infinity,
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
              const SizedBox(width: 16),
              _buildActionButton(
                label: 'CLEAR',
                icon: Icons.clear,
                color: Colors.red,
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
              ),
              const SizedBox(width: 16),
              _buildActionButton(
                label: 'NEW PATTERN',
                icon: Icons.add,
                color: Colors.green,
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
              ),
              const SizedBox(width: 16),
              _buildActionButton(
                label: 'REFRESH',
                icon: Icons.refresh,
                color: Colors.blue,
                onTap: () {
                  setState(() {
                    context.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
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

  Widget _buildDataTable(List<MATCPlistClass> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Table Content
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                // Header Row
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: TTF01ATTERNTABLE(
                    F01: "CUSTOMER NAME",
                    F02: "TYPE",
                    F03: "UID",
                    BGColorMain: Colors.transparent,
                  ),
                ),

                // Data Rows
                for (int i = MATCPlistMAINvar.FPint; i < MATCPlistMAINvar.LPint; i++) ...[
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
                    child: TTF01ATTERNTABLE(
                      F01: data[i].CUSTNAME,
                      F02: data[i].TYPE,
                      F03: data[i].UID,
                      BGColorMain: Colors.transparent,
                      isACTION: true,
                      DeleteFN: (v) {
                        PATTERNTTCVAR.UID = data[i].UID;
                        POPUPyn(context, (v) async {
                          final response = await Dio().post(
                            "${serverGB}TLA/DELETEPATTERN",
                            data: {
                              "masterID": PATTERNTTCVAR.UID,
                            },
                          );
                          if (response.statusCode == 200) {
                            MATCPlistMAINcontext.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
                          }
                        }, "DELETE DATA", 120, 90);
                      },
                      EditFN: (v) {
                        PATTERNTTCVAR.CUSTNAME = data[i].CUSTNAME;
                        PATTERNTTCVAR.TYPE = data[i].TYPE;
                        PATTERNTTCVAR.CUSTNAMEUID = data[i].CUSTNAMEUID;
                        PATTERNTTCVAR.TYPEUID = data[i].TYPEUID;
                        PATTERNTTCVAR.UID = data[i].UID;
                        MainBodyContext.read<ChangePage_Bloc>().ChangePage_nodrower('', const Page11());
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Pagination
          if (data.length > 20) _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildPaginationButton(
            icon: Icons.keyboard_arrow_left,
            onTap: () {
              if (MATCPlistMAINvar.pageselect > 0) {
                setState(() {
                  MATCPlistMAINvar.pageselect--;
                });
              }
            },
            enabled: MATCPlistMAINvar.pageselect > 0,
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${MATCPlistMAINvar.pageselect + 1} / ${MATCPlistMAINvar.pagelist + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
          const SizedBox(width: 16),
          _buildPaginationButton(
            icon: Icons.keyboard_arrow_right,
            onTap: () {
              if (MATCPlistMAINvar.pageselect < MATCPlistMAINvar.pagelist) {
                setState(() {
                  MATCPlistMAINvar.pageselect++;
                });
              }
            },
            enabled: MATCPlistMAINvar.pageselect < MATCPlistMAINvar.pagelist,
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool enabled,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: enabled ? Colors.blue.shade600 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: enabled ? Colors.white : Colors.grey.shade500,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'ไม่พบข้อมูลที่ค้นหา',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ลองค้นหาด้วยคำค้นอื่น หรือ ล้างการค้นหา',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                MATCPlistMAINvar.iscontrol = true;
                MATCPlistMAINvar.Search = '';
                MATCPlistMAINvar.FPint = 0;
                MATCPlistMAINvar.LPint = 0;
                MATCPlistMAINvar.pagelist = 0;
                MATCPlistMAINvar.pageselect = 0;
              });
            },
            icon: const Icon(Icons.clear_all),
            label: const Text('ล้างการค้นหา'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
              foregroundColor: Colors.white,
            ),
          ),
        ],
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: const Page4GET(),
      );
    },
  );
}

class Page4GET extends StatelessWidget {
  const Page4GET({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GETDROPDOWNMASTER_Bloc(),
      child: BlocBuilder<GETDROPDOWNMASTER_Bloc, GETDROPDOWNMASTERClass>(
        builder: (context, data) {
          return NEWPATTERN(datain: data);
        },
      ),
    );
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
          CUSTNAME: [const MapEntry("", "")],
          TYPE: [const MapEntry("", "")],
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
            // Header
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
                    'Create New Pattern',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildDropdownField(
                    label: 'Customer Name',
                    icon: Icons.business,
                    dropdown: AdvanceDropDown(
                      // sLabel: "CUSTNAME",
                      imgpath: 'assets/icons/icon-down_4@3x.png',
                      listdropdown: _datain.CUSTNAME,
                      onChangeinside: (d, k) {
                        setState(() {
                          MATCPlistMAINvar.CUSTNAME = k;
                          MATCPlistMAINvar.CUSTNAMEUID = d;
                        });
                      },
                      value: MATCPlistMAINvar.CUSTNAMEUID,
                      height: 50,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildDropdownField(
                    label: 'Type',
                    icon: Icons.category,
                    dropdown: AdvanceDropDown(
                      // sLabel: "TYPE",
                      imgpath: 'assets/icons/icon-down_4@3x.png',
                      listdropdown: _datain.TYPE,
                      onChangeinside: (d, k) {
                        setState(() {
                          MATCPlistMAINvar.TYPE = k;
                          MATCPlistMAINvar.TYPEUID = d;
                        });
                      },
                      value: MATCPlistMAINvar.TYPEUID,
                      height: 50,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Save Button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        Dio().post(
                          "${serverGB}TLA/NEWPATTERN",
                          data: {
                            "CUSTNAME": MATCPlistMAINvar.CUSTNAME,
                            "TYPE": MATCPlistMAINvar.TYPE,
                            "CUSTNAMEUID": MATCPlistMAINvar.CUSTNAMEUID,
                            "TYPEUID": MATCPlistMAINvar.TYPEUID,
                            "UID": "",
                          },
                        ).then((c) {
                          if (c.statusCode == 200) {
                            Navigator.pop(context);
                            MATCPlistMAINcontext.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
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
            ),
          ],
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
}
