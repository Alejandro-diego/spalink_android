import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/providerrtdb.dart';
import '../../widgets/button.dart';
import '../../widgets/container_background.dart';
import '../../widgets/setpicker.dart';
import '../../widgets/sfcontainer.dart';
import '../../widgets/stauspoll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 56.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AppBar(
              title: Text(
                'SpaController',
                style: GoogleFonts.msMadi(
                  textStyle:
                      const TextStyle(color: Colors.redAccent, fontSize: 40.0),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(.1),
              elevation: 0,
              actions: <Widget>[
                PopupMenuButton<int>(
                  onSelected: (item) => OnSelected(context, item),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: const [Icon(Icons.logout), Text('LogOut')],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/spahome.png'),
          ),
        ),
        child: Consumer<ProviderRTDB>(
          builder: (context, data, child) {
            return data.datosProvider != null
                ? Center(
                    child: Stack(
                      children: [
                        Positioned(
                          left: size.width * 0.021,
                          top: size.height * 0.018,
                          child: const ContainerBackgraund(),
                        ),
                        Positioned(
                          left: size.width * 0.05,
                          top: size.height * 0.04,
                          child: NeuButton(
                            cupertinoIcon: const IconData(0xf6cb,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                            title: 'Pump',
                            onTap: () {
                              setState(
                                () {
                                  _database.child('data').update(
                                      {"pump": !data.datosProvider!.pump});
                                },
                              );
                            },
                            isButtonPressed: data.datosProvider!.pump,
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.05,
                          top: size.height * 0.13,
                          child: NeuButton(
                            cupertinoIcon: const IconData(0xf869,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                            title: 'Buble',
                            onTap: () {
                              setState(
                                () {
                                  _database.child('data').update(
                                      {"buble": !data.datosProvider!.buble});
                                },
                              );
                            },
                            isButtonPressed: data.datosProvider!.buble,
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.05,
                          top: size.height * 0.23,
                          child: NeuButton(
                            cupertinoIcon: const IconData(0xf864,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                            title: 'Warm',
                            onTap: () {
                              setState(
                                () {
                                  _database.child('data').update(
                                      {"warm": !data.datosProvider!.warm});
                                },
                              );
                            },
                            isButtonPressed: data.datosProvider!.warm,
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.05,
                          top: size.height * 0.33,
                          child: NeuButton(
                            cupertinoIcon: const IconData(0xf4B6,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                            title: 'Light',
                            onTap: () {
                              setState(
                                () {
                                  _database.child('data').update(
                                      {"leds": !data.datosProvider!.leds});
                                },
                              );
                            },
                            isButtonPressed: data.datosProvider!.leds,
                          ),
                        ),
                        Positioned(
                            right: size.width * 0.05,
                            top: size.height * 0.04,
                            child: const SetPicker()),
                        Positioned(
                          left: size.width * 0.35,
                          top: size.height * 0.04,
                          child: const SfContainer(
                            title: 'Temperatura',
                          ),
                        ),

                               Positioned(
                          left: size.width * 0.38,
                          top: size.height * 0.09,
                          child:Text('${data.datosProvider!.temp/100}°',style:GoogleFonts.orbitron(
                            textStyle:const  TextStyle(



                              fontSize: 55.0,
                              
                              
                              
                              
                              color: Colors.green)




                          ) ,)
                        ),



                            Positioned(
                          left: size.width * 0.35,
                          top: size.height * 0.23,
                          child: const SfContainer(
                            title: 'Control Panel',
                          ),
                        ),




                            Positioned(
                          left: size.width * 0.35,
                          top: size.height * 0.26,
                          child: const StautusPoll(
                           
                          ),
                        ),




                      ],
                    ),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  );
          },
        ),
      ),
    );
  }

  void OnSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        FirebaseAuth.instance.signOut();
    }
  }
}
