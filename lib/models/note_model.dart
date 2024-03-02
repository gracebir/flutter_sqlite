class Note {
  final int? id;
  final String title;
  final String content;
  const Note({required this.title, required this.content, this.id});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(title: json['title'], content: json['content'], id: json['id']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content};
}
