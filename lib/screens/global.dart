import 'package:covid19_app_flutter/Services/covid_service.dart';
import 'package:covid19_app_flutter/models/global_summary.dart';
import 'package:covid19_app_flutter/screens/global_loading.dart';
import 'package:covid19_app_flutter/screens/global_statistics.dart';
// import 'package:covid19_app_flutter/screens/image_rotate.dart';
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ImageRotate(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Global Corona Virus Cases",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      summary = covidService.getGlobalSummary();
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          FutureBuilder(
            future: summary,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text("Error"),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return GlobalLoading();
                default:
                  return !snapshot.hasData
                      ? Center(
                          child: Text("Empty"),
                        )
                      : GlobalStatistics(
                          summary: buildData(snapshot),
                        );
              }
            },
          ),
        ],
      ),
    );
  }

  buildData(AsyncSnapshot<Object?> snapshot) {
    return snapshot.data;
  }
}
