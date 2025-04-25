import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/providers/providers.dart';
import '../../data/models/species_summary.dart';
import '../../data/services/plant_service.dart';

class PlantListState {
  final List<SpeciesSummary> plants;
  final bool isLoading;
  final int page;
  final int lastPage;

  PlantListState({
    this.plants = const [],
    this.isLoading = false,
    this.page = 0,
    this.lastPage = 1,
  });

  bool get hasNext => page < lastPage;

  PlantListState copyWith({
    List<SpeciesSummary>? plants,
    bool? isLoading,
    int? page,
    int? lastPage,
  }) => PlantListState(
    plants: plants ?? this.plants,
    isLoading: isLoading ?? this.isLoading,
    page: page ?? this.page,
    lastPage: lastPage ?? this.lastPage,
  );
}

class PlantListNotifier extends StateNotifier<PlantListState> {
  PlantListNotifier(this._service) : super(PlantListState()) {
    fetchInitial();
  }

  final PlantService _service;

  Future<void> fetchInitial() async {
    state = state.copyWith(isLoading: true);
    final resp = await _service.fetchSpeciesList(page: 1);
    state = PlantListState(
      plants: resp.data,
      isLoading: false,
      page: resp.currentPage,
      lastPage: resp.lastPage,
    );
  }

  Future<void> fetchNext() async {
    if (state.isLoading || !state.hasNext) return;
    state = state.copyWith(isLoading: true);
    final resp = await _service.fetchSpeciesList(page: state.page + 1);
    state = PlantListState(
      plants: [...state.plants, ...resp.data],
      isLoading: false,
      page: resp.currentPage,
      lastPage: resp.lastPage,
    );
  }
}

final plantListProvider =
    StateNotifierProvider<PlantListNotifier, PlantListState>((ref) {
      final svc = ref.watch(plantServiceProvider);
      return PlantListNotifier(svc);
    });
