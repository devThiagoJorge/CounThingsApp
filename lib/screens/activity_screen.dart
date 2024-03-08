import 'package:counthings_app/components/modal_activity_details.dart';
import 'package:counthings_app/utils/api/services/ActivityService.dart';
import 'package:counthings_app/utils/models/Activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  late Future<List<Activity>> futureActivity = fetchActivity();
  final double iconSize = 27;
  final MaterialColor colorIcon = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounThings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CounThings'),
          backgroundColor: Color.fromRGBO(160, 92, 167, 0.4),
        ),
        body: Center(
          child: FutureBuilder<List<Activity>>(
            future: futureActivity,
            builder: (context, snapshot) {
              List<Activity> activities = snapshot.data!;
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          iconSize: iconSize,
                          color: colorIcon,
                          icon: const Icon(Icons.add_circle_outline_sharp),
                          onPressed: () {
                            // ...
                          },
                        ),
                        title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  activities[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ]),
                        subtitle: Center(
                          child: Text(
                            '${activities[index].quantity} vezes',
                            style: TextStyle(
                              color: colorIcon,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          iconSize: iconSize,
                          color: colorIcon,
                          icon: const Icon(Icons.info_outline_rounded),
                          onPressed: () {
                            // ...
                          },
                        ),
                      );
                    });
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (_) {
                  return const ModalActivityDetailsWidget();
                });
          },
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
