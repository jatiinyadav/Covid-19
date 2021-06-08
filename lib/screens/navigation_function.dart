import 'package:flutter/material.dart';

class NavigationOption extends StatelessWidget {
  const NavigationOption(
      {Key? key,
      required this.title,
      required this.selected,
      required this.onSelected})
      : super(key: key);

  final String title;
  final bool selected;
  final Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.red.shade400 : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected
              ? Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
