import 'package:equatable/equatable.dart';

import 'volume_info.dart';

class BookModel extends Equatable {
  final VolumeInfo volumeInfo;

  const BookModel({
    required this.volumeInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        volumeInfo:
            VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'volumeInfo': volumeInfo.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      volumeInfo,
    ];
  }
}
