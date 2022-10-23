class TaskModel {
  final String user;
  final String title;
  final double duration;
  final int cost;
  final String description;
  final bool permanent;

  TaskModel({
    required this.user,
    required this.title,
    required this.duration,
    required this.cost,
    this.description = "",
    required this.permanent,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      user: json['user'],
      title: json['title'],
      duration: json['duration'],
      cost: json['cost'],
      description: json['description'],
      permanent: json['permanent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['title'] = title;
    data['duration'] = duration;
    data['cost'] = cost;
    data['description'] = description;
    data['permanent'] = permanent;
    return data;
  }
}
