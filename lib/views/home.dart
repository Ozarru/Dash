// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:dash/widgets/tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/drawer.dart';
import '../widgets/input_field.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  right: 16,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.grey[100]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () => Get.to(() => MyDrawer()),
                            icon: Icon(Icons.menu)),
                        Expanded(child: SearchField(hint: 'Find a dispatcher')),
                      ],
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    minChildSize: 0.15,
                    maxChildSize: 0.85,
                    builder: (context, scrollController) {
                      return ListView(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                                height: 150,
                                width: double.infinity,
                                child: buildRiders(context)),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              height: 60,
                              color: Colors.grey[100],
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          'Pick a type of ride, or swipe up for more'),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                width: double.infinity,
                                color: Colors.grey[100],
                                child: buildRides(context)),
                            TextButton(
                              onPressed: () => Get.toNamed('/routes'),
                              child: Text('See available routes'),
                              style: TextButton.styleFrom(
                                side: BorderSide(
                                    width: 3, color: Colors.blue.shade100),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                primary: Colors.white,
                                backgroundColor: Colors.black,
                              ),
                            )
                          ]);
                    })
              ],
            ),
          )),
    );
  }

  Widget buildRiders(context) => FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/data/riders.json'),
      builder: (context, snapshot) {
        final riders = json.decode(snapshot.data.toString());
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: riders.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(width: 16),
                  RiderTile(
                    name: riders[index]['name'],
                    rate: riders[index]['rate'],
                    radius: riders[index]['radius'],
                    eta: riders[index]['eta'],
                  ),
                ],
              );
            });
      });

  Widget buildRides(context) => FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString('assets/data/rides.json'),
      builder: (context, snapshot) {
        final rides = json.decode(snapshot.data.toString());
        return ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: rides.length,
            itemBuilder: (context, index) {
              return RideTile(
                image: rides[index]['image'],
                type: rides[index]['type'],
                rate: rides[index]['rate'],
                eta: rides[index]['eta'],
              );
            });
      });
}
