// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import '11PATTERNTTC/11PATTERNTTCMAIN.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Page11GET();
  }
}

class Page11GET extends StatelessWidget {
  const Page11GET({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PATTERNDATAGET_Bloc(),
        child: BlocBuilder<PATTERNDATAGET_Bloc, PATTERNDATAClass>(
          builder: (context, data) {
            return Page11Body(
              data: data,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({
    super.key,
    this.data,
  });
  PATTERNDATAClass? data;
  @override
  Widget build(BuildContext context) {
    return PATTERNTTCMAIN(
      data: data,
    );
  }
}
