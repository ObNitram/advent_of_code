import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n");

int result = 0;

Map<int, int> mapi = {};

void main() {
  print("Hello, day 4 !");

  for (var i = 0; i < dataLines.length + 1000; ++i) {
    mapi[i] = 1;
  }

  for (var y = 0; y < dataLines.length; ++y) {
    int point = 0;
    final dataLine = dataLines[y];

    String as = dataLine.split(":").last.split("|").first;
    List<int> ai = [];
    for (var o in as.split(" ")) {
      if (o.isInt()) {
        ai.add(o.toInt());
      }
    }

    String bs = dataLine.split(":").last.split("|").last;
    List<int> bi = [];
    for (var o in bs.split(" ")) {
      if (o.isInt()) {
        bi.add(o.toInt());
      }
    }

    print(ai);
    print(bi);

    for (var o in bi) {
      if (ai.contains(o)) {
        point++;
      }
    }

    print("Number of good value : $point");

    for (var i = y + 1; i < (point + y + 1); ++i) {
      mapi[i] = mapi[i]! + mapi[y]!;
    }

    print(mapi.values);
  }

  for (var i = 0; i < dataLines.length; ++i) {
    var o = mapi[i]!;
    result += o;
  }

  print("Result $result");
}
