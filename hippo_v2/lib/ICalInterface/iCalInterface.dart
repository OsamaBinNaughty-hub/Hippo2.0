class ICalInterface{
  final String name = "Nothing Selected";
  final List<ICalInterface> nextData = const [];

  // Make sure that usage is still abstract
  ICalInterface() {
    throw Exception("Interfaces should not be initialized");
  }

  // workaround for lack of interface instantiation in Dart
  ICalInterface.getDefault();

  @override
  bool operator ==(Object other){
    return other is ICalInterface && other.name == name;
  }

  @override
  // TODO: Implement hashCode
  int get hashCode => super.hashCode;
}