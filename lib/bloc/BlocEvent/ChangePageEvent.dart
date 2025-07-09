// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, file_names, non_constant_identifier_names, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/page0.dart';

import '../../widget/menu/mainmenu.dart';
import '../cubit/NotificationEvent.dart';

class ChangePage_Bloc extends Cubit<Widget> {
  /// {@macro brightness_Cubit}
  ChangePage_Bloc() : super(const Page0());

  Future<void> ChangePage_nodrower(String name, Widget CuPagein) async {
    // String output = input;
    if (USERDATA.UserLV >= CuPageLV) {
      // print(name);
      PageName = name;
    } else {
      CuPagein = const Page0();
      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("Error", "No have permission", enumNotificationlist.Error);
    }

    emit(CuPagein);
  }

  Future<void> ChangePage(String name, Widget CuPagein) async {
    // String output = input;
    if (USERDATA.UserLV >= CuPageLV) {
      // print(name);
      selectpage = name;
    } else {
      CuPagein = const Page0();

      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("Error", "No have permission", enumNotificationlist.Error);
    }
    Navigator.pop(MenuContext);
    emit(CuPagein);
  }

  // Future<void> Flush(String input) async {
  //   String output = '';
  //   emit(output);
  // }
}
