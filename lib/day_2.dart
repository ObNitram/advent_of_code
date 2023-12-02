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

    for (var manche in manches) {
      List<String> mancheSplit = manche.split(",");

      int red = 0;
      int green = 0;
      int blue = 0;

      for (var color in mancheSplit) {
        if (color.contains("red")) {
          red += color.trim().split(" ").first.toInt();
        } else if (color.contains("green")) {
          green += color.trim().split(" ").first.toInt();
        } else if (color.contains("blue")) {
          blue += color.trim().split(" ").first.toInt();
        }
      }
      print("$red $green $blue");

      if (red > 12 || green > 13 || blue > 14) {
        mancheOK = false;
      }
    }

    if (mancheOK) {
      print("manche $gameID OK");
      total += gameID;
    }
  }

  print("Total $total");
}
