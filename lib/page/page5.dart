// ignore_for_file: depend_on_referenced_packages, must_be_immutable, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/05-1-FINSPECTIONget.dart';
import '../bloc/BlocEvent/05-4-UPLOADSPEC.dart';
import '../bloc/cubit/Rebuild.dart';

import '05INSPECTIONstd/INSPECTIONstdMAIN.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Page5REBUILD();
  }
}

class Page5REBUILD extends StatelessWidget {
  const Page5REBUILD({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return const FINSPECTIONget_Bloc_5PBloc();
      },
    );
  }
}

class FINSPECTIONget_Bloc_5PBloc extends StatelessWidget {
  /// {@macro counter_page}
  const FINSPECTIONget_Bloc_5PBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FINSPECTIONget_Bloc(),
        child: BlocBuilder<FINSPECTIONget_Bloc, InspectionSTD>(
          builder: (context, Mdata) {
            return Page5UPLOAD(
              Mdata: Mdata,
            );
          },
        ));
  }
}

class Page5UPLOAD extends StatelessWidget {
  Page5UPLOAD({
    super.key,
    this.Mdata,
  });
  InspectionSTD? Mdata;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => UPLOADSPEC_Bloc(),
        child: BlocBuilder<UPLOADSPEC_Bloc, String>(
          builder: (context, msg) {
            return Page5Body(
              Mdata: Mdata,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({
    super.key,
    this.Mdata,
  });

  InspectionSTD? Mdata;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: INSPECTIONstdMAIN(
        Mdata: Mdata,
      ),
    );
  }
}
