// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, camel_case_types, must_be_immutable, no_leading_underscores_for_local_identifiers, deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/BlocEvent/LoginEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/page1.dart';
import '../../page/page20.dart';
import '../../page/page4.dart';

late BuildContext MenuContext;

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    MenuContext = context;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color(0xFF1565C0),
            Color.fromARGB(255, 0, 0, 0),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: const Center(
        child: Data_Menu_mainmenu(),
      ),
    );
  }
}

class Data_Menu_mainmenu extends StatelessWidget {
  const Data_Menu_mainmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            height: 80,
            width: 180,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo_tpk.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  USERDATA.NAME,
                  style: const TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    menu_normal(
                      name: "MASTER LIST",
                      page: const Page1(),
                      Lv: 1,
                      icon: Icons.view_list_rounded,
                    ),
                    menu_normal(
                      name: "CREATE PATTERN",
                      page: const Page4(),
                      Lv: 1,
                      icon: Icons.list_alt_rounded,
                    ),
                    menu_normal(
                      name: "NEW REQUEST",
                      page: const Page20(),
                      Lv: 1,
                      icon: Icons.note_add_rounded,
                    ),
                    // menu_dropdown(
                    //   name: "EDIT",
                    //   icon: Icons.edit,
                    //   items: [
                    //     DropdownMenuItem(
                    //       name: "EDIT CUSTOMER",
                    //       page: const Page6(),
                    //       icon: Icons.person_outline,
                    //     ),
                    //     DropdownMenuItem(
                    //       name: "EDIT REQUESTER",
                    //       page: const Page10(),
                    //       icon: Icons.person_3_outlined,
                    //     ),
                    //     if (USERDATA.UserLV >= 99 || USERDATA.Permission == 'Admin')
                    //       DropdownMenuItem(
                    //         name: "EDIT USER",
                    //         page: const Page8(),
                    //         icon: Icons.people_rounded,
                    //       ),
                    //   ],
                    // ),
                    // menu_normal(
                    //   name: "CHANGE PASSWORD",
                    //   page: const Page7(),
                    //   Lv: 1,
                    //   icon: Icons.lock_reset,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: menu_logout(
              name: "Logout",
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DropdownMenuItem {
  final String name;
  final Widget page;
  final IconData icon;

  DropdownMenuItem({
    required this.name,
    required this.page,
    required this.icon,
  });
}

class menu_dropdown extends StatefulWidget {
  menu_dropdown({
    super.key,
    this.name,
    this.icon,
    required this.items,
  });
  String? name;
  IconData? icon;
  List<DropdownMenuItem> items;

  @override
  _menu_dropdownState createState() => _menu_dropdownState();
}

class _menu_dropdownState extends State<menu_dropdown> {
  bool isHovered = false;
  OverlayEntry? _overlayEntry;

