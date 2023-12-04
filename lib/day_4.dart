import "package:advent_of_code/get_file.dart";

String data = getFile();
List<String> dataLines = data.split("\n");

int result = 0;

void main() {
  print("Hello, day 4 !");

  for (var y = 0; y < dataLines.length; ++y) {
    final dataLine = dataLines[y];
    print(dataLine);
  }

  print("Result $result");
}
