abstract class Serializer<F, T> {
  T serialize(F instance);
  F deserialize(T data);

  List<T> serializeMany(List<F> instance) {
    if (instance.isEmpty) return [];
    return (instance.map((e) => serialize(e))).toList();
  }

  List<F> deserializeMany(List<T> data) {
    if (data.isEmpty) return [];
    return (data.map((e) => deserialize(e))).toList();
  }
}
