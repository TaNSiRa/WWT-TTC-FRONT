// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../bloc/BlocEvent/01-3-INCOMMINGMASTERdropdown.dart';
import '01INCOMMINGMASTER/INCOMMINGMASTERmain.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Page1BlocTableBody();
  }
}

class Page1BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page1BlocTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOMMINGMASTER_Bloc(),
        child: BlocBuilder<INCOMMINGMASTER_Bloc, DatasetWithSatatus>(
          builder: (context, data) {
            return Page1BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page1BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page1BlocMSG({
    super.key,
    this.data,
  });
  DatasetWithSatatus? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOMMINGMASTERmsg_Bloc(),
        child: BlocBuilder<INCOMMINGMASTERmsg_Bloc, String>(
          builder: (context, msg) {
            return Page1BlocDROPDOWN(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page1BlocDROPDOWN extends StatelessWidget {
  /// {@macro counter_page}
  Page1BlocDROPDOWN({
    super.key,
    this.data,
    this.msg,
  });
  DatasetWithSatatus? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOMMINGMASTERdropdown_Bloc(),
        child: BlocBuilder<INCOMMINGMASTERdropdown_Bloc, DROPDOWNset>(
          builder: (context, DD) {
            return Page1Body(
              data: data,
              msg: msg,
              DD: DD,
            );
          },
        ));
  }
}

class Page1Body extends StatelessWidget {
  Page1Body({
    super.key,
    this.data,
    this.msg,
    this.DD,
  });
  DatasetWithSatatus? data;
  String? msg;
  DROPDOWNset? DD;
  @override
  Widget build(BuildContext context) {
    return INCOMMINGMASTERmain(
      data: data,
      msg: msg,
      DD: DD,
    );
  }
}
