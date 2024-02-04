import 'package:intl/intl.dart';
import 'package:supermarket/features/auth/data/models/userreviewmodel.dart';

class ReviewData {
  final List<Review> data;
  Review? myReview;
  final int status;

  ReviewData({
    required this.data,
    this.myReview,
    required this.status,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    List<Review> reviews = (json['data'] as List<dynamic>)
        .map((item) => Review.fromJson(item))
        .toList();

    return ReviewData(
      data: reviews,
      myReview: Review.fromJson(json['myreview']),
      status: json['status'],
    );
  }
}

class Review {
  int id;
  int userId;
  int productId;
  String? comment;
  int rating;
  DateTime? createdAt;
  UserModel? user;

  Review({
    required this.id,
    required this.userId,
    required this.productId,
    this.comment,
    required this.rating,
    this.createdAt,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      comment: json['comment'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['created_at']),
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'comment': comment,
      'rating': rating,
      'created_at': createdAt!.toIso8601String(),
    };
  }

  String revieWritedate() {
    return DateFormat('MMMM dd, yyyy').format(createdAt!);
  }
}