  void _showDropdown() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _createOverlayEntry(position);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(Offset position) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 190,
        top: position.dy,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
            _hideDropdown();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.items.map((item) {
                  return InkWell(
                    onTap: () {
                      _hideDropdown();
                      CuPageLV = 1;
                      MainBodyContext.read<ChangePage_Bloc>().ChangePage('', item.page);
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1565C0).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              item.icon,
                              size: 16,
                              color: const Color(0xFF1565C0),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontFamily: 'Mitr',
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _name = widget.name ?? "";

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
          _showDropdown();
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
          Future.delayed(const Duration(milliseconds: 0), () {
            if (!isHovered) {
              _hideDropdown();
            }
          });
        },
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(isHovered ? 0.2 : 0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  widget.icon ?? Icons.chevron_right_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  _name,
                  style: const TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.6),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideDropdown();
    super.dispose();
  }
}

class menu_logout extends StatelessWidget {
  menu_logout({super.key, this.name});
  String? name;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        LoginContext.read<Login_Bloc>().add(Logout());
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                _name,
                style: const TextStyle(
                  fontFamily: 'Mitr',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class menu_normal extends StatelessWidget {
  menu_normal({
    super.key,
    this.name,
    this.icon,
    required this.page,
    required this.Lv,
  });
  String? name;
  Widget page;
  IconData? icon;
  int Lv;
  String? pagename;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          CuPageLV = Lv;
          MainBodyContext.read<ChangePage_Bloc>().ChangePage(pagename ?? '', page);
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon ?? Icons.chevron_right_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  _name,
                  style: const TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white.withOpacity(0.6),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../bloc/BlocEvent/LoginEvent.dart';
// import '../../data/global.dart';
// import '../../mainBody.dart';
// import '../../page/page1.dart';
// import '../../page/page10.dart';
// import '../../page/page2.dart';
// import '../../page/page20.dart';
// import '../../page/page3.dart';
// import '../../page/page4.dart';
// import '../../page/page5.dart';
// import '../../page/page6.dart';
// import 'sub_widget.dart';

// late BuildContext MenuContext;
// bool menupop = false;

// class MainMenu extends StatefulWidget {
//   MainMenu({Key? key}) : super(key: key);

//   @override
//   _MainMenuState createState() => _MainMenuState();
// }

// class _MainMenuState extends State<MainMenu> {
//   @override
//   Widget build(BuildContext context) {
//     MenuContext = context;
//     //---------------------------------------------------------------

//     return Container(
//       height: (MediaQuery.of(context).size.height),
//       // width: MediaQuery.of(context).size.width,
//       width: 200,
//       color: const Color(0xff0b1327),
//       //color: Colors.red,
//       child: ListView(
//         children: [
//           Center(
//             child: Data_Menu_mainmenu(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Data_Menu_mainmenu extends StatefulWidget {
//   @override
//   State<Data_Menu_mainmenu> createState() => _Data_Menu_mainmenuState();
// }

// class _Data_Menu_mainmenuState extends State<Data_Menu_mainmenu> {
//   //const Data_Menu_mainmenu({Key? key},this.pagein) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // print(USERDATA.UserLV);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center, //Axis-Y
//       crossAxisAlignment: CrossAxisAlignment.center, //Axis-X

//       children: [
//         const SizedBox(
//           height: 20,
//         ),
//         // Align(
//         //     alignment: Alignment.center,
//         //     child: Container(
//         //         height: 40,
//         //         width: 180,
//         //         color: Colors.white,
//         //         child: Padding(
//         //           padding: const EdgeInsetsDirectional.all(1),
//         //           child: Container(
//         //             height: 35,
//         //             decoration: const BoxDecoration(
//         //               color: Colors.white,
//         //               image: DecorationImage(
//         //                 image: AssetImage("assets/images/logo_tpk.png"),
//         //                 fit: BoxFit.fitHeight,
//         //               ),
//         //             ),
//         //           ),
//         //         ))),
//         // menu_normal(
//         //   name: "Page1",
//         //   page: Page1(),
//         //   Lv: 1,
//         // ),
//         if (serverGB != '') ...[
//           InkWell(
//             onTap: () {
//               setState(() {
//                 if (menupop) {
//                   menupop = false;
//                 } else {
//                   menupop = true;
//                 }
//               });
//             },
//             child: SizedBox(
//               height: 50,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           right: 6.0, left: 6, top: 4.0, bottom: 4.0),
//                       child: Container(
//                         height: 24,
//                         width: 24,
//                         child: Icon(
//                           menupop
//                               ? Icons.arrow_drop_up_outlined
//                               : Icons.arrow_drop_down_outlined,
//                           color: Colors.white,
//                         ),
//                         // decoration: BoxDecoration(
//                         //     image: DecorationImage(
//                         //         image: AssetImage(getShowHidePassword_ImgPath()),
//                         //         fit: BoxFit.fitHeight))
//                       ),
//                     ),
//                     const Text(
//                       "MASTER MENU",
//                       style: TextStyle(
//                         fontFamily: 'Mitr',
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.normal,
//                         letterSpacing: 0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (menupop) ...[
//             menu_sub(
//               name: "LIST MASTER",
//               page: Page1(),
//               Lv: 1,
//             ),
//             // menu_sub(
//             //   name: "INPROCESS",
//             //   page: Page3(),
//             //   Lv: 1,
//             // ),
//             // menu_sub(
//             //   name: "FINAL",
//             //   page: Page2(),
//             //   Lv: 1,
//             // ),
//           ],

//           // menu_normal(
//           //   name: "MASTER FINAL",
//           //   page: Page2(),
//           //   Lv: 1,
//           // ),
//           // menu_normal(
//           //   name: "Page3",
//           //   page: Page3(),
//           //   Lv: 1,
//           // ),
//           // menu_normal(
//           //   name: "MATCP",
//           //   page: Page4(),
//           //   Lv: 1,
//           // ),
//           menu_normal(
//             name: "CREATE PATTERN",
//             page: Page4(),
//             Lv: 1,
//           ),
//           menu_normal(
//             name: "NEW REQUEST",
//             page: Page20(),
//             Lv: 1,
//           ),
//           // menu_normal(
//           //   name: "INSPECTION STD",
//           //   page: Page6(),
//           //   Lv: 1,
//           // ),
//           // menu_normal(
//           //   colorsetup: Colors.blue,
//           //   name: "SC MARK SETUP",
//           //   page: Page10(),
//           //   Lv: 1,
//           // ),
//           // menu_normal(
//           //   colorsetup: Colors.blue,
//           //   name: "Frequency control",
//           //   page: Page10(),
//           //   Lv: 1,
//           // ),
//         ],
//         // menu_normal(
//         //   colorsetup: Colors.blue,
//         //   name: "Select Plant",
//         //   page: Page10(),
//         //   Lv: 1,
//         // ),
//         menu_logout(
//           name: "Logout",
//         ),
//         const Divider(
//           color: Color(0x4dffffff),
//           height: 12,
//         ),
//       ],
//     );
//   }
// }

// class Logomenu extends StatelessWidget {
//   const Logomenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       width: 80,
//       color: Colors.white,

//       child: Padding(
//         padding: const EdgeInsetsDirectional.all(1),
//         child: Container(
//           height: 35,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             image: DecorationImage(
//               image: AssetImage("assets/images/logo_tpk.png"),
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//         ),
//       ),

//       //color: Colors.white,
//     );
//   }
// }

// class menu_logout extends StatelessWidget {
//   menu_logout({Key? key, this.name}) : super(key: key);
//   String? name;

//   @override
//   Widget build(BuildContext context) {
//     String _name = name ?? "";

//     return InkWell(
//       onTap: () {
//         LoginContext.read<Login_Bloc>().add(Logout());
//         // BlocProvider.of<SwPageCubit>(context).togglePage(page);
//         // CuPage = page;
//         // CuPageLV = Lv;
//         // MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
//       },
//       child: Container(
//         //color: Colors.blue,
//         height: 50,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: 24,
//                 width: 24,
//                 child: const Icon(
//                   Icons.logout,
//                   color: Colors.white,
//                   // size: 30.0,
//                 ),
//                 // decoration: BoxDecoration(
//                 //   color: Colors.redAccent.shade400,

//                 //   // image: DecorationImage(
//                 //   //   image: AssetImage(""),
//                 //   //   fit: BoxFit.fitWidth,
//                 //   // ),
//                 //   //borderRadius: BorderRadius.all(Radius.circular(24.0)),
//                 // ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "   " + _name,
//                 style: const TextStyle(
//                   fontFamily: 'Mitr',
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w300,
//                   fontStyle: FontStyle.normal,
//                   letterSpacing: 0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // String serverGB = '';

// // String serverPHHES = 'http://172.23.10.40:14800/';
// // String serverPALHES = 'http://172.23.10.40:14810/';
// // //
// // String serverPALBP12 = 'http://172.23.10.40:14730/';
// // String serverPVDBP12 = 'http://172.23.10.40:14710/';
// // String serverKNGBP12 = 'http://172.23.10.40:14720/';
// // String serverPHBP12 = 'http://172.23.10.40:14010/';
