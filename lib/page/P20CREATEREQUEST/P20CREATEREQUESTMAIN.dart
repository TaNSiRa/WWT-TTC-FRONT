import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/bloc/BlocEvent/20-01-P20CREATEREQUESTGETDATA.dart';
import 'package:flutter_master/bloc/cubit/Rebuild.dart';

import '../../bloc/BlocEvent/04-2-GETDROPDOWNMASTER.dart';
import '../../data/global.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Timewid.dart';
import '../page11.dart';
import 'P20CREATEREQUESTVAR.dart';
import 'package:dropdown_search/dropdown_search.dart';

late BuildContext CREATEREQUESTMAINcontext;
ScrollController _controllerIN01 = ScrollController();

List<P20CREATEREQUESTGETDATAclass> filteredData = [];

class CREATEREQUESTMAIN extends StatefulWidget {
  CREATEREQUESTMAIN({
    super.key,
    this.data,
  });
  List<P20CREATEREQUESTGETDATAclass>? data;
  @override
  State<CREATEREQUESTMAIN> createState() => _CREATEREQUESTMAINState();
}

class _CREATEREQUESTMAINState extends State<CREATEREQUESTMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P20CREATEREQUESTGETDATA_Bloc>().add(P20CREATEREQUESTGETDATA_GET());
    P20CREATEREQUESTVAR.customername = "";
    P20CREATEREQUESTVAR.type = "";
  }

  @override
  Widget build(BuildContext context) {
    CREATEREQUESTMAINcontext = context;
    List<P20CREATEREQUESTGETDATAclass> _datain = widget.data ?? [];

    TextEditingController CustomerNameController = TextEditingController();
    TextEditingController TypeController = TextEditingController();
    TextEditingController SamplingPersonController = TextEditingController();
    TextEditingController LabNameController = TextEditingController();
    TextEditingController RequestTypeController = TextEditingController();
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ส่วนหัวที่ไม่เลื่อน
                Container(
                  width: 600,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
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
                          Spacer(),
                          Container(
                            width: 400,
                            child: buildCustomField(
                              controller: CustomerNameController,
                              labelText: 'Customer Name',
                              icon: Icons.factory_rounded,
                              dropdownItems: P20CREATEREQUESTVAR.CustomerName,
                              onChanged: (value) {
                                P20CREATEREQUESTVAR.customername = value;
                                setState(() {
                                  if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                                      P20CREATEREQUESTVAR.type.isNotEmpty) {
                                    filteredData = _datain.where((data) {
                                      return data.CUSTNAME == P20CREATEREQUESTVAR.customername &&
                                          data.TYPE == P20CREATEREQUESTVAR.type;
                                    }).toList();
                                    filteredData.sort((a, b) {
                                      int sampleCompare =
                                          int.parse(a.SAMPLENO).compareTo(int.parse(b.SAMPLENO));
                                      if (sampleCompare != 0) return sampleCompare;
                                      return int.parse(a.ITEMNO).compareTo(int.parse(b.ITEMNO));
                                    });
                                    // print(filteredData.length);
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Type :', style: buildTextStyle()),
                          Spacer(),
                          Container(
                            width: 400,
                            child: buildCustomField(
                              controller: TypeController,
                              labelText: 'Type',
                              icon: Icons.category,
                              dropdownItems: P20CREATEREQUESTVAR.Type,
                              onChanged: (value) {
                                P20CREATEREQUESTVAR.type = value;
                                setState(() {
                                  if (P20CREATEREQUESTVAR.customername.isNotEmpty &&
                                      P20CREATEREQUESTVAR.type.isNotEmpty) {
                                    filteredData = _datain.where((data) {
                                      return data.CUSTNAME == P20CREATEREQUESTVAR.customername &&
                                          data.TYPE == P20CREATEREQUESTVAR.type;
                                    }).toList();
                                    filteredData.sort((a, b) {
                                      int sampleCompare =
                                          int.parse(a.SAMPLENO).compareTo(int.parse(b.SAMPLENO));
                                      if (sampleCompare != 0) return sampleCompare;
                                      return int.parse(a.ITEMNO).compareTo(int.parse(b.ITEMNO));
                                    });
                                    // print(filteredData.length);
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),

                // เนื้อหาที่เลื่อนได้
                Expanded(
                  child: Scrollbar(
                    controller: _controllerIN01,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10,
                    radius: Radius.circular(20),
                    child: SingleChildScrollView(
                      controller: _controllerIN01,
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 600,
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Sampling Person :', style: buildTextStyle()),
                                      Spacer(),
                                      Container(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: SamplingPersonController,
                                          labelText: 'Sampling Person',
                                          icon: Icons.person,
                                          dropdownItems: P20CREATEREQUESTVAR.SamplingPerson,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Branch :', style: buildTextStyle()),
                                      Spacer(),
                                      Container(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: LabNameController,
                                          labelText: 'Branch',
                                          icon: Icons.biotech,
                                          dropdownItems: P20CREATEREQUESTVAR.LabName,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Request Type :', style: buildTextStyle()),
                                      Spacer(),
                                      Container(
                                        width: 400,
                                        child: buildCustomField(
                                          controller: RequestTypeController,
                                          labelText: 'Request Type',
                                          icon: Icons.autorenew_rounded,
                                          dropdownItems: P20CREATEREQUESTVAR.RequestType,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
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
                                  ...filteredData.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final item = entry.value;

                                    List<Widget> widgets = [];

                                    if (index == 0 || item.SAMPLENO != filteredData[index - 1].SAMPLENO) {
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
                                                controller:
                                                    SamplingDateControllers[int.parse('${item.SAMPLENO}')],
                                                labelText: 'Sampling Sample Date ${item.SAMPLENO}',
                                                icon: Icons.calendar_month_rounded,
                                                onChanged: (value) {},
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
                                                          filteredData.removeWhere(
                                                              (e) => e.SAMPLENO == item.SAMPLENO);
                                                        });
                                                      },
                                                    );
                                                    // print(filteredData.length);
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
                                              TableCell(child: buildDataCell(item.SAMPLENO)),
                                              TableCell(child: buildDataCell(item.SAMPLENAME)),
                                              TableCell(child: buildDataCell(item.BOTTLENO)),
                                              TableCell(child: buildDataCell(item.ITEMNO)),
                                              TableCell(child: buildDataCell(item.INSTRUMENTNAME)),
                                              TableCell(child: buildDataCell(item.ITEMNAME)),
                                              TableCell(child: buildDataCell(item.REPORTFORMAT)),
                                              TableCell(
                                                child: buildDeleteCell(
                                                  index,
                                                  CREATEREQUESTMAINcontext,
                                                  filteredData,
                                                  onConfirm: () {
                                                    setState(() {
                                                      filteredData.removeAt(index);
                                                    });
                                                    print(filteredData.length);
                                                    print('filteredData.length');
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );

                                    if (index == filteredData.length - 1 ||
                                        item.SAMPLENO != filteredData[index + 1].SAMPLENO) {
                                      widgets.add(
                                        InkWell(
                                          onTap: () {
                                            showAddItemDialog(CREATEREQUESTMAINcontext);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: P20CREATEREQUESTVAR.AddandCreate,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1), color: Colors.lightGreenAccent),
                                            child: Text(
                                              '➕ เพิ่ม Item',
                                              style:
                                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return Column(children: widgets);
                                  }).toList(),
                                ],
                              ),
                            ],
                            SizedBox(height: 10),
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
                            onConfirm: () {},
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          shadowColor: Colors.greenAccent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.green, width: 2),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: const [
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
                SizedBox(width: 20),
                Icon(icon, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
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
        style: TextStyle(fontSize: 14),
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
  if (labelText == 'Sample Name' || labelText == 'Item Name') {
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
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(
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
  return TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle buildTextStyleGrey() {
  return TextStyle(
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
        style: TextStyle(color: Colors.white, fontSize: 16),
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
        title: Row(
          children: const [
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
            child: Text('ยกเลิก', style: TextStyle(color: Colors.red)),
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
        title: Row(
          children: const [
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
            child: Text('ยกเลิก', style: TextStyle(color: Colors.red)),
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
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: const [
            Icon(Icons.note_add_rounded, color: Colors.green),
            SizedBox(width: 8),
            Text('ยืนยันการสร้าง Request?'),
          ],
        ),
        content: const Text(
          'คุณต้องการที่จะสร้าง Request หรือไม่?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ยกเลิก', style: TextStyle(color: Colors.green)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}

Widget buildDeleteCell(int index, BuildContext context, List<P20CREATEREQUESTGETDATAclass> filteredData,
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

void showAddItemDialog(BuildContext context) {
  TextEditingController SampleNoController = TextEditingController();
  TextEditingController SampleNameController = TextEditingController();
  TextEditingController BottleNoController = TextEditingController();
  TextEditingController ItemNoController = TextEditingController();
  TextEditingController InstrumentNameController = TextEditingController();
  TextEditingController ItemNameController = TextEditingController();
  TextEditingController ReportFormatController = TextEditingController();
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
                  Text(
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
                          SizedBox(
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
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green,
                                shadowColor: Colors.greenAccent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.green, width: 2),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5,
                                children: const [
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
//     // TODO: implement initState
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
//     // TODO: implement initState
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
