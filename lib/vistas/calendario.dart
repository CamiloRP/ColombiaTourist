import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Lugares Turisticos"),
        leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)
        ),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        dataSource: MeetingDataSource(getApointments())
      ),
    );
  }
}
  List<Appointment> getApointments(){
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours:2));

    meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: "Cita",
      color: Colors.blue
    ));
    return meetings;
  }

  class MeetingDataSource  extends CalendarDataSource {
    MeetingDataSource(List<Appointment>source) {
      appointments = source;
    }
  }

