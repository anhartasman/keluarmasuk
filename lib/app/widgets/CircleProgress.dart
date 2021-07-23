import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  final double screen_width;
  final int max_progress;
  final int current_progress;

  const CircleProgress(
      {Key? key,
      this.screen_width = 300,
      this.max_progress = 4,
      this.current_progress = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate((max_progress * 2) - 1, (index) {
          return Row(children: <Widget>[
            index.isOdd
                ? Column()
                : Container(
                    height: 20.0,
                    width: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ((index + 1) - (index / 2)).toInt() <=
                              current_progress
                          ? Warna.warnaUtama
                          : Colors.white,
                      border: Border.all(
                          color: ((index + 1) - (index / 2)).toInt() <=
                                  current_progress
                              ? Warna.warnaUtama
                              : Colors.grey),
                      shape: BoxShape.circle,
                    ),
                    child: Text(((index + 1) - (index / 2)).toInt().toString(),
                        style: TextStyle(
                            color: ((index + 1) - (index / 2)).toInt() <=
                                    current_progress
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ),
            index.isOdd
                ? Row(
                    children: <Widget>[
                      Container(
                          height: 1,
                          width: (screen_width * 7) / 100,
                          color: current_progress >= ((index + 0) - (index / 2))
                              ? Warna.warnaUtama
                              : Colors.grey),
                      Container(
                          height: 1,
                          width: (screen_width * 7) / 100,
                          color: current_progress >= ((index + 1) - (index / 2))
                              ? Warna.warnaUtama
                              : Colors.grey),
                    ],
                  )
                : Column(),
          ]);
        }),
      ),
    );
  }
}
