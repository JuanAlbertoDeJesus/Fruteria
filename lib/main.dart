import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'components/CreateProductCartd.dart';
import 'product.dart';
import 'product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        secondaryHeaderColor: Colors.greenAccent,
      ),
      home: const MyHomePage(title: 'JaenGo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
    List<Product> productos = [
      Product(name: "Manzana", image: "apple.png", price: 0.5, minGrams: 200),
      Product(name: "Pera", image: "apple.png", price: 1.6, minGrams: 200),
      Product(name: "Mango", image: "apple.png", price: 1.6, minGrams: 200),
      Product(name: "Melocoton", image: "apple.png", price: 1.6, minGrams: 200),
      Product(name: "Naranja", image: "apple.png", price: 1.6, minGrams: 200),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text("Cliente"),
              ],
            ),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'JaenGo.png',
                    ),
                  ),
                ),
                const Divider(
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
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
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
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
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
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
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
          Expanded(
            child: PageView(
              clipBehavior: Clip.hardEdge,
              padEnds: true,
              controller: pageController,
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                      child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    children: [
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[0],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[1],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[2],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[3],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[4],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[0],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[1],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[2],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[3],
                      )),
                      ElasticInRight(
                          child: ProductCard(
                        product: productos[4],
                      )),
                    ],
                  )),
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
          ),
        ],
      ),
    );
  }
}
