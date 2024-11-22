void main()
{
  // Toan tu dieu kien (?:)
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';

  // Toan tu null (??)
  String? name;
  var displayName = name ?? 'Khach';
}