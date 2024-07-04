import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'components/button_custom.dart';
import 'provider/change_language_provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

enum SingingCharacter { Credit, Paypal, Bitcoin }

class _ChangeLanguageState extends State<ChangeLanguage> {
  SingingCharacter? _character = SingingCharacter.Credit;
  

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 253, 173, 162),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.checkout,
          style: const TextStyle(
              color: Color.fromARGB(255, 253, 173, 162),
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
        actions: [
           DropdownButton<Locale>(
              value: localeProvider.locale,
              items: AppLocalizations.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(
                    locale.languageCode == 'en' ? 'English' :
                    locale.languageCode == 'es' ? 'Español' :
                    'Khmer',
                  ),
                );
              }).toList(),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  localeProvider.setLocale(newLocale);
                }
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 80),
            child: Column(
              children: [
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(AppLocalizations.of(context)!.shipping_info ,style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username    +885 78482207"),
                          Text("Trail, Sangkat Krang Thnong, Khan Saensok"),
                          Text("Phnom Penh, Cambodia, 120804"),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(AppLocalizations.of(context)!.payment, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset("assets/png/masterCard.png"),
                      const SizedBox(width: 10),
                       Text(AppLocalizations.of(context)!.masterCard),
                    ],
                  ),
                  trailing: Radio<SingingCharacter>(
                    activeColor: Colors.black,
                    value: SingingCharacter.Credit,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset("assets/png/paypal.png"),
                      const SizedBox(width: 10),
                       Text(AppLocalizations.of(context)!.payPal),
                    ],
                  ),
                  trailing: Radio<SingingCharacter>(
                    activeColor: Colors.black,
                    value: SingingCharacter.Paypal,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset("assets/png/bitcoin.png"),
                      const SizedBox(width: 10),
                       Text(AppLocalizations.of(context)!.bitCoin),
                    ],
                  ),
                  trailing: Radio<SingingCharacter>(
                    activeColor: Colors.black,
                    value: SingingCharacter.Bitcoin,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 14, right: 36, top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.more_horiz),
                          const SizedBox(width: 10),
                          Text(AppLocalizations.of(context)!.moreMethods),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.total, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Text("\$35.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CustomButton(text: AppLocalizations.of(context)!.pay, onPressed: () {
                    _dialogBuilder(context);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: const EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Payment Success!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IDR 1,000,000',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12-12-2024',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              CustomButton(text: "Done", onPressed: (){
              })
            ],
          ),
        );
      },
    );
  }


}