import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiderTile extends StatelessWidget {
  const RiderTile(
      {Key? key,
      required this.name,
      required this.rate,
      this.radius = 0,
      this.eta = 0})
      : super(key: key);
  final String name;
  final num rate;
  final num? radius;
  final num? eta;

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: 150,
        // margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.grey[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: Theme.of(context).textTheme.headline2),
            Text('Rate: ₦${rate}',
                style: Theme.of(context).textTheme.bodyText1),
            Text('Radius: ${radius}km',
                style: Theme.of(context).textTheme.bodyText2),
            Row(
              children: [
                Expanded(child: Text('ETA: ${eta} min.')),
                Container(
                  height: 20,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Go',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}

class RideTile extends StatelessWidget {
  const RideTile({
    Key? key,
    this.image,
    required this.type,
    required this.rate,
    this.eta = 0,
  }) : super(key: key);

  final String? image;
  final String type;
  final num rate;
  final num? eta;

  @override
  Widget build(BuildContext context) => ListTile(
        tileColor: Colors.white,
        selectedTileColor: Colors.blueAccent,
        leading: Image.asset(
          image!,
          height: 30,
        ),
        title: Text('${type}', style: Theme.of(context).textTheme.headline2),
        subtitle: Text('${eta} minutes'),
        trailing: Text('₦${rate}'),
      );
}

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key? key,
    required this.name,
    required this.rate,
    this.eta = 0,
    this.etd = 0,
  }) : super(key: key);

  final String name;
  final num rate;
  final num? eta;
  final num? etd;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(Icons.directions),
        title: Text('${name}', style: Theme.of(context).textTheme.headline2),
        subtitle: Text('Leaves in ${etd} minutes'),
        trailing: Column(
          children: [
            Expanded(
                child: Text('${eta} AM',
                    style: Theme.of(context).textTheme.headline2)),
            Text('₦${rate}'),
          ],
        ),
      );
}
