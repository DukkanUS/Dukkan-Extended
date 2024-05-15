// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a cs locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'cs';

  static String m0(limit) =>
      "V bezplatné verzi je pouze ${limit}x vyhledávání obrázků.";

  static String m1(limit) =>
      "Až ${limit} zpráv lze zobrazit pouze v bezplatné verzi.";

  static String m2(date) => "Datum vypršení platnosti předplatného ${date}";

  static String m3(number) =>
      "Generovat (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("O"),
        "apply": MessageLookupByLibrary.simpleMessage("Aplikovat"),
        "artist": MessageLookupByLibrary.simpleMessage("Umělec"),
        "cancel": MessageLookupByLibrary.simpleMessage("zrušení"),
        "chat": MessageLookupByLibrary.simpleMessage("Povídat si"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Podrobnosti chatu"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chatujte s Botem"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Vyberte si umělce pro svůj obrázek"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Vyberte detail pro svůj obrázek"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Vyberte médium pro svůj obrázek"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Vyberte si náladu pro svůj obrázek"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Vyberte případ použití"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Vyberte si styl pro svůj obrázek"),
        "clear": MessageLookupByLibrary.simpleMessage("Průhledná"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Jste si jisti, že vymažete obsah?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Přehledný obsah"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Jasná konverzace"),
        "confirm": MessageLookupByLibrary.simpleMessage("Potvrdit"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Potvrďte prosím, zda chcete pokračovat ve smazání této položky. Tuto akci nelze vrátit zpět."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Opravdu chcete tuto položku smazat?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Opravdu chcete odstranit klíč?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Obsah byl zkopírován do schránky"),
        "copy": MessageLookupByLibrary.simpleMessage("kopírovat"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Vytvoření chatu se nezdařilo"),
        "delete": MessageLookupByLibrary.simpleMessage("Odstranit"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Smazání se nezdařilo"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "download": MessageLookupByLibrary.simpleMessage("Stažení"),
        "edit": MessageLookupByLibrary.simpleMessage("Upravit"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Generování se nezdařilo"),
        "generate": MessageLookupByLibrary.simpleMessage("generovat"),
        "grid": MessageLookupByLibrary.simpleMessage("Mřížka"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Generování obrázku"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Velikost obrázku"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Vstupní klíč"),
        "interest": MessageLookupByLibrary.simpleMessage("Zájem"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Váš klíč API je uložen lokálně ve vašem mobilu a nikdy se neposílá nikam jinam. Klíč si můžete uložit a použít jej později. Klíč můžete také odebrat, pokud jej již nechcete používat."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Špatný klíč"),
        "jobRole": MessageLookupByLibrary.simpleMessage("pracovní pozice"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Pracovní schopnosti"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Styl rozvržení"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Naslouchání..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Klíč načtení se nezdařil"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Klíč načtení byl úspěšný"),
        "manage": MessageLookupByLibrary.simpleMessage("Spravovat"),
        "medium": MessageLookupByLibrary.simpleMessage("Střední"),
        "mood": MessageLookupByLibrary.simpleMessage("Nálada"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Více možností"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nový chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Negeneruje se žádný obrázek"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Počet obrázků"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Počet obrázků, které se mají vygenerovat. Musí být mezi 1 a 10."),
        "options": MessageLookupByLibrary.simpleMessage("Možnosti"),
        "page": MessageLookupByLibrary.simpleMessage("Stránka"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Zkontrolujte připojení a zkuste to znovu!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Prosím, vyplňte všechna pole"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("Zadejte klíč"),
        "prompt": MessageLookupByLibrary.simpleMessage("Výzva"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Dejte sem svůj klíč"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerovat odezvu"),
        "remaining": MessageLookupByLibrary.simpleMessage("zbývající"),
        "remove": MessageLookupByLibrary.simpleMessage("Odstranit"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Odebrat klíč se nezdařil"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Klíč byl úspěšně odebrán"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Resetovat nastavení"),
        "save": MessageLookupByLibrary.simpleMessage("Uložit"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Uložit klíč"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Uložit klíč se nezdařilo"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Klíč byl úspěšně uložen"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Hledat podle výzvy..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Klíčová slova sekce"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Téma sekce"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Vyberte Chat se nezdařil"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Vyberte Dotázat se"),
        "settings": MessageLookupByLibrary.simpleMessage("NASTAVENÍ"),
        "share": MessageLookupByLibrary.simpleMessage("Podíl"),
        "skills": MessageLookupByLibrary.simpleMessage("dovedností"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Něco se pokazilo!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Něco se pokazilo! Prosím zkuste to znovu později. Děkuji mnohokrát!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Řeč není k dispozici"),
        "style": MessageLookupByLibrary.simpleMessage("Styl"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Chcete-li mluvit, klepněte na mikrofon"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Generování textu"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Textový generátor"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Napište zprávu..."),
        "view": MessageLookupByLibrary.simpleMessage("Pohled"),
        "viewType": MessageLookupByLibrary.simpleMessage("Typ zobrazení"),
        "write": MessageLookupByLibrary.simpleMessage("Napsat")
      };
}
