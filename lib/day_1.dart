import "package:advent_of_code/get_file.dart";
import "package:log_tanker/log_tanker.dart";
import "package:obni_utils/obni_utils.dart";

void main() {
  print("Hello, day 1!");

  String data = getFile();

  List<String> dataLines = data.split("\n");

  int total = 0;

  for (String dataLine in dataLines) {
    List<int> dataIntsLines = dataLine.findInts();

    print("$dataIntsLines + [${dataIntsLines.first}][${dataIntsLines.last}]");

    total += (dataIntsLines.first * 10 + dataIntsLines.last);
  }

  //10130
  //55823
  //55607


  QuickLog.d(total.toString());
}

extension Parsing on String {
  bool isInt() {
    if (length != 1) {
      return false;
    }

    try {
      int.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<int> findInts() {
    RegExp exp = RegExp(r"([0-9]|oneight|twone|threeight|fiveight|sevenine|eightwo|eighthree|nineight|one|two|three|four|five|six|seven|eight|nine)");

    List<int> ints = [];

    Map<String,List<int>> intMap = {
      "one": [1],
      "two": [2],
      "three": [3],
      "four": [4],
      "five": [5],
      "six": [6],
      "seven": [7],
      "eight": [8],
      "nine": [9],

      "oneight": [1,8],

      "twone": [2,1],

      "threeight": [3,8],

      "fiveight": [5,8],

      "sevenine": [7,8],

      "eightwo": [8,2],
      "eighthree": [8,2],

      "nineight": [9,8],
    };

  //55309
  //55242
  //55302

    var matches = exp.allMatches(this).map((e) => e.group(0)!);

    print(this);
    print(matches);

    for (String char in matches) {
      if (char.isInt()) {
        ints.add(char.toInt());
        continue;
      }

      ints.addAll(intMap[char]!);

    }


    return ints;
  }
}
