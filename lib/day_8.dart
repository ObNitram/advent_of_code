import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();

List<String> dataLines = data.split("\n\n");

int result = 0;

void main() {
  print("Hello, day 8 !");

  List<String> directions = dataLines.first.trim().split("");

  Map<String, (String, String)> map = {};

  List<String> a = dataLines.last.trim().split("\n");

  for (String b in a) {
    RegExp exp = RegExp(r"([A-Z]{3}) = \(([A-Z]{3}), ([A-Z]{3})");

    exp.allMatches(b).forEach((element) {
      map[element.group(1)!] = (element.group(2)!, element.group(3)!);
    });
  }

  List<String> currentPositions = [];

  for (var key in map.keys) {
    if (key.endsWith("A")) {
      currentPositions.add(key);
    }
  }

  List<int> rotations = [];

  for (var o in currentPositions) {
    InfinitIterator<String> iterator = directions.infinitIterator;

    String currentPosition = o;

    //print("Start: $currentPosition");

    int counter = 0;
    do {
      String currentDirection = iterator.current;

      if (currentPosition.endsWith("Z")) {
        rotations.add(counter);
        break;
      }

      print("$currentPosition $currentDirection");
      counter += 1;

      if (currentDirection == "L") {
        currentPosition = map[currentPosition]!.$1;
        continue;
      }
      if (currentDirection == "R") {
        currentPosition = map[currentPosition]!.$2;
        continue;
      }
    } while (iterator.moveNext());
    print("End: $currentPosition");
  }
  print(rotations.getPPCM());
}

// 7309459565207
