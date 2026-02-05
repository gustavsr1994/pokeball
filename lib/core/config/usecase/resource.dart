class Resource<T> {
  T? data;
  String? message;
  String? networkError;

  Resource([this.data, this.message, this.networkError]);

  factory Resource.success([T? data]) => Resource(data);
  factory Resource.error([String? message, T? data]) => Resource(data, message);
  factory Resource.networkError([String? message]) => Resource(null, null, message);
}