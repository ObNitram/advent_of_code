import "dart:math";

import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

void main() {
  print("Hello, day 2!");

  String data = getFile();

  List<String> dataLines = data.split("\n");

  int total = 0;
  for (String dataLine in dataLines) {
    List<String> dataLineSplit = dataLine.split(":");
    int gameID = dataLineSplit.first.trim().split(" ").last.toInt();
    print(gameID);

    List<String> manches = dataLineSplit.last.split(";");

    bool mancheOK = true;

    int red = 0;
    int green = 0;
    int blue = 0;

    for (var manche in manches) {
      List<String> mancheSplit = manche.split(",");

      for (var color in mancheSplit) {
        if (color.contains("red")) {
          red = max(red, color.trim().split(" ").first.toInt());
        } else if (color.contains("green")) {
          green = max(green, color.trim().split(" ").first.toInt());
        } else if (color.contains("blue")) {
          blue = max(blue, color.trim().split(" ").first.toInt());
        }
      }
      print("$red $green $blue");
    }

    total += red * green * blue;
  }

  print("Total $total");
}
