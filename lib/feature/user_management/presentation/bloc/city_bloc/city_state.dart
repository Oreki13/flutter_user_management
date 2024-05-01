part of 'city_bloc.dart';

@immutable
sealed class CityState {
  const CityState();
}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class CitySuccess extends CityState {
  final List<String> data;

  const CitySuccess(this.data);
}

final class CityFailed extends CityState {
  final String message;

  const CityFailed(this.message);
}
