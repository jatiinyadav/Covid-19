import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryLoading extends StatelessWidget {
  final bool inputTextLoading;

  const CountryLoading({Key? key, required this.inputTextLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inputTextLoading ? loadingInputCard() : Container(),
        loadingCard(),
        loadingCard(),
      ],
    );
  }

  Widget loadingInputCard() {
    return Card(
      margin: const EdgeInsets.only(
        top: 60.0,
        bottom: 10.0,
      ),
      elevation: 1,
      child: Container(
        height: 70,
        padding: EdgeInsets.all(24),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 57,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget loadingCard() {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                height: 15,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
