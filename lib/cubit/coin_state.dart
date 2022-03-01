part of 'coin_cubit.dart';

abstract class CoinState extends Equatable {}

class InitialState extends CoinState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CoinState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CoinState {
  LoadedState(this.coin);
  final List<CoinData> coin;
  @override
  List<Object> get props => [];
}

class ErrorState extends CoinState {
  ErrorState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object> get props => [];
}
