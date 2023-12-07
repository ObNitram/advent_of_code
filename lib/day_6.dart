import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();

List<String> dataLines = data.split("\n");

int result = 1;

void main() {
  print("Hello, day 6 !");

  List<int> timeList =
      dataLines.first.split(":").last.replaceAll(" ", "").toListInt();

  List<int> distanceList =
      dataLines.last.split(":").last.replaceAll(" ", "").toListInt();

  for (int i = 0; i < timeList.length; ++i) {
    int time = timeList[i];
    int distance = distanceList[i];

    int permetDeGagner = 0;

    for (var j = 0; j < time; ++j) {
      int disTest = j * (time - j);

      if (disTest > distance) {
        permetDeGagner++;
      }
    }

    print(permetDeGagner);

    result *= permetDeGagner;
  }

  print("result : $result");
}
