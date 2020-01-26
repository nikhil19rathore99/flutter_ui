import 'package:daily_routine_app/model/event.dart';
import 'package:daily_routine_app/ui/details_events/event_details_bg.dart';
import 'package:daily_routine_app/ui/details_events/event_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: <Widget>[
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
