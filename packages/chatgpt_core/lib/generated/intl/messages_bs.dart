// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bs locale. All the
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
  String get localeName => 'bs';

  static String m0(limit) =>
      "U besplatnoj verziji postoji samo ${limit}x pretraga slika.";

  static String m1(limit) =>
      "Do ${limit} poruka se može prikazati samo u besplatnoj verziji.";

  static String m2(date) => "Datum isteka pretplate ${date}";

  static String m3(number) =>
      "Generiraj (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("O nama"),
        "apply": MessageLookupByLibrary.simpleMessage("Prijavite se"),
        "artist": MessageLookupByLibrary.simpleMessage("Umjetnik"),
        "cancel": MessageLookupByLibrary.simpleMessage("Odustani"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chat Detail"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Razgovarajte sa Botom"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Odaberite izvođača za svoju sliku"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Odaberite detalje za svoju sliku"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Odaberite medij za svoju sliku"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Odaberite raspoloženje za svoju sliku"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Odaberite slučaj upotrebe"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Odaberite stil za svoju sliku"),
        "clear": MessageLookupByLibrary.simpleMessage("Jasno"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Jeste li sigurni da obrišete sadržaj?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Jasan sadržaj"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Očisti razgovor"),
        "confirm": MessageLookupByLibrary.simpleMessage("Potvrdi"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Molimo potvrdite da li želite nastaviti sa brisanjem ove stavke. Ne možete poništiti ovu radnju."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Jeste li sigurni da želite izbrisati ovu stavku?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Jeste li sigurni da ćete ukloniti ključ?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Sadržaj je kopiran u međuspremnik"),
        "copy": MessageLookupByLibrary.simpleMessage("copy"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Kreiranje ćaskanja nije uspjelo"),
        "delete": MessageLookupByLibrary.simpleMessage("Izbriši"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Brisanje nije uspjelo"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalj"),
        "download": MessageLookupByLibrary.simpleMessage("Skinuti"),
        "edit": MessageLookupByLibrary.simpleMessage("Uredi"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Generiranje nije uspjelo"),
        "generate": MessageLookupByLibrary.simpleMessage("Generiraj"),
        "grid": MessageLookupByLibrary.simpleMessage("Grid"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Generiranje slike"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Veličina slike"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Taster za unos"),
        "interest": MessageLookupByLibrary.simpleMessage("Interes"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Vaš API ključ se pohranjuje lokalno na vašem mobilnom telefonu i nikada se ne šalje nigdje drugdje. Možete sačuvati svoj ključ da ga kasnije koristite. Također možete ukloniti svoj ključ ako ga više ne želite koristiti."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Nevažeći ključ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Poslovna uloga"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Veštine posla"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Layout Style"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("slušam..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Učitavanje ključa nije uspjelo"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Učitavanje ključa uspješno"),
        "manage": MessageLookupByLibrary.simpleMessage("Upravljajte"),
        "medium": MessageLookupByLibrary.simpleMessage("Srednje"),
        "mood": MessageLookupByLibrary.simpleMessage("Raspoloženje"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Više opcija"),
        "newChat": MessageLookupByLibrary.simpleMessage("Novo ćaskanje"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Nema generiranja slike"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Broj slika"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Broj slika za generiranje. Mora biti između 1 i 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opcije"),
        "page": MessageLookupByLibrary.simpleMessage("Page"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Provjerite svoju vezu i pokušajte ponovo!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Molimo popunite sva polja"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("Unesite ključ"),
        "prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Stavi svoj ključ ovdje"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regeneracija odgovora"),
        "remaining": MessageLookupByLibrary.simpleMessage("preostali"),
        "remove": MessageLookupByLibrary.simpleMessage("Ukloni"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Uklanjanje ključa nije uspjelo"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ključ je uspješno uklonjen"),
        "reset": MessageLookupByLibrary.simpleMessage("Resetovati"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Poništi postavke"),
        "save": MessageLookupByLibrary.simpleMessage("Spremi"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Sačuvaj ključ"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Čuvanje ključa nije uspjelo"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ključ je uspješno sačuvan"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Traži po upitu..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Sekcija Ključne riječi"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Tema odjeljka"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Odaberite Chat nije uspio"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Odaberite Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Podešavanja"),
        "share": MessageLookupByLibrary.simpleMessage("Podijeli"),
        "skills": MessageLookupByLibrary.simpleMessage("Vještine"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Nešto je pošlo po zlu!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Nešto je pošlo po zlu! Molimo pokušajte ponovo kasnije. Hvala ti puno!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Govor nije dostupan"),
        "style": MessageLookupByLibrary.simpleMessage("Stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Dodirnite mikrofon za razgovor"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Generiranje teksta"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Text Generator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Upišite poruku..."),
        "view": MessageLookupByLibrary.simpleMessage("Pogled"),
        "viewType": MessageLookupByLibrary.simpleMessage("Vrsta pogleda"),
        "write": MessageLookupByLibrary.simpleMessage("Pisati")
      };
}
