abstract class UseCaseInterface<Data, Type> {
  Future<Data> call(Type params);
}
