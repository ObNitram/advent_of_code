import "package:advent_of_code/get_file.dart";

String data = getFile();

List<String> dataLines = data.split("\n");

int result = 1;

void main() {
  print("Hello, day 7 !");

  for (int i = 0; i < dataLines.length; ++i) {
    String time = dataLines[i];
  }

  print("result : $result");
}
