// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_print, must_be_immutable, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/bloc/BlocEvent/20-01-GETDROPDOWNMASTER.dart';
import 'package:intl/intl.dart';
import '../../data/global.dart';
import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/SuccessPopup.dart';
import 'P20CREATEREQUESTVAR.dart';
import 'package:dropdown_search/dropdown_search.dart';

late BuildContext CREATEREQUESTMAINcontext;
ScrollController _controllerIN01 = ScrollController();

List<Map<String, dynamic>> filteredData = [];
List<Map<String, dynamic>> transformedData = [];
TextEditingController BottleNoController = TextEditingController();
TextEditingController InstrumentNameController = TextEditingController();
TextEditingController ReportFormatController = TextEditingController();
TextEditingController SamplingPersonController = TextEditingController();
TextEditingController SamplingDate1Controller = TextEditingController();
TextEditingController SamplingDate2Controller = TextEditingController();
TextEditingController SamplingDate3Controller = TextEditingController();
TextEditingController SamplingDate4Controller = TextEditingController();
TextEditingController SamplingDate5Controller = TextEditingController();
TextEditingController SamplingDate6Controller = TextEditingController();
TextEditingController SamplingDate7Controller = TextEditingController();
TextEditingController SamplingDate8Controller = TextEditingController();
TextEditingController SamplingDate9Controller = TextEditingController();
TextEditingController SamplingDate10Controller = TextEditingController();
List<TextEditingController> SamplingDateControllers = [
  SamplingDate1Controller,
  SamplingDate2Controller,
  SamplingDate3Controller,
  SamplingDate4Controller,
  SamplingDate5Controller,
  SamplingDate6Controller,
  SamplingDate7Controller,
  SamplingDate8Controller,
  SamplingDate9Controller,
  SamplingDate10Controller,
];

class CREATEREQUESTMAIN extends StatefulWidget {
  CREATEREQUESTMAIN({
    super.key,
    this.data,
  });
  P20CREATEREQUESTGETDATAclass? data;
  @override
  State<CREATEREQUESTMAIN> createState() => _CREATEREQUESTMAINState();
}

