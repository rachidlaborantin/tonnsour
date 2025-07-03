import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:tonnsour/models/day.dart';
import 'package:tonnsour/models/start_isar.dart';
import 'package:tonnsour/utils/constants.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Day> _days = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDays();
  }

  Future<void> _loadDays() async {
    final days = await isar.days.where().sortByDateDesc().findAll();
    setState(() {
      _days = days;
      _loading = false;
    });
  }

  /*void _openDayDetail(Day day) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DayDetailPage(dayDate: day.date),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        title: const Text('Days History'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _days.isEmpty
              ? const Center(child: Text('Aucun jour enregistré.'))
              : ListView.builder(
                  itemCount: _days.length,
                  itemBuilder: (context, index) {
                    final day = _days[index];
                    final formattedDate =
                        DateFormat('EEEE, d MMMM yyyy', 'en_US')
                            .format(day.date);
                    return ListTile(
                      title: Text(formattedDate),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      //onTap: //() => _openDayDetail(day),
                    );
                  },
                ),
    );
  }
}
