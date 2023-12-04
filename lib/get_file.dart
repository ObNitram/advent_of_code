import "dart:io";

String getFile() {
  // print("Current directory: ${Directory.current.path}");
  File file = File("${Directory.current.path}/data.txt");

  return file.readAsStringSync();
}
