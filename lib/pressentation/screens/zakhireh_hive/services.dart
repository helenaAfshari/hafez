
// class BadgeDatabase {
//   final String _boxName = "characters";
//   Future<Box<CharacterComicsModel>> noteBox() async {
//     var box = await Hive.openBox<CharacterComicsModel>(_boxName);
//     return box;
//   }

//   Future<void> addCharacter(CharacterComicsModel character) async {
//     var box = await noteBox();
//     await box.put(character.name, character);
//   }

//   Future<void> updateCharacter(int index, CharacterComicsModel character) async {
//     var box = await noteBox();
//     await box.putAt(index, character);
//   }

//   Future<void> deleteCharacter(int index) async {
//     var box = await noteBox();
//     await box.deleteAt(index);
//   }

//   Future<List<CharacterComicsModel>> getCharacters() async {
//     var box = await noteBox();
//     var data = box.values.toList();
//     if (data.isEmpty) {
//       await addCharacter(CharacterComicsModel(gender: "girl", name: "Batman"));
//       await addCharacter(CharacterComicsModel(gender: "girl", name: "Spiderman"));
//       await addCharacter(CharacterComicsModel(gender: "", name: "Sherlock"));
//       await addCharacter(CharacterComicsModel(gender: "", name: "Joker"));
//       await addCharacter(CharacterComicsModel(gender: "girl", name: " Ironman"));
//     }
//     return box.values.toList();
//   }
// }