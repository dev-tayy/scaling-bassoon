import 'package:defi/core/models/crypto.dart';
import 'package:defi/repository/coin_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "coin_state.dart";

class CoinCubit extends Cubit<CoinState> {
  CoinCubit(this._coinRepository) : super(InitialState());

  final CoinRepository _coinRepository;

  Future getCoinData() async {
    emit(LoadingState());
    final coin = await _coinRepository.getCoindata();
    coin.when(
      success: (data) => emit(LoadedState(data)),
      failure: (error) => emit(ErrorState(error)),
    );
  }
}
