import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'AUD';
  List<String> lastPrices = List<String>();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updateCoinPrice();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        updateCoinPrice();
      },
      children: pickerItems,
    );
  }

  void updateCoinPrice() async {
    setState(() {
      setLastPriceToDefault();
    });
    for (String crypto in cryptoList) {
      getLastPrice(crypto, selectedCurrency);
    }
  }

  void getLastPrice(String coin, String currency) async {
    var coinBTC = await coinData.getCointData('$coin$currency');
    String lastPrice;
    if (coinBTC != null && coinBTC['last'] != null) {
      lastPrice = coinBTC['last'].toStringAsFixed(2);
    } else {
      lastPrice = 'error';
    }
    if (currency != selectedCurrency) {
      return;
    }
    setState(() {
      for (int i = 0; i < cryptoList.length; i++) {
        if (cryptoList[i] == coin) {
          lastPrices[i] = lastPrice;
        }
      }
    });
  }

  List<Widget> getPriceConverterCards() {
    List<PriceConverterCard> cards = [];
    for (int i = 0; i < cryptoList.length; i++) {
      cards.add(PriceConverterCard(
          priceConverter:
              '1 ${cryptoList[i]} = ${lastPrices[i]} $selectedCurrency'));
    }
    return cards;
  }

  void setLastPriceToDefault() {
    for (int i = 0; i < cryptoList.length; i++) {
      lastPrices[i] = '?';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < cryptoList.length; i++) {
      lastPrices.add('?');
    }
    updateCoinPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getPriceConverterCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class PriceConverterCard extends StatelessWidget {
  const PriceConverterCard({
    Key key,
    @required this.priceConverter,
  }) : super(key: key);

  final String priceConverter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            priceConverter,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
