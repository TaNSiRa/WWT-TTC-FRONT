import 'package:flutter/material.dart';

import 'page11.dart';
import 'page20.dart';
import 'page4.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Page0Body();
    return Page4();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({super.key});

  @override
  Widget build(BuildContext context) {
    // if (serverGB == '') {
    //   return Page1();
    // } else {
    // return Page4();
    // }
    // return Page11();
    return const Page20();
  }
}
