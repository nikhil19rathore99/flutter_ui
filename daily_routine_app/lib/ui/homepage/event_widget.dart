import 'package:daily_routine_app/styleguide.dart';
import 'package:flutter/material.dart';
import '../../model/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: Image.asset(event.imagePath,
                  height: 150.0, fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(event.title, style: eventTitleTextStyle),
                        SizedBox(
                          height: 10.0,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(event.location,
                                  style: eventLocationTextStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toLowerCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
