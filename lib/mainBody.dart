// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/BlocEvent/ChangePageEvent.dart';
import 'bloc/BlocEvent/LoginEvent.dart';
import 'bloc/cubit/NotificationEvent.dart';
import 'bloc/cubit/Rebuild.dart';
import 'data/global.dart';
import 'page/loginpage.dart';
import 'widget/appbar/AppBar.dart';
import 'widget/menu/mainmenu.dart';
import 'widget/notification/noti01.dart';

//-------------------------------------

late BuildContext MainBodyContext;
late BuildContext LoginContext;

class MainBlocRebuild extends StatelessWidget {
  const MainBlocRebuild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(builder: (_, e) {
      return const MainbodyBuffer();
    });
  }
}

class MainbodyBuffer extends MainBlocRebuild {
  const MainbodyBuffer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Login_Bloc(),
        child: BlocBuilder<Login_Bloc, String>(
          builder: (context, tokenin) {
            return BlocProvider(
                create: (_) => BlocNotification(),
                child: BlocBuilder<BlocNotification, NotificationState>(
                  builder: (context, notification) {
                    contextGB = context;
                    return Scaffold(
                      body: Stack(
                        children: [
                          pre_login(),
                          Positioned(
                            top: 64,
                            right: 24,
                            child: BlocBuilderNotification(),
                          ),
                        ],
                      ),
                    );
                  },
                ));
          },
        ));
  }
}

class pre_login extends StatefulWidget {
  const pre_login({super.key});

  @override
  State<pre_login> createState() => _pre_loginState();
}

class _pre_loginState extends State<pre_login> {
  @override
  void initState() {
    super.initState();
    context.read<Login_Bloc>().add(ReLogin());
  }

  @override
  Widget build(BuildContext context) {
    LoginContext = context;
    if (token != '') {
      return BlocProvider(
          create: (_) => ChangePage_Bloc(),
          child: BlocBuilder<ChangePage_Bloc, Widget>(
            builder: (context, page) {
              return MainBody(page: page);
            },
          ));
    } else {
      return const Loginbody();
    }
  }
}

// class MainBody extends StatelessWidget {
//   MainBody({Key? key, required this.page}) : super(key: key);
//   Widget page;

//   @override
//   Widget build(BuildContext context) {
//     MainBodyContext = context;
//     initSocketConnection();
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF0b1327),
//           actions: <Widget>[App_Bar()],
//           // title: Text(PageName),
//         ),
//         drawer: MainMenu(),
//         body: page);
//   }
// }

class MainBody extends StatelessWidget {
  MainBody({super.key, required this.page});
  Widget page;

  @override
  Widget build(BuildContext context) {
    MainBodyContext = context;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 201, 201, 211),
                  Color(0xFF1565C0),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: AppBar(
              // backgroundColor: const Color(0xFF0b1327),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[App_Bar()],
              // title: Text(PageName),
            ),
          ),
        ),
        drawer: const MainMenu(),
        body: page);
  }
}

class Loginbody extends StatelessWidget {
  const Loginbody({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPageWidget();
  }
}
