import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-PATTERNDATA.dart';
import '../bloc/BlocEvent/20-01-P20CREATEREQUESTGETDATA.dart';
import 'P20CREATEREQUEST/P20CREATEREQUESTMAIN.dart';

class Page20 extends StatelessWidget {
  const Page20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page20blockget();
  }
}

class Page20blockget extends StatelessWidget {
  const Page20blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P20CREATEREQUESTGETDATA_Bloc(),
        child: BlocBuilder<P20CREATEREQUESTGETDATA_Bloc, List<P20CREATEREQUESTGETDATAclass>>(
          builder: (context, data) {
            return Page20Body(
              data: data,
            );
          },
        ));
  }
}

class Page20Body extends StatelessWidget {
  Page20Body({
    super.key,
    this.data,
  });
  List<P20CREATEREQUESTGETDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return CREATEREQUESTMAIN(
      data: data,
    );
  }
}
