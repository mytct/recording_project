abstract interface class CoreData<T, R> {
  T mapper(R response);
}

class WrapperResponse<R, E> {
  final R? response;
  final E? error;
  WrapperResponse({this.response, this.error});
}
