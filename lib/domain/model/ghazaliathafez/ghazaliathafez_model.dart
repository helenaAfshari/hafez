// class GhazalItemModelEntity {
//   int? id;
//   String? title;
//   String? tafsir;
//   String? tafsirAudio;
//   String? firstStanza;
//   GhazalItemModelEntity({ this.id, this.title, this.tafsir,this.tafsirAudio,this.firstStanza});
//   factory GhazalItemModelEntity.fromJson(Map<String,dynamic>json)=>
//   GhazalItemModelEntity(id: json['id'], title: json['title'],tafsir: json['tafsir'],tafsirAudio: json['tafsir_audio'],firstStanza: json['first_stanza']);
// }

class GhazalItemModelEntity {
  final int? id;
  final String? title;
  final String? tafsir;
  final String? tafsirAudio;
   String? firstStanza;
  final bool? isLiked;
  GhazalItemModelEntity(
      {this.id,
      this.title,
      this.tafsir,
      this.tafsirAudio,
      this.firstStanza,
      this.isLiked});
  factory GhazalItemModelEntity.fromJson(Map<String, dynamic> json) =>
      GhazalItemModelEntity(
        isLiked: false,
        id: json['id'],
        title: json['title'],
        tafsir: json['tafsir'],
        tafsirAudio: json['tafsir_audio'],
        firstStanza: json['first_stanza'],
      );

  GhazalItemModelEntity copyWith({
    int? id,
    String? title,
    String? tafsir,
    String? tafsirAudio,
    String? firstStanza,
    bool? isLiked,
  }) {
    return GhazalItemModelEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      tafsir: tafsir ?? this.tafsir,
      tafsirAudio: tafsirAudio ?? this.tafsirAudio,
      firstStanza: firstStanza ?? this.firstStanza,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map toJson() => {
        'id': id,
        'title': title,
        'tafsir': tafsir,
        'tafsirAudio': tafsirAudio,
        'firstStanza': firstStanza,
      };

      @override
  String toString() {
    return 'GhazalItemModelEntity(id=$id, title=$title, tafsir=$tafsir, tafsirAudio=$tafsirAudio, firstStanza=$firstStanza, isLiked=$isLiked)';
  }
}
// immutability