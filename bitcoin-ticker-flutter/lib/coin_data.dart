import 'package:bitcoin_ticker/services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'BCH',
  'ETH',
  'XMR',
  'LTC',
  'XRP',
];

const String APIKEY = 'OTg4MTIxOTk1MmQyNDQxODljNWFjYjBhOGFjYTkzNmI';

const String bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future<String> getCointData(String symbol) async {
    var url = '$bitcoinAverageURL/$symbol';

    NetworkHelper networkHelper = NetworkHelper(url, getHeaders());

    var coinData = await networkHelper.getData();

    String lastPrice;
    if (coinData != null && coinData['last'] != null) {
      lastPrice = coinData['last'].toStringAsFixed(2);
    } else {
      lastPrice = 'error';
    }

    return lastPrice;
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = Map<String, String>();
    headers['x-ba-key'] = APIKEY;
    return headers;
  }
}
