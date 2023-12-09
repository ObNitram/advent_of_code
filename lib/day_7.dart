import "dart:math";

import "package:advent_of_code/get_file.dart";
import "package:obni_utils/obni_utils.dart";

String data = getFile();

List<String> dataLines = data.split("\n");

int result = 0;

void main() {
  print("Hello, day 7 !");

  List<Card> cardList = [];

  for (int i = 0; i < dataLines.length; ++i) {
    String time = dataLines[i];

    String cards = time.split(" ").first;
    int bid = time.split(" ").last.toInt();

    var map = cards.conte();

    cardList.add(Card(bid, map, cards));
  }

  cardList.sort(compare);

  for (var i = 1; i <= cardList.length; ++i) {
    var o = cardList[i - 1];
    result += i * o.bid;
    print("card : ${o.brute} bid : ${o.bid} result : $result");
  }

  print("result : $result");
}

// A, K, Q, J, T, 9, 8, 7, 6, 5, 4, 3, or 2
Map<String, int> equi = {
  "A": 14,
  "K": 13,
  "Q": 12,
  "J": 0,
  "T": 10,
  "9": 9,
  "8": 8,
  "7": 7,
  "6": 6,
  "5": 5,
  "4": 4,
  "3": 3,
  "2": 2,
};

int compare(Card b, Card a) {
  // a < b => 1
  // a > b => -1

  if (a.getPower() < b.getPower()) {
    return 1;
  }
  if (a.getPower() > b.getPower()) {
    return -1;
  }

  for (var i = 0; i < a.brute.length; ++i) {
    var charA = a.brute[i];
    var charB = b.brute[i];

    if (equi[charA]! < equi[charB]!) {
      return 1;
    }
    if (equi[charA]! > equi[charB]!) {
      return -1;
    }
  }

  throw Exception("error");
}

class Card {
  Map<String, int> cards = {};
  String brute = "";
  int bid = 0;

  int getPower() {
    if (cards.values.length == 5) // 1 1 1 1 1
    {
      return 0;
    }
    if (cards.values.length == 4) // 2 1 1 1
    {
      return 1;
    }
    if (cards.values.length == 3) // 2 2 1 | 3 1 1
    {
      if (cards.values.contains(3)) // 3 1 1
      {
        return 3;
      }
      return 2; // 2 2 1
    }
    if (cards.values.length == 2) // 3 2 | 4 1
    {
      if (cards.values.last == 2 || cards.values.first == 2) {
        // 3 2
        return 4;
      }

      return 5; // 4 1
    }
    if (cards.values.length == 1) // 5
    {
      return 6;
    }

    print(brute);
    print(cards);

    throw Exception("error");
  }

  Card(this.bid, this.cards, this.brute);
}

extension on String {
  Map<String, int> conte() {
    Map<String, int> map = {};

    if (this == "JJJJJ") {
      return {"J": 5};
    }

    int nj = 0;

    for (var i = 0; i < length; ++i) {
      var char = this[i];

      if (char == "J") {
        nj++;
        continue;
      }

      map[char] = map[char] == null ? 1 : map[char]! + 1;
    }

    int max = map.values.maxInList();

    for (var o in map.entries) {
      if (o.value == max) {
        map[o.key] = map[o.key]! + nj;
        return map;
      }
    }

    return map;
  }
}

extension iter on Iterable {
  int maxInList() {
    return fold<int>(
        1, (previousValue, element) => max(previousValue, element));
  }
}

// 249894948
// 249893371
// 249878762
// 246364907
// 247900937
// 250098600
// 249878762
// 251121738
