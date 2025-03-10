abstract interface class CoreUseCasesProtocols<Params, Type> {
  Future<Type> invoke(final Params params);
}
