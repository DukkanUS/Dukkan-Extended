// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sk locale. All the
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
  String get localeName => 'sk';

  static String m0(limit) =>
      "V bezplatnej verzii existuje iba ${limit}x vyhľadávanie obrázkov.";

  static String m1(limit) =>
      "Až ${limit} správ je možné zobraziť iba v bezplatnej verzii.";

  static String m2(date) => "Dátum vypršania platnosti odberu: ${date}";

  static String m3(number) =>
      "Generovať (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("o"),
        "apply": MessageLookupByLibrary.simpleMessage("platiť"),
        "artist": MessageLookupByLibrary.simpleMessage("Umelec"),
        "cancel": MessageLookupByLibrary.simpleMessage("Zrušiť"),
        "chat": MessageLookupByLibrary.simpleMessage("rozprávanie"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Podrobnosti rozhovoru"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chatujte s Botom"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Vyberte si interpreta pre svoj obrázok"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Vyberte detail pre svoj obrázok"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Vyberte médium pre svoj obrázok"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Vyberte si náladu pre svoj obrázok"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Vyberte prípad použitia"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Vyberte si štýl pre svoj obrázok"),
        "clear": MessageLookupByLibrary.simpleMessage("jasný"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Naozaj chcete vymazať obsah?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Prehľadný obsah"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Jasná konverzácia"),
        "confirm": MessageLookupByLibrary.simpleMessage("potvrdiť"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Potvrďte, či chcete pokračovať v odstraňovaní tejto položky. Túto akciu nemôžete vrátiť späť."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Naozaj chcete odstrániť túto položku?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Naozaj chcete odstrániť kľúč?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Obsah bol skopírovaný do schránky"),
        "copy": MessageLookupByLibrary.simpleMessage("kópie"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Vytvorenie četu zlyhalo"),
        "delete": MessageLookupByLibrary.simpleMessage("vymazať"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Odstránenie zlyhalo"),
        "detail": MessageLookupByLibrary.simpleMessage("detail"),
        "download": MessageLookupByLibrary.simpleMessage("Stiahnuť ▼"),
        "edit": MessageLookupByLibrary.simpleMessage("editovať"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Nepodarilo sa vygenerovať"),
        "generate": MessageLookupByLibrary.simpleMessage("generovať"),
        "grid": MessageLookupByLibrary.simpleMessage("mriežka"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Generovať obrázok"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Veľkosť obrazu"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Vstupný kľúč"),
        "interest": MessageLookupByLibrary.simpleMessage("Úrok"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Váš kľúč API je uložený lokálne vo vašom mobile a nikdy sa neposiela nikam inam. Kľúč si môžete uložiť a použiť ho neskôr. Kľúč môžete tiež odstrániť, ak ho už nechcete používať."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Neplatný kľúč"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Pracovná úloha"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Pracovné schopnosti"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("štýl rozloženia"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Počúvanie..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Načítať kľúč zlyhal"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Načítanie kľúča bolo úspešné"),
        "manage": MessageLookupByLibrary.simpleMessage("Spravovať"),
        "medium": MessageLookupByLibrary.simpleMessage("stredná"),
        "mood": MessageLookupByLibrary.simpleMessage("Nálada"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Viac možností"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nový chat"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage(
            "Negeneruje sa žiadny obrázok"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Počet obrázkov"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Počet obrázkov, ktoré sa majú vygenerovať. Musí byť medzi 1 a 10."),
        "options": MessageLookupByLibrary.simpleMessage("možnosti"),
        "page": MessageLookupByLibrary.simpleMessage("strana"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Skontrolujte pripojenie a skúste to znova!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Vyplňte prosím všetky polia"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("Zadajte kľúč"),
        "prompt": MessageLookupByLibrary.simpleMessage("prompt"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("Sem vložte kľúč"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerovať odozvu"),
        "remaining": MessageLookupByLibrary.simpleMessage("zostávajúce"),
        "remove": MessageLookupByLibrary.simpleMessage("Odstrániť"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Odstránenie kľúča zlyhalo"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kľúč bol úspešne odstránený"),
        "reset": MessageLookupByLibrary.simpleMessage("resetovať"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Obnoviť nastavenia"),
        "save": MessageLookupByLibrary.simpleMessage("Ulozit"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Uložiť kľúč"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Uloženie kľúča zlyhalo"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kľúč bol úspešne uložený"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Hľadať podľa výzvy..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Sekcia Kľúčové slová"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Téma sekcie"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Vyberte možnosť Chat zlyhal"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Vyberte položku Výzva"),
        "settings": MessageLookupByLibrary.simpleMessage("nastavenie"),
        "share": MessageLookupByLibrary.simpleMessage("zdieľam"),
        "skills": MessageLookupByLibrary.simpleMessage("Zručnosti"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Niečo sa pokazilo!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Niečo sa pokazilo! Skúste neskôr prosím. Ďakujem ti veľmi pekne!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Reč nie je k dispozícii"),
        "style": MessageLookupByLibrary.simpleMessage("Štýl"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Hovorte klepnutím na mikrofón"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Generovanie textu"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Textový generátor"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Napíšte správu..."),
        "view": MessageLookupByLibrary.simpleMessage("vyhliadka"),
        "viewType": MessageLookupByLibrary.simpleMessage("Typ zobrazenia"),
        "write": MessageLookupByLibrary.simpleMessage("Napíšte")
      };
}
