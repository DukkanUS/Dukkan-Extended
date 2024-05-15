// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fi locale. All the
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
  String get localeName => 'fi';

  static String m0(limit) => "Ilmaisessa versiossa on vain ${limit}x kuvahaku.";

  static String m1(limit) =>
      "Enintään ${limit} viestiä voidaan näyttää vain ilmaisessa versiossa.";

  static String m2(date) => "Tilauksen päättymispäivä ${date}";

  static String m3(number) =>
      "Luo (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Noin"),
        "apply": MessageLookupByLibrary.simpleMessage("Käytä"),
        "artist": MessageLookupByLibrary.simpleMessage("Taiteilija"),
        "cancel": MessageLookupByLibrary.simpleMessage("Peruuttaa"),
        "chat": MessageLookupByLibrary.simpleMessage("jutella"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Keskustelun yksityiskohdat"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Keskustele Botin kanssa"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Valitse kuvallesi taiteilija"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Valitse kuvasi yksityiskohdat"),
        "chooseMedium":
            MessageLookupByLibrary.simpleMessage("Valitse väline kuvallesi"),
        "chooseMood":
            MessageLookupByLibrary.simpleMessage("Valitse kuvallesi tunnelma"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Valitse käyttötapaus"),
        "choseStyle":
            MessageLookupByLibrary.simpleMessage("Valitse kuvallesi tyyli"),
        "clear": MessageLookupByLibrary.simpleMessage("Asia selvä"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Oletko varma, että tyhjennät sisällön?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Selkeä sisältö"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Selkeä keskustelu"),
        "confirm": MessageLookupByLibrary.simpleMessage("Vahvistaa"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Vahvista, jos haluat jatkaa tämän kohteen poistamista. Tätä toimintoa ei voi kumota."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Haluatko varmasti poistaa tämän kohteen?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Oletko varma, että poistat avaimen?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Sisältö kopioitu leikepöydälle"),
        "copy": MessageLookupByLibrary.simpleMessage("kopio"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Chatin luominen epäonnistui"),
        "delete": MessageLookupByLibrary.simpleMessage("Poistaa"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Poista epäonnistui"),
        "detail": MessageLookupByLibrary.simpleMessage("Yksityiskohta"),
        "download": MessageLookupByLibrary.simpleMessage("Ladata"),
        "edit": MessageLookupByLibrary.simpleMessage("muokata"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Luominen epäonnistui"),
        "generate": MessageLookupByLibrary.simpleMessage("Tuottaa"),
        "grid": MessageLookupByLibrary.simpleMessage("ruudukko"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Kuvan luominen"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Kuvan koko"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Syöttöavain"),
        "interest": MessageLookupByLibrary.simpleMessage("Kiinnostuksen kohde"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "API-avaimesi tallennetaan paikallisesti matkapuhelimeesi, eikä sitä koskaan lähetetä minnekään muualle. Voit tallentaa avaimesi käyttääksesi sitä myöhemmin. Voit myös poistaa avaimen, jos et halua käyttää sitä enää."),
        "invalidKey":
            MessageLookupByLibrary.simpleMessage("Virheellinen avain"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Työ rooli"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Työtaidot"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Asettelutyyli"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Kuuntelee..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Avaimen lataus epäonnistui"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Avaimen lataus onnistui"),
        "manage": MessageLookupByLibrary.simpleMessage("hoitaa"),
        "medium": MessageLookupByLibrary.simpleMessage("keskikokoinen"),
        "mood": MessageLookupByLibrary.simpleMessage("Mieliala"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Lisää vaihtoehtoja"),
        "newChat": MessageLookupByLibrary.simpleMessage("Uusi Chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Ei kuvan luomista"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Kuvien määrä"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Luotavien kuvien määrä. On oltava välillä 1–10."),
        "options": MessageLookupByLibrary.simpleMessage("vaihtoehdot"),
        "page": MessageLookupByLibrary.simpleMessage("Sivu"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Tarkista yhteys ja yritä uudelleen!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Täytä kaikki kentät"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Ole hyvä ja syötä avain"),
        "prompt": MessageLookupByLibrary.simpleMessage("nopea"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Laita avaimesi tähän"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Luo vastaus uudelleen"),
        "remaining": MessageLookupByLibrary.simpleMessage("Jäljelle jäänyt"),
        "remove": MessageLookupByLibrary.simpleMessage("Poistaa"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Avaimen poisto epäonnistui"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Avain poistettu onnistuneesti"),
        "reset": MessageLookupByLibrary.simpleMessage("asettaa uudelleen"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Palauta asetukset"),
        "save": MessageLookupByLibrary.simpleMessage("Tallentaa"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Tallenna avain"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Tallennusavain epäonnistui"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Avain tallennettu onnistuneesti"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage(
            "Hae kehotteen perusteella..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Osion Avainsanat"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Osion aihe"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Valitse Chat Failed"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Valitse Kehote"),
        "settings": MessageLookupByLibrary.simpleMessage("asetukset"),
        "share": MessageLookupByLibrary.simpleMessage("Jaa"),
        "skills": MessageLookupByLibrary.simpleMessage("Taidot"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Jotain meni pieleen!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Jotain meni pieleen! Yritä uudelleen myöhemmin. Kiitos paljon!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Puhe ei ole käytettävissä"),
        "style": MessageLookupByLibrary.simpleMessage("Tyyli"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Napauta mikrofonia puhuaksesi"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Tekstin luominen"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Tekstigeneraattori"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Kirjoita viesti ..."),
        "view": MessageLookupByLibrary.simpleMessage("näkymä"),
        "viewType": MessageLookupByLibrary.simpleMessage("Näkymän tyyppi"),
        "write": MessageLookupByLibrary.simpleMessage("kirjoittaa")
      };
}
