///LOGIN STATUS
enum AuthStatus { authenticated, unauthenticated }

enum AllowedImageMimeType {
  jpg('image/jpg'),
  jpeg('image/jpeg'),
  png('image/png');

  final String value;
  const AllowedImageMimeType(this.value);

  static bool isAllowed(String? type) {
    if (type == null) return false;
    return AllowedImageMimeType.values.any((e) => e.value == type);
  }
}

var maxFileSizeInBytes = 15000000;