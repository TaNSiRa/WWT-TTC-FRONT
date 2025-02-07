import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import '01INCOMMINGMASTER/subINCOMMINGMASTER/03InstrumentName.dart';
import '11PATTERNTTC/11PATTERNTTCMAIN.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11GET();
  }
}

class Page11GET extends StatelessWidget {
  Page11GET({
    Key? key,
  }) : super(key: key);

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
    Key? key,
    this.data,
  }) : super(key: key);
  PATTERNDATAClass? data;
  @override
  Widget build(BuildContext context) {
    return PATTERNTTCMAIN(
      data: data,
    );
  }
}
