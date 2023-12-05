import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n");

int result = 0;

void main() {
  print("Hello, day 5 !");

  Vec2 vec = (2, 3);

  for (var lineIndex = 0; lineIndex < dataLines.length; ++lineIndex) {
    var line = dataLines[lineIndex];
    print(line);
  }

  print("Result $result");
}
