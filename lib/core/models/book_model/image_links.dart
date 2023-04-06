import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String thumbnail;

  const ImageLinks({required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        thumbnail: json['thumbnail'],
      );

  Map<String, dynamic> toJson() => {
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props => [thumbnail];
}
