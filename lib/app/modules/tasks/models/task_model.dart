class TaskModel {
  final String user;
  final String title;
  final double? duration;
  final int reward;
  final String? description;
  final bool permanent;

  TaskModel({
    required this.user,
    required this.title,
    this.duration,
    required this.reward,
    this.description,
    required this.permanent,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      user: json['user'],
      title: json['title'],
      duration: json['duration'] + .0,
      reward: json['reward'],
      description: json['description'],
      permanent: json['permanent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['title'] = title;
    data['duration'] = duration;
    data['reward'] = reward;
    data['description'] = description;
    data['permanent'] = permanent;
    return data;
  }
}
