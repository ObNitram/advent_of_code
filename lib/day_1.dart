import "package:advent_of_code/get_file.dart";
import "package:log_tanker/log_tanker.dart";
import "package:obni_utils/obni_utils.dart";

void main() {
  print("Hello, day 1!");

  String data = getFile();

  List<String> dataLines = data.split("\n");

  for (String dataLine in dataLines) {
    QuickLog.d(dataLine);
    int a = dataLine.toInt();
  }





  QuickLog.d("Exit");
}

