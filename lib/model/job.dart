class Job {
  int? userId;
  int? id;
  String? title;
  String? body;

  Job({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Job.fromMap(Map<String, dynamic> json) => Job(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
