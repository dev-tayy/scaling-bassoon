import 'package:defi/cubit/coin_cubit.dart';
import 'package:defi/utils/defi_loader.dart';
import 'package:defi/utils/extensions.dart';
import 'package:defi/widgets/coin_list_tile.dart';
import 'package:defi/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class HistoryScreen extends HookWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    useMemoized(() {
      context.read<CoinCubit>().getCoinData();
    });
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: BlocBuilder<CoinCubit, CoinState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const TopAppBar(),
                  if (state is LoadingState)
                    const Expanded(child: DFISpinner()),
                  if (state is LoadedState) CoinListTile(coin: state.coin),
                  if (state is ErrorState)
                    Center(child: Center(child: Text(state.errorMessage)))
                ],
              ).paddingOnly(r: 18, l: 18, t: 13);
            },
          ),
        ),
      ),
    );
  }
}
