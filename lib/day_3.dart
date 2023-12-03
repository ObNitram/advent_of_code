import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n");

Map<(int, int), List<int>> gearMAp = {};

void main() {
  print("Hello, day 3!");

  int total = 0;

  for (var y = 0; y < dataLines.length; ++y) {
    var dataLine = dataLines[y];
    print(dataLine);

    int i = 0;
    (int, int)? mustBeAdded = null;

    for (var x = 0; x < dataLine.length; ++x) {
      var char = dataLine[x];

      if (char.isInt()) {
        i = i * 10 + char.toInt();

        if (mustBeAdded != null) {
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

        if (mustBeAdded != null) {
          print("add $i");

          if (gearMAp[mustBeAdded] == null) {
            gearMAp[mustBeAdded] = [];
            gearMAp[mustBeAdded]!.add(i);
          } else {
            gearMAp[mustBeAdded]!.add(i);
          }

          total += i;
        }
        mustBeAdded = null;

        i = 0;
      }
    }
    if (mustBeAdded != null) {
      print("add $i");

      if (gearMAp[mustBeAdded] == null) {
        gearMAp[mustBeAdded] = [];
        gearMAp[mustBeAdded]!.add(i);
      } else {
        gearMAp[mustBeAdded]!.add(i);
      }

      total += i;
    }
  }

  total = 0;

  for (var val in gearMAp.values) {
    int m = 1;

    if (val.length == 1) {
      continue;
    }

    for (var v in val) {
      m = m * v;
    }
    print(val);
    total += m;
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

(int, int)? verifyAxe(int x, int y) {
  var a = getChar(x - 1, y);
  if (a != null) {
    if (a.isSymbole()) {
      return (x - 1, y);
    }
  }
  a = getChar(x + 1, y);
  if (a != null) {
    if (a.isSymbole()) {
      return (x + 1, y);
    }
  }
  a = getChar(x, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x, y - 1);
    }
  }
  a = getChar(x, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x, y + 1);
    }
  }

  a = getChar(x - 1, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x - 1, y - 1);
    }
  }
  a = getChar(x - 1, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x - 1, y + 1);
    }
  }
  a = getChar(x + 1, y - 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x + 1, y - 1);
    }
  }
  a = getChar(x + 1, y + 1);
  if (a != null) {
    if (a.isSymbole()) {
      return (x + 1, y + 1);
    }
  }

  return null;
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
    return contains("*");
  }
}

// 529673
// 530495
