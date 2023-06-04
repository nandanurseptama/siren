import 'package:equatable/equatable.dart';

class PaginateData<T> extends Equatable {
  final int total;
  final int page;
  final int limit;
  final List<T> data;

  const PaginateData(
      {this.total = 0, this.page = 0, this.limit = 20, required this.data});

  int? get nextPage {
    if (total == 0) {
      return null;
    }
    var count = ((page + 1) * limit);
    if (count >= total) {
      return null;
    }
    return page + 1;
  }

  factory PaginateData.fromJson({
    required Map<String, dynamic> json,
    required T Function(Map<String, dynamic>) builder,
  }) {
    assert(json['data'] is List || json['data'] == null);
    var data = json['data'] == null ? [] : json['data'] as List;
    return PaginateData(
      total: json['total'],
      limit: json['limit'],
      page: json['page'] ?? 0,
      data: data.map((e) => builder(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        total,
        page,
        limit,
        data,
      ];
}
