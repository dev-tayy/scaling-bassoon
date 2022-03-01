import 'package:defi/core/models/crypto.dart';
import 'package:defi/utils/colors.dart';
import 'package:defi/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({Key? key, required this.coin}) : super(key: key);
  final List<CoinData> coin;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: coin.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.28,
                            maxHeight: MediaQuery.of(context).size.width * 0.28,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(coin[index].imageUrl,
                                    fit: BoxFit.fill, height: 20, width: 20),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Received',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyShade1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              coin[index].name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '${DateFormat('Hm').format(coin[index].lastUpdated)}, ${DateFormat('MMMd').format(coin[index].lastUpdated).toUpperCase()}, ${DateFormat('y').format(coin[index].lastUpdated).toUpperCase()}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyShade1,
                              ),
                            ),
                          ],
                        ).paddingOnly(t: 5),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$${coin[index].allTimeHigh.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ).paddingOnly(t: 50),
                  ],
                ),
              ),
            ),
          ],
        ).paddingOnly(t: 10);
      },
    ));
  }
}