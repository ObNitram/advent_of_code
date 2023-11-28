import "dart:io";

String getFile() {
  File file = File("${Directory.current.path}/data.txt");

  return file.readAsStringSync();
}
