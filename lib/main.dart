import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/ThemeController.dart';
import 'models/Prouct.dart';
import 'services/ProductService.dart';
import 'widgets/CreateProductCartd.dart';

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => ProductService().init());
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NeumorphicApp(
          debugShowCheckedModeBanner: false,
          title: 'Neumorphic App',
          themeMode: ThemeMode.light,
          theme: ThemeController().lightTheme,
          darkTheme: ThemeController().darkTheme,
          home: const MyHomePage(title: 'JaenGo'),
        ));
  }
}

/*
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    Get.put(MyCardController());
    return Sizer(builder: (context, orientation, deviceType) {
      // Actualiza el tamaño de la tarjeta cuando cambia el tamaño de la ventana web
      Get.find<MyCardController>().updateCardSize(
        SizerUtil.width,
        SizerUtil.height,
      );
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX Store',
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: themeController.theme,
        initialRoute: '/',
        home: const MyHomePage(title: 'JaenGo'),
      );
    });
  }
}
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tema = NeumorphicTheme.currentTheme(context);
    List<Product> productos = [
      Product(
          nombre: "Manzana",
          image: "https://cataas.com/cat",
          precio: 0.5,
          minGrams: 200),
      Product(
          nombre: "Pera",
          image: "https://cataas.com/cat",
          precio: 1.6,
          minGrams: 200),
      Product(
          nombre: "Mango",
          image: "https://cataas.com/cat",
          precio: 1.6,
          minGrams: 200),
      Product(
          nombre: "Melocoton",
          image: "https://cataas.com/cat",
          precio: 1.6,
          minGrams: 200),
      Product(
          nombre: "Naranja",
          image: "https://cataas.com/cat",
          precio: 1.6,
          minGrams: 200),
    ];
    if (GetPlatform.isWeb) {
      print("web");
    }
    if (GetPlatform.isDesktop) {
      print("Desk");
    }
    if (GetPlatform.isWindows) {
      print("win");
    }
    if (GetPlatform.isMobile) {
      print("mob");
    }

    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: NeumorphicText(
          textAlign: TextAlign.center,
          "I love flutter",
          style: const NeumorphicStyle(
            depth: 10, //customize depth here
            //customize color here
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 18, //customize size here
            // AND others usual text style properties (fontFamily, fontWeight, ...)
          ),
        ),
        actions: <Widget>[
          NeumorphicButton(
            provideHapticFeedback: true,
            style: NeumorphicStyle(
              depth: 6,
              color: NeumorphicTheme.currentTheme(context).accentColor,
            ),
            curve: Neumorphic.DEFAULT_CURVE,
            drawSurfaceAboveChild: false,
            child: Center(
              child: NeumorphicIcon(
                FontAwesomeIcons.user,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: MainPage(sideMenu: sideMenu, pageController: pageController),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.sideMenu,
    required this.pageController,
  });

  final SideMenuController sideMenu;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Neumorphic(
            style: const NeumorphicStyle(
              depth: 11,
              intensity: 1.0,
            ),
            child: SideMenu(
              controller: sideMenu,
              style: SideMenuStyle(
                // showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Theme.of(context).hoverColor,
                selectedHoverColor: Colors.blue[100],
                selectedColor: Colors.blue[300],
                selectedTitleTextStyle: GoogleFonts.bitter(fontSize: 20),
                selectedIconColor: Colors.white,
              ),
              title: const Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'JaenGo.png',
                    ),
                  ),
                  Divider(
                    indent: 8.0,
                    endIndent: 8.0,
                  ),
                ],
              ),
              footer: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Contactanos en',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[800]),
                        ),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.facebook)),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.instagram)),
                        IconButton.outlined(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.twitter))
                      ],
                    ),
                  ),
                ),
              ),
              items: [
                SideMenuItem(
                  title: 'Novedades',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.new_releases),
                  //       badgeContent: const Text(
                  //        '3',
                  //        style: TextStyle(color: Colors.white),
                  //      ),
                ),
                SideMenuItem(
                  title: 'Legumbres',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.carrot),
                ),
                SideMenuItem(
                  title: 'Frutas',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.apple),
                  trailing: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 3),
                        child: Text(
                          'New',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[800]),
                        ),
                      )),
                ),
                SideMenuItem(
                  title: 'Limpieza',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.bottleWater),
                  trailing: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 3),
                        child: Text(
                          'New',
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[800]),
                        ),
                      )),
                ),
                SideMenuItem(
                  title: 'Enlatados',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(FontAwesomeIcons.drumSteelpan),
                ),
                SideMenuItem(
                  builder: (context, displayMode) {
                    return const Divider(
                      endIndent: 8,
                      indent: 8,
                    );
                  },
                ),
                SideMenuItem(
                  title: 'Admin',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.admin_panel_settings),
                ),
                SideMenuItem(
                  title: 'Admin',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.admin_panel_settings),
                ),
                // SideMenuItem(
                //   onTap:(index, _){
                //     sideMenu.changePage(index);
                //   },
                //   icon: const Icon(Icons.image_rounded),
                // ),
                // SideMenuItem(
                //   title: 'Only Title',
                //   onTap:(index, _){
                //     sideMenu.changePage(index);
                //   },
                // ),
                const SideMenuItem(
                  title: 'Exit',
                  icon: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              padEnds: true,
              controller: pageController,
              allowImplicitScrolling: true,
              children: [
                SizedBox(
                  width: Get.width, //child: FrutasView(productos: productos)),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: CreateProductCartd(),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: CreateProductCartd(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
