import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import 'P20CREATEREQUEST/P20CREATEREQUESTMAIN.dart';

class Page20 extends StatelessWidget {
  const Page20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page20Body();
  }
}

class Page20Body extends StatelessWidget {
  Page20Body({
    Key? key,
    this.data,
  }) : super(key: key);
  PATTERNDATAClass? data;
  @override
  Widget build(BuildContext context) {
    return CREATEREQUESTMAIN();
  }
}
