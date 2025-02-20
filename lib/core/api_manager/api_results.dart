sealed class ApiResult<T> {}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;
  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  Exception exception;
  ErrorApiResult(this.exception);
}
