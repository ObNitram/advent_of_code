import "package:advent_of_code/get_file.dart";

String data = getFile();

List<String> dataLines = data.split("\n\n");

int result = 0;

void main() {
  print("Hello, day 8 !");

  List<String> directions = dataLines.first.trim().split("");

  Map<String, (String, String)> map = {};

  List<String> a = dataLines.last.trim().split("\n");

  for (String b in a) {
    RegExp exp = RegExp(r"([A-Z]{3}) = \(([A-Z]{3}), ([A-Z]{3}|)");

    exp.allMatches(b).forEach((element) {
      map[element.group(1)!] = (element.group(2)!, element.group(3)!);
    });
  }

  InfinitIterator<String> iterator = InfinitIterator(directions);
  String currentPosition = "AAA";

  do {
    String currentDirection = iterator.current;

    print("$currentPosition $currentDirection");

    if (currentPosition == "ZZZ") {
      print("result : $result");
      return;
    }

    result += 1;

    if (currentDirection == "L") {
      currentPosition = map[currentPosition]!.$1;
      continue;
    }
    if (currentDirection == "R") {
      currentPosition = map[currentPosition]!.$2;
      continue;
    }
  } while (iterator.moveNext());
}

class InfinitIterator<String> implements Iterator<String> {
  final List<String> _list;
  int _index = 0;

  InfinitIterator(this._list);

  @override
  String get current => _list[_index];

  @override
  bool moveNext() {
    _index = (_index + 1) % _list.length;
    return true;
  }
}
