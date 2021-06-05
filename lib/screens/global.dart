import 'package:covid19_app_flutter/Services/covid_service.dart';
import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:covid19_app_flutter/screens/global_statistics.dart';
import 'package:flutter/material.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalSummaryModel>? summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Global Corona Virus Cases",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading"),
                );
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text("Empty"),
                      )
                    : GlobalStatistics(
                        summary: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
