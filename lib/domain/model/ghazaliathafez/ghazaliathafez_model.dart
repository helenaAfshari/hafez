
class GhazalItemModelEntity {
  int? id;
  String? title;
  String? tafsir;
  String? tafsirAudio;
  String? firstStanza;
  GhazalItemModelEntity({ this.id, this.title, this.tafsir,this.tafsirAudio,this.firstStanza});
  factory GhazalItemModelEntity.fromJson(Map<String,dynamic>json)=>
  GhazalItemModelEntity(id: json['id'], title: json['title'],tafsir: json['tafsir'],tafsirAudio: json['tafsir_audio'],firstStanza: json['first_stanza']);
}