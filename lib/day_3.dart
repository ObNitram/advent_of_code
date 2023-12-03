import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n");

void main() {
  print("Hello, day 3!");

  int total = 0;

  for (var y = 0; y < dataLines.length; ++y) {
    var dataLine = dataLines[y];
    print(dataLine);

    int i = 0;
    bool mustBeAdded = false;

    for (var x = 0; x < dataLine.length; ++x) {
      var char = dataLine[x];

      if (char.isInt()) {
        i = i * 10 + char.toInt();

        if (mustBeAdded) {
          continue;
        }

        mustBeAdded = verifyAxe(x, y);
        print("$x : $y = $mustBeAdded");
      } else {
        // Nous avons passé un int, doit on l'ajouté

        if (i == 0) {
          // pas de int
          continue;
        }

        if (mustBeAdded) {
          print("add $i");

          total += i;
        }
        mustBeAdded = false;

        i = 0;
      }
    }
    if (mustBeAdded) {
      print("add $i");

      total += i;
    }
  }

  print("Total $total");
}

String? getChar(int x, int y) {
  if (x < 0 || x >= dataLines[0].length) {
    return null;
  }
  if (y < 0 || y >= dataLines.length) {
    return null;
  }

  return dataLines[y][x];
}

bool verifyAxe(int x, int y) {
  var a = getChar(x - 1, y);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x + 1, y);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }

  a = getChar(x - 1, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x - 1, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x + 1, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }
  a = getChar(x + 1, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return true;
    }
  }

  return false;
}

extension on String {
  List<String> toChar() {
    List<String> str = [];

    for (int i = 0; i < length; ++i) {
      str.add(this[i]);
    }
    return str;
  }

  bool isSymbole() {
    RegExp reg = RegExp(r"[0-9.]");

    return !reg.hasMatch(this);
  }
}

// 529673
// 530495
