import "dart:math";

import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n\n");

int result = 99999999999999999;

void main() async {
  DateTime start = DateTime.now();
  print("Hello, day 5 !");

  List<int> seedList = dataLines.first.split(":").last.toListInt();

  List<List<int>> mapList = [];

  for (var lineIndex = 1; lineIndex < dataLines.length; ++lineIndex) {
    var line = dataLines[lineIndex].split(":");
    mapList.add(line.last.replaceAll("\n", " ").toListInt());
  }

  List<Range> ranges = [];

  for (var j = 0; j < seedList.length; j = j + 2) {
    ranges.addAll(
        Range.fromLength(seedList[j], seedList[j + 1]).splitByLength(1000000));
  }

  result = await computeThreading<int, int>(
      (p0, p1) => min(p0, p1), (p0) => calcul(p0, mapList), ranges);

  print("Time : ${DateTime.now().difference(start).inMilliseconds} ms");
  print("Second : ${DateTime.now().difference(start).inSeconds} s");

  print("Result $result");
}

int calcul(int seed, List<List<int>> mapList) {
  Range range = Range(0, 1000000);

  for (List<int> val in mapList) {
    for (var i = 0; i < val.length; i += 3) {
      int dest = val[i];
      int start = val[i + 1];
      int dist = val[i + 2];
      int end = start + dist;
      // print("$dest $start  $dist");
      // if (seed.isBetween(start, end)) {

      range.start = start;
      range.end = end;

      if (range.containInt(seed)) {
        seed = seed + (dest - start);
        // print("move : $start $dest $dist");
        break;
      }
    }
  }
  return seed;
}

//6472061 to high
// 279 seconds
