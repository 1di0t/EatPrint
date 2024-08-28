class Post {
  final int postId;
  final int userNum;
  final String content;
  final Map<String, double>? location; // 위치 정보를 위도, 경도로 저장
  final List<String> imageUrls; // 이미지 URL 리스트
  final List<String> hashtags; // 해시태그 리스트

  Post({
    required this.postId,
    required this.userNum,
    required this.content,
    this.location,
    required this.imageUrls,
    required this.hashtags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['post_id'],
      userNum: json['user_num'],
      content: json['content'] ?? '',
      location: json['location'] != null
          ? {
              'latitude': json['location']['latitude'] ?? 0.0,
              'longitude': json['location']['longitude'] ?? 0.0,
            }
          : null,
      imageUrls: json['imageUrls'] != null
          ? List<String>.from(json['imageUrls'].map((url) => url ?? ''))
          : [],
      hashtags: json['hashtags'] != null
          ? List<String>.from(json['hashtags'].map((tag) => tag ?? ''))
          : [],
    );
  }
}