class _CREATEREQUESTMAINState extends State<CREATEREQUESTMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<P20CREATEREQUESTGETDATA_Bloc>().add(P20CREATEREQUESTGETDATA_GET());
    P20CREATEREQUESTVAR.customername = "";
    P20CREATEREQUESTVAR.type = "";
    P20CREATEREQUESTVAR.labname = "";
    P20CREATEREQUESTVAR.samplingperson = "";
    P20CREATEREQUESTVAR.DefalutSamplingPerson = [];
    P20CREATEREQUESTVAR.requesttype = "";
    SamplingDate1Controller.text = "";
    SamplingDate2Controller.text = "";
    SamplingDate3Controller.text = "";
    SamplingDate4Controller.text = "";
    SamplingDate5Controller.text = "";
    SamplingDate6Controller.text = "";
    SamplingDate7Controller.text = "";
    SamplingDate8Controller.text = "";
    SamplingDate9Controller.text = "";
    SamplingDate10Controller.text = "";
    SamplingPersonController.text = "";
    PageName = 'NEW REQUEST';
    // print(PageName);
  }

  @override
  Widget build(BuildContext context) {
    CREATEREQUESTMAINcontext = context;
    P20CREATEREQUESTGETDATAclass _datain = widget.data ?? P20CREATEREQUESTGETDATAclass();
    List<String>? CustnameDropDown = _datain.CUSTNAME.map((entry) => entry.key).toList();
    List<String>? TypeDropDown = _datain.TYPE.map((entry) => entry.key).toList();
    P20CREATEREQUESTVAR.ItemName = _datain.ITEMNAME.map((entry) => entry.key).toList();

    TextEditingController CustomerNameController = TextEditingController();
    TextEditingController TypeController = TextEditingController();
    TextEditingController LabNameController = TextEditingController();
    TextEditingController RequestTypeController = TextEditingController();

    if (P20CREATEREQUESTVAR.DefalutSamplingPerson.isNotEmpty) {
      setState(() {
        SamplingPersonController.text = P20CREATEREQUESTVAR.DefalutSamplingPerson[0];
        P20CREATEREQUESTVAR.samplingperson = P20CREATEREQUESTVAR.DefalutSamplingPerson[0];
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 600,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(Icons.description, color: Colors.blueGrey, size: 28),
                          SizedBox(width: 8),
                          Text(
                            'WWT Request Form',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2, color: Colors.blueGrey[200]),
                      Row(
                        children: [
                          Text('Customer Name :', style: buildTextStyle()),
                          const Spacer(),
                          SizedBox(
                            width: 400,
                            child: buildCustomField(
                              controller: CustomerNameController,
                              labelText: 'Customer Name',
                              icon: Icons.factory_rounded,
                              dropdownItems: CustnameDropDown,
                              onChanged: (value) async {
                                P20CREATEREQUESTVAR.customername = value;
                                if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                                    P20CREATEREQUESTVAR.type.isNotEmpty) {
                                  await fetchAndTransformPatternData();
                                  setState(() {});
                                }
                                await fetchDefaultSamplingPerson();
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Type :', style: buildTextStyle()),
                          const Spacer(),
                          SizedBox(
                            width: 400,
                            child: buildCustomField(
                              controller: TypeController,
                              labelText: 'Type',
                              icon: Icons.category,
                              dropdownItems: TypeDropDown,
                              onChanged: (value) async {
                                P20CREATEREQUESTVAR.type = value;
                                if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                                    P20CREATEREQUESTVAR.type.isNotEmpty) {
                                  await fetchAndTransformPatternData();
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Scrollbar(
                    controller: _controllerIN01,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10,
                    radius: const Radius.circular(20),
                    child: SingleChildScrollView(
                      controller: _controllerIN01,
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 600,
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Branch :', style: buildTextStyle()),
                                      const Spacer(),
                                      SizedBox(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: LabNameController,
                                          labelText: 'Branch',
                                          icon: Icons.biotech,
                                          dropdownItems: P20CREATEREQUESTVAR.LabName,
                                          onChanged: (value) async {
                                            P20CREATEREQUESTVAR.labname = value;
                                            await fetchSamplingPerson();
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Sampling Person :', style: buildTextStyle()),
                                      const Spacer(),
                                      SizedBox(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: SamplingPersonController,
                                          labelText: 'Sampling Person',
                                          icon: Icons.person,
                                          dropdownItems: P20CREATEREQUESTVAR.SamplingPerson,
                                          onChanged: (value) async {
                                            P20CREATEREQUESTVAR.samplingperson = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Request Type :', style: buildTextStyle()),
                                      const Spacer(),
                                      SizedBox(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: RequestTypeController,
                                          labelText: 'Request Type',
                                          icon: Icons.autorenew_rounded,
                                          dropdownItems: P20CREATEREQUESTVAR.RequestType,
                                          onChanged: (value) async {
                                            P20CREATEREQUESTVAR.requesttype = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                                P20CREATEREQUESTVAR.type.isNotEmpty &&
                                filteredData.isNotEmpty) ...[
                              Table(
                                border: TableBorder.all(),
                                columnWidths: {
                                  0: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth0),
                                  1: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth1),
                                  2: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth2),
                                  3: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth3),
                                  4: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth4),
                                  5: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth5),
                                  6: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth6),
                                  7: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth7),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      TableCell(child: buildHeaderCell('Sample No.')),
                                      TableCell(child: buildHeaderCell('Sample name')),
                                      TableCell(child: buildHeaderCell('Bottle No.')),
                                      TableCell(child: buildHeaderCell('Item No.')),
                                      TableCell(child: buildHeaderCell('Instrument Name')),
                                      TableCell(child: buildHeaderCell('Item Name')),
                                      TableCell(child: buildHeaderCell('Report Format')),
                                      TableCell(child: buildHeaderCell('Delete Item')),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...transformedData.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final item = entry.value;

                                    List<Widget> widgets = [];

                                    // เช็คว่าเป็น SAMPLENO แรกหรือเปลี่ยน SAMPLENO
                                    if (index == 0 ||
                                        item['SAMPLENO'] != transformedData[index - 1]['SAMPLENO']) {
                                      widgets.add(
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 1100,
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey[200],
                                                border: Border.all(width: 1),
                                              ),
                                              child: buildCustomField(
                                                controller: SamplingDateControllers[item['SAMPLENO']],
                                                labelText: 'Sampling Sample Date ${item['SAMPLENO']}',
                                                icon: Icons.calendar_month_rounded,
                                                onChanged: (value) {
                                                  setState(() {
                                                    item['SAMPLEDATE'] = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey[200],
                                                border: Border.all(width: 1),
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDeleteSampleDialog(
                                                      context: context,
                                                      onConfirm: () {
                                                        setState(() {
                                                          // ลบข้อมูลที่มี SAMPLENO เดียวกัน
                                                          transformedData.removeWhere(
                                                              (e) => e['SAMPLENO'] == item['SAMPLENO']);
                                                        });
                                                      },
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 25,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    widgets.add(
                                      Table(
                                        border: TableBorder.all(),
                                        columnWidths: {
                                          0: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth0),
                                          1: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth1),
                                          2: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth2),
                                          3: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth3),
                                          4: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth4),
                                          5: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth5),
                                          6: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth6),
                                          7: FixedColumnWidth(P20CREATEREQUESTVAR.FixedColumnWidth7),
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              TableCell(child: buildDataCell(item['SAMPLENO'].toString())),
                                              TableCell(child: buildDataCell(item['SAMPLENAME'].toString())),
                                              TableCell(child: buildDataCell(item['BOTTLENO'].toString())),
                                              TableCell(child: buildDataCell(item['ITEMNO'].toString())),
                                              TableCell(
                                                  child: buildDataCell(item['INSTRUMENTNAME'].toString())),
                                              TableCell(child: buildDataCell(item['ITEMNAME'].toString())),
                                              TableCell(
                                                  child: buildDataCell(item['REPORTFORMAT'].toString())),
                                              TableCell(
                                                child: buildDeleteCell(
                                                  index,
                                                  CREATEREQUESTMAINcontext,
                                                  transformedData,
                                                  onConfirm: () {
                                                    setState(() {
                                                      transformedData.removeAt(index);
                                                    });
                                                    // print(transformedData.length);
                                                    // print('transformedData.length');
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );

                                    // เช็คว่าเป็น SAMPLENO สุดท้ายหรือ SAMPLENO ถัดไปต่างกัน
                                    if (index == transformedData.length - 1 ||
                                        item['SAMPLENO'] != transformedData[index + 1]['SAMPLENO']) {
                                      widgets.add(
                                        InkWell(
                                          onTap: () {
                                            P20CREATEREQUESTVAR.InstrumentNameUniqe = '';
                                            InstrumentNameController.text = '';
                                            P20CREATEREQUESTVAR.BottleNoUniqe = '';
                                            BottleNoController.text = '';
                                            P20CREATEREQUESTVAR.ReportFormatUniqe = '';
                                            ReportFormatController.text = '';
                                            showAddItemDialog(
                                                CREATEREQUESTMAINcontext, transformedData[index],
                                                onConfirm: (NewData) {
                                              transformedData.add(NewData);
                                              transformedData.sort((a, b) {
                                                int sampleCompare = a['SAMPLENO'].compareTo(b['SAMPLENO']);
                                                if (sampleCompare != 0) {
                                                  return sampleCompare;
                                                }
                                                return a['ITEMNO'].compareTo(b['ITEMNO']);
                                              });

                                              // print(transformedData.length);
                                              setState(() {});
                                            });
                                            // print(transformedData.length);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: P20CREATEREQUESTVAR.AddandCreate,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1), color: Colors.lightGreenAccent),
                                            child: const Text(
                                              '➕ เพิ่ม Item',
                                              style:
                                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return Column(children: widgets);
                                  }),
                                ],
                              ),
                            ],
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                    P20CREATEREQUESTVAR.type.isNotEmpty &&
                    filteredData.isNotEmpty)
                  SizedBox(
                    width: P20CREATEREQUESTVAR.AddandCreate,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await showCreateRequestDialog(
                            context: CREATEREQUESTMAINcontext,
                            onConfirm: () async {
                              await CreateRequest();
                              await printTag();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          shadowColor: Colors.greenAccent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.green, width: 2),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Text(
                              'Create Request',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.note_add_rounded,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCustomField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  List<String>? dropdownItems,
}) {
  if (labelText == "Sampling Sample Date 1" ||
      labelText == "Sampling Sample Date 2" ||
      labelText == "Sampling Sample Date 3" ||
      labelText == "Sampling Sample Date 4" ||
      labelText == "Sampling Sample Date 5" ||
      labelText == "Sampling Sample Date 6" ||
      labelText == "Sampling Sample Date 7" ||
      labelText == "Sampling Sample Date 8" ||
      labelText == "Sampling Sample Date 9" ||
      labelText == "Sampling Sample Date 10") {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context, // ใช้ context นี้แทน global
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                );

                if (pickedTime != null) {
                  final fullDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  String formattedDateTime = "${fullDateTime.day.toString().padLeft(2, '0')}-"
                      "${fullDateTime.month.toString().padLeft(2, '0')}-"
                      "${fullDateTime.year.toString().substring(2)} "
                      "${fullDateTime.hour.toString().padLeft(2, '0')}:${fullDateTime.minute.toString().padLeft(2, '0')}";

                  controller.text = formattedDateTime;
                  onChanged?.call(formattedDateTime);
                  setState(() {});
                }
              }
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(icon, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    controller.text.isEmpty ? '$labelText :' : '$labelText : ${controller.text}',
                    style:
                        TextStyle(color: controller.text.isEmpty ? Colors.black : Colors.black, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  return DropdownSearch<String>(
    items: dropdownItems!,
    selectedItem: controller.text.isNotEmpty ? controller.text : null,
    dropdownDecoratorProps: DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        // //labelText: labelText,
        labelStyle: buildTextStyle(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
    popupProps: PopupProps.menu(
      showSearchBox: true,
      searchFieldProps: TextFieldProps(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      fit: FlexFit.loose,
    ),
    dropdownBuilder: (context, selectedItem) {
      return Text(
        selectedItem ?? '',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14),
      );
    },
    onChanged: (value) {
      if (value != null) {
        controller.text = value;
        if (onChanged != null) onChanged(value);
      }
    },
  );
}

Widget buildAddItemField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  List<String>? dropdownItems,
}) {
  if (labelText == 'Item Name') {
    return DropdownSearch<String>(
      items: dropdownItems!,
      selectedItem: controller.text.isNotEmpty ? controller.text : null,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blueGrey),
          labelText: labelText,
          labelStyle: buildTextStyle(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        fit: FlexFit.loose,
      ),
      dropdownBuilder: (context, selectedItem) {
        return Text(
          selectedItem ?? '',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        );
      },
      onChanged: (value) {
        if (value != null) {
          controller.text = value;
          if (onChanged != null) onChanged(value);
        }
      },
    );
  } else {
    return DropdownSearch<String>(
      items: dropdownItems!,
      enabled: false,
      selectedItem: controller.text.isNotEmpty ? controller.text : null,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          labelText: labelText,
          labelStyle: buildTextStyleGrey(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.grey[300],
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        fit: FlexFit.loose,
      ),
      dropdownBuilder: (context, selectedItem) {
        return Text(
          selectedItem ?? '',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        );
      },
      onChanged: (value) {
        if (value != null) {
          controller.text = value;
          if (onChanged != null) onChanged(value);
        }
      },
    );
  }
}

Widget buildDataCell(String data) {
  return SizedBox(
    height: 30.0,
    child: Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

TextStyle buildTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle buildTextStyleGrey() {
  return const TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

Widget buildHeaderCell(String title) {
  return Container(
    height: 50,
    color: Colors.blueGrey,
    child: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Future<void> showDeleteItemDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Row(
          children: [
            Icon(Icons.delete_forever_rounded, color: Colors.red),
            SizedBox(width: 8),
            Text('ยืนยันการลบไอเทม?'),
          ],
        ),
        content: const Text(
          'คุณต้องการที่จะลบไอเทมหรือไม่?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}

Future<void> showDeleteSampleDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Row(
          children: [
            Icon(Icons.cancel, color: Colors.red),
            SizedBox(width: 8),
            Text('ยืนยันการลบทั้งออก Sample?'),
          ],
        ),
        content: const Text(
          'คุณต้องการที่จะลบทั้งออก Sample หรือไม่?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}

Future<void> showCreateRequestDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) async {
  // Initialize printer based on USER.Section and userBranch
  if (USERDATA.Section == "MKT") {
    if (USERDATA.Branch == "BANGPOO") {
      selectedPrinter = "BPMKT";
    } else {
      selectedPrinter = "RYMKT";
    }
  } else {
    if (USERDATA.Branch == "BANGPOO") {
      selectedPrinter = "BPTTC";
    } else {
      selectedPrinter = "RYTTC";
    }
  }

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            title: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.green.shade200, width: 2),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.note_add_rounded, color: Colors.green, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'ยืนยันการสร้าง Request?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            content: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'คุณต้องการที่จะสร้าง Request หรือไม่?',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'เลือกเครื่องปริ้น:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        _buildPrinterOption(
                          value: 'BPMKT',
                          label: 'MKT BANGPOO',
                          icon: Icons.print,
                          selectedPrinter: selectedPrinter,
                          onChanged: (value) {
                            setState(() {
                              selectedPrinter = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        _buildPrinterOption(
                          value: 'RYMKT',
                          label: 'MKT RAYONG',
                          icon: Icons.print,
                          selectedPrinter: selectedPrinter,
                          onChanged: (value) {
                            setState(() {
                              selectedPrinter = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        _buildPrinterOption(
                          value: 'BPTTC',
                          label: 'TTC BANGPOO',
                          icon: Icons.print,
                          selectedPrinter: selectedPrinter,
                          onChanged: (value) {
                            setState(() {
                              selectedPrinter = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        _buildPrinterOption(
                          value: 'RYTTC',
                          label: 'TTC RAYONG',
                          icon: Icons.print,
                          selectedPrinter: selectedPrinter,
                          onChanged: (value) {
                            setState(() {
                              selectedPrinter = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Pass the selected printer to your onConfirm callback if needed
                        onConfirm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'ยืนยัน',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

Widget _buildPrinterOption({
  required String value,
  required String label,
  required IconData icon,
  required String selectedPrinter,
  required Function(String?) onChanged,
}) {
  bool isSelected = selectedPrinter == value;

  return GestureDetector(
    onTap: () => onChanged(value),
    child: Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: selectedPrinter,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
          const SizedBox(width: 8),
          Icon(
            icon,
            color: isSelected ? Colors.green : Colors.grey.shade600,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.green.shade700 : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDeleteCell(int index, BuildContext context, transformedData,
    {required Null Function() onConfirm}) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return SizedBox(
      height: 30.0,
      child: Center(
        child: InkWell(
          onTap: () async {
            await showDeleteItemDialog(
              context: context,
              onConfirm: () {
                onConfirm();
              },
            );
          },
          child: const Icon(
            Icons.delete_forever_rounded,
            size: 25,
            color: Colors.red,
          ),
        ),
      ),
    );
  });
}

void showAddItemDialog(
  BuildContext context,
  Map<String, dynamic> IndexData, {
  required Function(Map<String, dynamic> newData) onConfirm,
}) {
  // print(IndexData);
  TextEditingController SampleNoController = TextEditingController(text: IndexData["SAMPLENO"].toString());
  TextEditingController SampleNameController = TextEditingController(text: IndexData["SAMPLENAME"]);
  TextEditingController ItemNoController = TextEditingController(text: (IndexData["ITEMNO"] + 1).toString());
  TextEditingController ItemNameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: 400,
              height: 600,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                spacing: 10,
                children: [
                  const Text(
                    'เพิ่มไอเทมใหม่',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 10,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          buildAddItemField(
                            controller: SampleNameController,
                            labelText: 'Sample Name',
                            icon: Icons.abc_rounded,
                            dropdownItems: P20CREATEREQUESTVAR.SampleName,
                          ),
                          buildAddItemField(
                            controller: ItemNameController,
                            labelText: 'Item Name',
                            icon: Icons.abc_rounded,
                            dropdownItems: P20CREATEREQUESTVAR.ItemName,
                            onChanged: (value) async {
                              P20CREATEREQUESTVAR.ItemNameUniqe = value;
                              await fetchUniqeWWTItemDrop();
                              setState(() {});
                            },
                          ),
                          buildAddItemField(
                            controller: SampleNoController,
                            labelText: 'Sample No.',
                            icon: Icons.format_list_numbered_rounded,
                            dropdownItems: P20CREATEREQUESTVAR.SampleNo,
                          ),
                          buildAddItemField(
                            controller: BottleNoController,
                            labelText: 'Bottle No.',
                            icon: Icons.format_list_numbered_rounded,
                            dropdownItems: P20CREATEREQUESTVAR.BottleNo,
                          ),
                          buildAddItemField(
                            controller: ItemNoController,
                            labelText: 'Item No.',
                            icon: Icons.format_list_numbered_rounded,
                            dropdownItems: P20CREATEREQUESTVAR.ItemNo,
                          ),
                          buildAddItemField(
                            controller: InstrumentNameController,
                            labelText: 'Instrument Name',
                            icon: Icons.biotech,
                            dropdownItems: P20CREATEREQUESTVAR.Instrumentname,
                          ),
                          buildAddItemField(
                            controller: ReportFormatController,
                            labelText: 'Report Format',
                            icon: Icons.assessment,
                            dropdownItems: P20CREATEREQUESTVAR.ReportFormat,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                IndexData = {
                                  "SAMPLENAME": SampleNameController.text,
                                  "ITEMNAME": ItemNameController.text,
                                  "SAMPLENO": int.parse(SampleNoController.text),
                                  "BOTTLENO": int.parse(BottleNoController.text),
                                  "ITEMNO": int.parse(ItemNoController.text),
                                  "INSTRUMENTNAME": InstrumentNameController.text,
                                  "REPORTFORMAT": int.parse(ReportFormatController.text),
                                  "ID": "",
                                  "CUSTNAME": IndexData["CUSTNAME"],
                                  "TYPE": IndexData["TYPE"],
                                };
                                // print(IndexData);
                                onConfirm(IndexData);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green,
                                shadowColor: Colors.greenAccent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: Colors.green, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5,
                                children: [
                                  Text(
                                    'ยืนยันการเพิ่มไอเทม',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.note_add_rounded,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// class _CREATEREQUESTMAINState extends State<CREATEREQUESTMAIN> {
//   @override
//   void initState() {
//
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     CREATEREQUESTMAINcontext = context;

//     return Container(
//       height: 600,
//       width: 800,
//       color: Colors.white,
//       child: SingleChildScrollView(
//           child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(
//                       child: Center(
//                         child: Text("NEWREQUEST"),
//                       ),
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: InkWell(
//                         onTap: () {
//                           //
//                           P20CREATEREQUESTVAR.page = 0;
//                           NEWREQUESTSET(context);
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 150,
//                           color: Colors.blue,
//                           child: Center(child: Text("CREATE")),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(
//                             height: 25,
//                             width: 300,
//                             child: Text("CUSTNAME"),
//                           ),
//                           SizedBox(
//                             height: 25,
//                             width: 300,
//                             child: Text("TYPE"),
//                           ),
//                           SizedBox(
//                             height: 25,
//                             width: 300,
//                             child: Text("UID"),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

// void NEWREQUESTSET(BuildContext contextin) {
//   showDialog(
//     context: contextin,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: Page4GET(),
//       );
//     },
//   );
// }

// class Page4GET extends StatelessWidget {
//   Page4GET({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => GETDROPDOWNMASTER_Bloc(),
//         child: BlocBuilder<GETDROPDOWNMASTER_Bloc, GETDROPDOWNMASTERClass>(
//           builder: (context, data) {
//             return NEWNEWREQUEST(
//               datain: data,
//             );
//           },
//         ));
//   }
// }

// class NEWNEWREQUEST extends StatefulWidget {
//   NEWNEWREQUEST({
//     super.key,
//     this.datain,
//   });
//   GETDROPDOWNMASTERClass? datain;
//   @override
//   State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
// }

// class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
//   @override
//   void initState() {
//
//     super.initState();
//     P20CREATEREQUESTVAR.CUSTNAME = '';
//     P20CREATEREQUESTVAR.TYPE = '';
//     P20CREATEREQUESTVAR.CUSTNAMEUID = '';
//     P20CREATEREQUESTVAR.TYPEUID = '';
//     context.read<GETDROPDOWNMASTER_Bloc>().add(GETDROPDOWNGET_LIST());
//   }

//   @override
//   Widget build(BuildContext context) {
//     GETDROPDOWNMASTERClass _datain = widget.datain ??
//         GETDROPDOWNMASTERClass(
//           CUSTNAME: [
//             MapEntry("", ""),
//           ],
//           TYPE: [
//             MapEntry("", ""),
//           ],
//         );
//     return Container(
//       height: 500,
//       width: 600,
//       color: Colors.white,
//       child: SingleChildScrollView(
//           child: Column(
//         children: [
//           const SizedBox(
//             height: 24,
//           ),
//           const SizedBox(
//             child: Center(
//               child: Text("NEWREQUEST"),
//             ),
//           ),
//           if (P20CREATEREQUESTVAR.page == 0) ...[
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: AdvanceDropDown(
//                       sLabel: "CUSTNAME",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: _datain.CUSTNAME,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           P20CREATEREQUESTVAR.CUSTNAME = k;
//                           P20CREATEREQUESTVAR.CUSTNAMEUID = d;
//                           // print(d);
//                           // print(k);
//                         });
//                       },
//                       value: P20CREATEREQUESTVAR.CUSTNAMEUID,
//                       height: 40,
//                       width: 300,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: AdvanceDropDown(
//                       sLabel: "TYPE",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: _datain.TYPE,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           P20CREATEREQUESTVAR.TYPE = k;
//                           P20CREATEREQUESTVAR.TYPEUID = d;
//                           // print(d);
//                           // print(k);
//                         });
//                       },
//                       value: P20CREATEREQUESTVAR.TYPEUID,
//                       height: 40,
//                       width: 300,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: Column(
//                       children: [
//                         Text("Sampling Date"),
//                         InkWell(
//                           onTap: () {
//                             CalendaSelectDate(context, P20CREATEREQUESTVAR.calendaset, (date) {
//                               //
//                               setState(() {
//                                 P20CREATEREQUESTVAR.calendasetout = date.toString();
//                               });
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 300,
//                             color: Colors.blue,
//                             child: Center(
//                               child: Text(P20CREATEREQUESTVAR.calendasetout == ''
//                                   ? "DATE"
//                                   : P20CREATEREQUESTVAR.calendasetout),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: Column(
//                       children: [
//                         Text("Sampling Time"),
//                         InkWell(
//                           onTap: () {
//                             selectTime(context, P20CREATEREQUESTVAR.timeendset, (date) {
//                               //
//                               setState(() {
//                                 P20CREATEREQUESTVAR.timeendsetout = date.toString();
//                               });
//                             });
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 300,
//                             color: Colors.blue,
//                             child: Center(
//                               child: Text(P20CREATEREQUESTVAR.timeendsetout == ''
//                                   ? "TIME"
//                                   : P20CREATEREQUESTVAR.timeendsetout),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: AdvanceDropDown(
//                       sLabel: "Req type",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: [
//                         MapEntry("-", ""),
//                         MapEntry("Routine", "Routine"),
//                         MapEntry("Special", "Special"),
//                         MapEntry("Service Lab", "ServiceLab"),
//                       ],
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           // P20CREATEREQUESTVAR.TYPE = k;
//                           P20CREATEREQUESTVAR.ReqType = d;
//                           // print(d);
//                           // print(k);
//                         });
//                       },
//                       value: P20CREATEREQUESTVAR.ReqType,
//                       height: 40,
//                       width: 300,
//                     ),
//                   ),
//                   if (P20CREATEREQUESTVAR.ReqType == "Special")
//                     SizedBox(
//                       height: 120,
//                       width: 300,
//                       child: ComInputText(
//                         nLimitedChar: 120,
//                         // isNumberOnly: true,
//                         sLabel: "Special tag",
//                         height: 76,
//                         width: 300,
//                         isContr: P20CREATEREQUESTVAR.iscontrol,
//                         // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
//                         fnContr: (input) {
//                           setState(() {
//                             P20CREATEREQUESTVAR.iscontrol = input;
//                           });
//                         },
//                         sValue: P20CREATEREQUESTVAR.SpecialDATAs,
//                         returnfunc: (String s) {
//                           P20CREATEREQUESTVAR.SpecialDATAs = s;
//                         },
//                       ),
//                     ),
//                   if (P20CREATEREQUESTVAR.ReqType == "ServiceLab")
//                     SizedBox(
//                       height: 120,
//                       width: 300,
//                       child: ComInputText(
//                         nLimitedChar: 100,
//                         // isNumberOnly: true,
//                         sLabel: "ServiceLab tag",
//                         height: 120,
//                         width: 300,
//                         isContr: P20CREATEREQUESTVAR.iscontrol,
//                         // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
//                         fnContr: (input) {
//                           setState(() {
//                             P20CREATEREQUESTVAR.iscontrol = input;
//                           });
//                         },
//                         sValue: P20CREATEREQUESTVAR.ServiceLabDATAs,
//                         returnfunc: (String s) {
//                           P20CREATEREQUESTVAR.ServiceLabDATAs = s;
//                         },
//                       ),
//                     ),
//                   SizedBox(
//                     height: 70,
//                     width: 300,
//                     child: Center(
//                       child: InkWell(
//                         onTap: () async {
//                           setState(() {
//                             P20CREATEREQUESTVAR.page = 1;
//                           });
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 200,
//                           color: Colors.blue,
//                           child: Center(
//                             child: Text("NEXT"),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//           if (P20CREATEREQUESTVAR.page == 1) ...[
//             //

//             SizedBox(
//               height: 70,
//               width: 300,
//               child: Center(
//                 child: InkWell(
//                   onTap: () async {
//                     setState(() {
//                       P20CREATEREQUESTVAR.page = 1;
//                     });
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 200,
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text("COMPLETE"),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]
//         ],
//       )),
//     );
//   }
// }

Future<void> fetchUniqeWWTItemDrop() async {
  try {
    final response = await Dio().post(
      "${serverGB}TLA/GETUNIQEWWTITEMDROP",
      data: {
        "ITEMNAME": P20CREATEREQUESTVAR.ItemNameUniqe,
      },
    );
    // print(response.data);
    if (response.data.isNotEmpty) {
      P20CREATEREQUESTVAR.InstrumentNameUniqe = response.data[0]['INSTRUMENTNAME'];
      InstrumentNameController.text = response.data[0]['INSTRUMENTNAME'];
      P20CREATEREQUESTVAR.BottleNoUniqe = response.data[0]['BOTTLENO'];
      BottleNoController.text = response.data[0]['BOTTLENO'];
      P20CREATEREQUESTVAR.ReportFormatUniqe = response.data[0]['REPORTFORMAT'];
      ReportFormatController.text = response.data[0]['REPORTFORMAT'];
    }
  } catch (e) {
    print("Error fetching sampling person: $e");
  }
}

Future<void> fetchSamplingPerson() async {
  try {
    final response = await Dio().post(
      "${serverGB}TLA/GETSAMPLINGPERSON",
      data: {
        "BRANCH": P20CREATEREQUESTVAR.labname,
      },
    );
    // print(response.data);
    P20CREATEREQUESTVAR.SamplingPerson = List<String>.from(response.data.map((item) => item['SHORTNAME']));
  } catch (e) {
    print("Error fetching sampling person: $e");
  }
}

Future<void> fetchDefaultSamplingPerson() async {
  try {
    final response = await Dio().post(
      "${serverGB}TLA/GETDEFALUTSAMPLINGPERSON",
      data: {
        "CUSTNAME": P20CREATEREQUESTVAR.customername,
      },
    );
    // print(response.data);
    P20CREATEREQUESTVAR.DefalutSamplingPerson =
        List<String>.from(response.data.map((item) => item['DEFAULTPERSON']));
    // print(P20CREATEREQUESTVAR.DefalutSamplingPerson);
  } catch (e) {
    print("Error fetching sampling person: $e");
  }
}

Future<void> fetchAndTransformPatternData() async {
  try {
    final response = await Dio().post(
      "${serverGB}TLA/GETUNIQEMASTERPATTERN",
      data: {
        "CUSTNAME": P20CREATEREQUESTVAR.customername,
        "TYPE": P20CREATEREQUESTVAR.type,
      },
    );

    final List<Map<String, dynamic>> fetchedData = List<Map<String, dynamic>>.from(response.data);

    filteredData = fetchedData;
    // convertPrintMap(filteredData);
    transformedData = transformFilteredData(filteredData);
  } catch (e) {
    print("Error fetching pattern data: $e");
  }
}

List<Map<String, dynamic>> transformFilteredData(List<Map<String, dynamic>> filteredData) {
  List<Map<String, dynamic>> transformedData = [];

  for (var item in filteredData) {
    // ตรวจสอบ SMAPLENO1 ถึง SMAPLENO10 (หรือมากกว่าตามที่มี)
    for (int i = 1; i <= 10; i++) {
      String sampleKey = 'SMAPLENO$i';
      String sampleListKey = 'SMAPLENO${i}LIST';

      if (item.containsKey(sampleKey) &&
          item[sampleKey] != null &&
          item[sampleKey].toString().isNotEmpty &&
          item.containsKey(sampleListKey) &&
          item[sampleListKey] != null &&
          item[sampleListKey] is List &&
          (item[sampleListKey] as List).isNotEmpty) {
        String sampleName = item[sampleKey].toString();
        List<dynamic> sampleList = item[sampleListKey] as List;

        // แปลงแต่ละ item ใน SAMPLELIST
        for (int itemIndex = 0; itemIndex < sampleList.length; itemIndex++) {
          var sampleItem = sampleList[itemIndex];

          transformedData.add({
            'SAMPLENO': i, // หมายเลข sample (1, 2, 3, ...)
            'SAMPLENAME': sampleName, // ชื่อ sample เช่น Pit35, Circulation
            'BOTTLENO': sampleItem['BottleNOset'] ?? '',
            'ITEMNO': itemIndex + 1, // เรียงลำดับจาก 1
            'INSTRUMENTNAME': sampleItem['INSTRUMENTNAME'] ?? '',
            'ITEMNAME': sampleItem['ITEMNAME'] ?? '',
            'REPORTFORMAT': sampleItem['Reportformat'] ?? '',
            // เก็บข้อมูลเพิ่มเติมที่อาจต้องใช้
            'ID': item['_id'],
            'CUSTNAME': item['CUSTNAME'],
            'TYPE': item['TYPE'],
          });
        }
      }
    }
  }

  return transformedData;
}

Future<void> CreateRequest() async {
  try {
    Map<String, dynamic> apiData = prepareDataForAPI(transformedData);
    // print(apiData);
    final response = await Dio().post(
      "${serverGB}WWT/CreateRequest",
      data: {
        "dataRow": apiData,
      },
    );

    print(response.statusCode);
    // print(response.data['message']);
    if (response.statusCode == 200) {
      showSuccessPopup(CREATEREQUESTMAINcontext, response.data['message'], "Create Request Success");
    } else {
      showErrorPopup(CREATEREQUESTMAINcontext, response.toString());
    }
  } catch (e) {
    showErrorPopup(CREATEREQUESTMAINcontext, 'กรุณากรอกข้อมูลให้ครบถ้วน');
    print("Error fetching sampling person: $e");
  }
}

Future<void> printTag() async {
  try {
    Map<String, dynamic> apiData = prepareDataForAPI(transformedData);

    final response = await Dio().post(
      "${apiSAR}SAR/PrintTagWWT",
      data: {
        "dataRow": apiData,
        "printer": selectedPrinter,
      },
    );
    // print(apiSAR + "SAR/PrintTagWWT");
    // print(response.statusCode);
    // print(response.data['message']);
    if (response.statusCode == 200) {
      showSuccessPopup(CREATEREQUESTMAINcontext, response.data['message'], "Create Request Success");
    } else {
      showErrorPopup(CREATEREQUESTMAINcontext, response.toString());
    }
  } catch (e) {
    showErrorPopup(CREATEREQUESTMAINcontext, 'Print Tag Error');
    print("Error fetching sampling person: $e");
  }
}

Map<String, dynamic> prepareDataForAPI(List<Map<String, dynamic>> transformedData) {
  List<Map<String, dynamic>> apiDataRows = transformedData
      .map((item) => {
            'ReqCode': P20CREATEREQUESTVAR.labname == "TPK BANGPOO LAB" ? 'ACB' : 'ACR',
            'Type': P20CREATEREQUESTVAR.type,
            'ReqType': P20CREATEREQUESTVAR.requesttype,
            'ReqBranch': P20CREATEREQUESTVAR.labname,
            'ReqSection': USERDATA.Section,
            'ReqDate': DateTime.now().toString(),
            'ReqUser': USERDATA.NAME,
            'CustName': P20CREATEREQUESTVAR.customername,
            'SampPerson': P20CREATEREQUESTVAR.samplingperson,
            'SampDate': formatSamplingDate(SamplingDateControllers[item['SAMPLENO']].text),
            'SampNo': item['SAMPLENO'],
            'SampName': item['SAMPLENAME'],
            'BottleNo': item['BOTTLENO'],
            'ItemNo': item['ITEMNO'],
            'InsName': item['INSTRUMENTNAME'],
            'ItemName': item['ITEMNAME'],
            'ReportFormat': item['REPORTFORMAT'],
            'ReqStatus': 'WAIT SAMPLE',
            'SampleStatus': 'WAIT SAMPLE',
            'ItemStatus': 'WAIT SAMPLE',
          })
      .toList();

  return {
    'dataRow': apiDataRows,
  };
}

String formatSamplingDate(String inputDate) {
  try {
    if (inputDate.isEmpty) return '';
    final inputFormat = DateFormat("dd-MM-yy HH:mm");
    final outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    DateTime parsedDate = inputFormat.parse(inputDate);
    return outputFormat.format(parsedDate);
  } catch (e) {
    print('Date parse error: $e');
    return '';
  }
}

void convertPrintMap(List<Map<dynamic, dynamic>> data) {
  const encoder = JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(data);
  debugPrint(pretty);
}
