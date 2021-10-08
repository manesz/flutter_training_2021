part of 'map_bloc.dart';

class MapState extends Equatable {
  final LatLng currentPosition;

  MapState({required this.currentPosition});

  copyWith({
    LatLng? position,
  }) {
    return MapState(
      currentPosition: position ?? this.currentPosition,
    );
  }

  @override
  String toString() {
    return '''MapState { currentPosition: $currentPosition }''';
  }

  @override
  List<Object> get props => [currentPosition];
}
