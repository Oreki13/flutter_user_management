import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_management/core/usecase/use_case.dart';

import '../../../domain/usecase/city_list.dart';

part 'city_event.dart';

part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityList _cityList;

  CityBloc({required CityList cityList})
      : _cityList = cityList,
        super(CityInitial()) {
    on<CityEvent>((event, emit) => emit(CityLoading()));
    on<GetCityList>(_onGetCityList);
  }

  void _onGetCityList(
    GetCityList event,
    Emitter<CityState> emit,
  ) async {
    final res = await _cityList.call(NoParams());
    res.fold(
      (l) => emit(CityFailed(l.message)),
      (r) {
        List<String> dataCity = r.map((e) => e.name).toList();
        HashSet<String> removeDuplicate = HashSet.from(dataCity);
        List<String> data = removeDuplicate.toList();
        data.sort();
        return emit(CitySuccess(data));
      },
    );
  }
}
