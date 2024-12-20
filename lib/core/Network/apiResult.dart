class ApiResult<T> {
  T? Data;
  String? Error;

  ApiResult.Success(this.Data) : Error = null;
  ApiResult.Error(this.Error) : Data = null;

  bool get isSuccess => Data != null;
  bool get isError => Error != null;
}
