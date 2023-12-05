import "dart:math";

import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();
List<String> dataLines = data.split("\n\n");

int result = 0;

void main() {
  print("Hello, day 5 !");

  List<int> seedString = dataLines.first.split(":").last.toListInt();

  List<(int, int)> listEspaces = [];

  for (var i = 0; i < seedString.length; i += 2) {
    var o = seedString[i];
    var b = seedString[1 + i];

    listEspaces.add((o, o + b));
  }

  Map<String, List<int>> mapList = {};
  for (var lineIndex = 1; lineIndex < dataLines.length; ++lineIndex) {
    var line = dataLines[lineIndex].split(":");
    mapList[line.first] = line.last.replaceAll("\n", " ").toListInt();
  }

  for (String key in mapList.keys.toList()) {
    List<int> currentMapDecalage = mapList[key]!;

    print(listEspaces.fold(
        "",
        (previousValue, element) =>
            "$previousValue $element${element.y - element.x}"));
    print("nombre de graine : ${listEspaces.sum()}");
    print("$key ${currentMapDecalage.display()}\n");

    List<(int, int)> pile = [];

    for (var x = 0; x < listEspaces.length; ++x) {
      for (var i = 0; i < currentMapDecalage.length; i += 3) {
        (int, int) actualEspace = listEspaces[x].sort();
        if ((-1, -1) == actualEspace) {
          continue;
        }

        int dest = currentMapDecalage[i];
        int start = currentMapDecalage[i + 1];
        int range = currentMapDecalage[i + 2];
        //print("$actualEspace $dest $start $range");

        (int, int) mapEspace = (start, start + range);

        var res = process(actualEspace, mapEspace);

        Vec2? toDecale = res.$1;
        List<Vec2> noDecale = res.$2;

        if (noDecale.isNotEmpty) {
          listEspaces[x] = noDecale.first;
          noDecale.removeAt(0);
          listEspaces.addAll(noDecale);
        }

        if (toDecale == null) {
          break;
        }

        if (noDecale.isEmpty) {
          listEspaces[x] == (-1, -1);
        }

        int a = dest - start;
        toDecale = (toDecale.x + a, toDecale.y + a);
        pile.add(toDecale);
      }
    }
    listEspaces = listEspaces + pile;
    listEspaces.removeWhere((element) => element == (-1, -1));
  }

  print("final : $listEspaces");
  result = listEspaces.fold(
      999999999999999,
      (previousValue, element) =>
          min(previousValue, min(element.x, element.y)));

  print("Result $result");
}

bool intercect((int, int) a, (int, int) b) {
  if (a.x < b.x && a.x < b.y && a.y < b.x && a.y < b.y) {
    return false;
  }
  if (a.x > b.x && a.x > b.y && a.y > b.x && a.y > b.y) {
    return false;
  }
  return true;
}

(Vec2?, List<Vec2>) process(Vec2 vec, Vec2 zone) {
  vec = vec.sort();
  zone = zone.sort();

  if (vec.x.isBetween(zone.item1, zone.item2) &&
      vec.y.isBetween(zone.item1, zone.item2)) {
    return (vec, []);
  }

  if (!vec.x.isBetween(zone.item1, zone.item2) &&
      vec.y.isBetween(zone.item1, zone.item2)) {
    Vec2? inTheZone = (zone.x, vec.y);
    var outTheZone = [(vec.x, zone.x - 1)];
    return (inTheZone, outTheZone);
  }

  if (vec.x.isBetween(zone.item1, zone.item2) &&
      !vec.y.isBetween(zone.item1, zone.item2)) {
    Vec2? inTheZone = (vec.x, zone.y);
    var outTheZone = [(zone.y, vec.y)];
    return (inTheZone, outTheZone);
  }

  if (!vec.x.isBetween(zone.item1, zone.item2) &&
      !vec.y.isBetween(zone.item1, zone.item2) &&
      zone.x.isBetween(vec.x, vec.y) &&
      zone.y.isBetween(vec.x, vec.y)) {
    Vec2? inTheZone = zone;
    var outTheZone = [(vec.x, zone.x - 1), (zone.y, vec.y)];
    return (inTheZone, outTheZone);
  }

  return (null, [vec]);
}

extension IntExtension on int {
  bool isBetween(int start, int end) {
    return this >= start && this <= end;
  }
}

extension on Vec2 {
  int get item1 => this.$1;

  int get item2 => this.$2;

  Vec2 sort() {
    if (x > y) {
      return (y, x);
    }
    return this;
  }
}

extension on List<Vec2> {
  int sum() {
    return fold(
        0, (previousValue, element) => previousValue + (element.y - element.x));
  }
}

extension on List<int> {
  String display() {
    String str = "";

    for (var i = 0; i < length; i += 3) {
      int dest = this[i];
      int start = this[i + 1];
      int range = this[i + 2];

      str = "$str ($start,${start + range})=>${dest - start}";
    }

    return str;
  }
}
