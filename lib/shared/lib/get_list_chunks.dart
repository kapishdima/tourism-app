List<List<L>> chunk<L>(List<L> list, int chunkSize) {
  List<List<L>> chunks = [];
  int length = list.length;
  for (var i = 0; i < length; i += chunkSize) {
    int size = i + chunkSize;
    chunks.add(list.sublist(i, size > length ? length : size));
  }
  return chunks;
}
