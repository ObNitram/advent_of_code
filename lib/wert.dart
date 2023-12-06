import "dart:math";

import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n\n");

int result = 99999999999999999;

void main() {
  DateTime start = DateTime.now();
  print("Hello, day 5 !");

  List<int> seedString = dataLines.first.split(":").last.toListInt();
  print(seedString);
  print(seedString.length);

  List<List<int>> mapList = [];

  for (var lineIndex = 1; lineIndex < dataLines.length; ++lineIndex) {
    var line = dataLines[lineIndex].split(":");
    mapList.add(line.last.replaceAll("\n", " ").toListInt());
  }

  for (var j = 0; j < seedString.length; j = j + 2) {
    int a = seedString[j];
    int max = a + seedString[j + 1];

    print("j $j | r $result) $a => $max");

    for (var x = a; x <= max; ++x) {
      if (x % 100000000 == 0) {
        print("$x $result");
      }

      result = min(result, calcul(x, mapList));
    }
  }

  print("Time : ${DateTime.now().difference(start).inMilliseconds} ms");
  print("Second : ${DateTime.now().difference(start).inSeconds} s");

  print("Result $result");
}

int calcul(int seed, List<List<int>> mapList) {
  for (List<int> val in mapList) {
    for (var i = 0; i < val.length; i += 3) {
      int dest = val[i];
      int start = val[i + 1];
      int dist = val[i + 2];
      int end = start + dist;
      // print("$dest $start  $dist");
      if (seed >= start && seed < end) {
        seed = seed + (dest - start);
        // print("move : $start $dest $dist");
        break;
      }
    }
  }
  return seed;
}

//6472061 to high
