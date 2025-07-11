// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, must_be_immutable, depend_on_referenced_packages, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../bloc/BlocEvent/01-3-INCOMMINGMASTERdropdown.dart';
import '../../data/global.dart';
import 'INCOMMINGMASTERvar.dart';
import 'subINCOMMINGMASTER/01TYPES.dart';
import 'subINCOMMINGMASTER/02SAMPLENAME.dart';
import 'subINCOMMINGMASTER/03InstrumentName.dart';
import 'subINCOMMINGMASTER/04ItemNameNAME.dart';
import 'subINCOMMINGMASTER/05CUST.dart';
import 'subINCOMMINGMASTER/06WWTITEM.dart';

late BuildContext INCOMMINGMASTERmainCONTEXT;

class INCOMMINGMASTERmain extends StatefulWidget {
  INCOMMINGMASTERmain({
    super.key,
    this.data,
    this.msg,
    this.DD,
  });
  DatasetWithSatatus? data;
  String? msg;
  DROPDOWNset? DD;

  @override
  State<INCOMMINGMASTERmain> createState() => _INCOMMINGMASTERmainState();
}

class _INCOMMINGMASTERmainState extends State<INCOMMINGMASTERmain> {
  StepperType stepperType = StepperType.horizontal;
  @override
  void initState() {
    super.initState();
    INCOMMINGMASTERvar.currentStep = 0;
    context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());
    context.read<INCOMMINGMASTERdropdown_Bloc>().add(INCOMMINGMASTERdropdown_MASTER());
    // print("INC");
    PageName = 'MASTER LIST';
  }

  @override
  Widget build(BuildContext context) {
    INCOMMINGMASTERmainCONTEXT = context;
    DatasetWithSatatus _data = widget.data ?? DatasetWithSatatus(data: []);

    if (_data.position == 'GETTYPE') {
      INCOMMINGMASTERvar.TYPEget = _data.data;
    }
    if (_data.position == 'GETSAMPLENAME') {
      INCOMMINGMASTERvar.UNITget = _data.data;
    }
    if (_data.position == 'INSTRUMENTNAME') {
      INCOMMINGMASTERvar.ITEMSget = _data.data;
    }
    if (_data.position == 'ITEMNAME') {
      INCOMMINGMASTERvar.MACHINENAMEget = _data.data;
    }
    if (_data.position == 'CUSTNAME') {
      INCOMMINGMASTERvar.METHODEget = _data.data;
    }
    if (_data.position == 'WWTITEM') {
      INCOMMINGMASTERvar.SPECIALSPECget = _data.data;
    }
    // if (_data.position == 'CALCULATEget') {
    //   INCOMMINGMASTERvar.CALCULATEget = _data.data;
    // }
    // if (_data.position == 'COMMENTget') {
    //   INCOMMINGMASTERvar.COMMENTget = _data.data;
    // }
    INCOMMINGMASTERvar.TYPEddBUFF = widget.DD!.TYPEdd;
    INCOMMINGMASTERvar.ITEMSddBUFF = widget.DD!.ITEMSdd;
    INCOMMINGMASTERvar.METHODddBUFF = widget.DD!.METHODdd;
    INCOMMINGMASTERvar.RESULTFORMATBUFF = widget.DD!.RESULTFORMAT;
    INCOMMINGMASTERvar.GRAPHTYPEBUFF = widget.DD!.GRAPHTYPE;
    INCOMMINGMASTERvar.INSTRUMENTSBUFF = widget.DD!.INSTRUMENTS;
    INCOMMINGMASTERvar.CALCULATEBUFF = widget.DD!.CALCULATE;

//CALCULATE
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  secondary: Colors.grey,
                ),
                canvasColor: Colors.white,
              ),
              child: Stepper(
                controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                  // bool hide = false;
                  return const SizedBox();
                },
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: INCOMMINGMASTERvar.currentStep,
                onStepTapped: (step) => tapped(step),
                // onStepContinue: continued,
                // onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: const Text(
                      'Type',
                    ),
                    content: TYPEStable_INC(
                      data: INCOMMINGMASTERvar.TYPEget,
                    ),
                    // content: Container(),
                    isActive: INCOMMINGMASTERvar.currentStep == 0,
                    state: INCOMMINGMASTERvar.currentStep == 0 ? StepState.indexed : StepState.indexed,
                  ),
                  Step(
                    title: const Text('SampleName'),
                    content: UNITStable_INC(
                      data: INCOMMINGMASTERvar.UNITget,
                    ),
                    isActive: INCOMMINGMASTERvar.currentStep == 1,
                    state: INCOMMINGMASTERvar.currentStep == 1 ? StepState.indexed : StepState.indexed,
                  ),
                  Step(
                    title: const Text('InstrumentName'),
                    content: ITEMStable_INC(
                      data: INCOMMINGMASTERvar.ITEMSget,
                    ),
                    isActive: INCOMMINGMASTERvar.currentStep == 2,
                    state: INCOMMINGMASTERvar.currentStep == 2 ? StepState.indexed : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Item Name'),
                    content: MACHINENAMEtable_INC(
                      data: INCOMMINGMASTERvar.MACHINENAMEget,
                    ),
                    isActive: INCOMMINGMASTERvar.currentStep == 3,
                    state: INCOMMINGMASTERvar.currentStep == 3 ? StepState.indexed : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Cust Name'),
                    content: CUSTtable_INC(
                      data: INCOMMINGMASTERvar.METHODEget,
                    ),
                    isActive: INCOMMINGMASTERvar.currentStep == 4,
                    state: INCOMMINGMASTERvar.currentStep == 4 ? StepState.indexed : StepState.indexed,
                  ),
                  Step(
                    title: const Text('WWT ITEM'),
                    content: WWTITEMtable_INC(
                      data: INCOMMINGMASTERvar.SPECIALSPECget,
                    ),
                    isActive: INCOMMINGMASTERvar.currentStep == 5,
                    state: INCOMMINGMASTERvar.currentStep == 5 ? StepState.indexed : StepState.indexed,
                  ),
                  // Step(
                  //   title: const Text(
                  //     'CALCULATE',
                  //   ),
                  //   content: CALCULATEtable_INC(
                  //     data: INCOMMINGMASTERvar.CALCULATEget,
                  //   ),
                  //   isActive: INCOMMINGMASTERvar.currentStep == 6,
                  //   state: INCOMMINGMASTERvar.currentStep == 6
                  //       ? StepState.indexed
                  //       : StepState.indexed,
                  // ),
                  // Step(
                  //   title: const Text(
                  //     'COMMENT',
                  //   ),
                  //   content: COMMENTtable_INC(
                  //     data: INCOMMINGMASTERvar.COMMENTget,
                  //   ),
                  //   isActive: INCOMMINGMASTERvar.currentStep == 7,
                  //   state: INCOMMINGMASTERvar.currentStep == 7
                  //       ? StepState.indexed
                  //       : StepState.indexed,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() {
      // print(step);
      if (step == 0) {
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());
      } else if (step == 1) {
        context.read<INCOMMINGMASTERdropdown_Bloc>().add(INCOMMINGMASTERdropdown_MASTER());
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_UNITget());
      } else if (step == 2) {
        context.read<INCOMMINGMASTERdropdown_Bloc>().add(INCOMMINGMASTERdropdown_MASTER());
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_ITEMSget());
      } else if (step == 3) {
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_MACHINENAMEget());
      } else if (step == 4) {
        context.read<INCOMMINGMASTERdropdown_Bloc>().add(INCOMMINGMASTERdropdown_MASTER());
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_METHODEget());
      } else if (step == 5) {
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_SPECIALSPECget());
      } else if (step == 6) {
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_CALCULATEget());
      } else if (step == 7) {
        context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_COMMENTget());
      }

      //INCOMMINGMASTER_CALCULATEget
      INCOMMINGMASTERvar.currentStep = step;
    });
  }

  continued() {
    INCOMMINGMASTERvar.currentStep < 2 ? setState(() => INCOMMINGMASTERvar.currentStep += 1) : null;
  }

  cancel() {
    INCOMMINGMASTERvar.currentStep > 0 ? setState(() => INCOMMINGMASTERvar.currentStep -= 1) : null;
  }
}
