// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:dash/widgets/tiles.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.blueGrey[100],
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
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 0.8,
                    builder: (context, scrollController) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 16),
                        child: ListView(
                            controller: scrollController,
                            physics: BouncingScrollPhysics(),
                            children: [
                              Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Current dispatch',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                      Text('No info available'),
                                    ],
                                  )),
                              Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Dispatch history',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                      Text('No info available'),
                                    ],
                                  )),
                              TextButton(
                                onPressed: () {},
                                child: Text('Book a ride'),
                                style: TextButton.styleFrom(
                                  side: BorderSide(
                                      width: 3, color: Colors.blue.shade100),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  primary: Colors.white,
                                  backgroundColor: Colors.black,
                                ),
                              )
                            ]),
                      );
                    })
              ],
            ),
          )),
    );
  }
}
