// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:dash/widgets/tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/drawer.dart';
import '../widgets/input_field.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            // color: Colors.blueGrey[100],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/map.jpg'), fit: BoxFit.cover)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  child: ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[200],
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back, size: 16)),
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    minChildSize: 0.2,
                    maxChildSize: 0.7,
                    builder: (context, scrollController) {
                      return ListView(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              height: 60,
                              color: Colors.grey[100],
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text('Choose a route'),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                width: double.infinity,
                                color: Colors.grey[100],
                                child: buildRoutes(context)),
                          ]);
                    })
              ],
            ),
          )),
    );
  }

  Widget buildRoutes(context) => FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/data/routes.json'),
      builder: (context, snapshot) {
        final rides = json.decode(snapshot.data.toString());
        return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: rides.length,
            itemBuilder: (context, index) {
              return RouteTile(
                name: rides[index]['name'],
                rate: rides[index]['rate'],
                eta: rides[index]['eta'],
                etd: rides[index]['etd'],
              );
            });
      });
}
