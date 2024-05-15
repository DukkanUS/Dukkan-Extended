// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sv locale. All the
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
  String get localeName => 'sv';

  static String m0(limit) =>
      "Det finns bara ${limit}x bildsökning i gratisversionen.";

  static String m1(limit) =>
      "Upp till ${limit} meddelanden kan endast visas i gratisversionen.";

  static String m2(date) => "Prenumerationens utgångsdatum ${date}";

  static String m3(number) =>
      "Generera (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Handla om"),
        "apply": MessageLookupByLibrary.simpleMessage("Tillämpa"),
        "artist": MessageLookupByLibrary.simpleMessage("Konstnär"),
        "cancel": MessageLookupByLibrary.simpleMessage("Annullera"),
        "chat": MessageLookupByLibrary.simpleMessage("Chatt"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chattdetaljer"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chatta GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chatta med Bot"),
        "chooseArtist":
            MessageLookupByLibrary.simpleMessage("Välj artist för din bild"),
        "chooseDetail":
            MessageLookupByLibrary.simpleMessage("Välj detalj för din bild"),
        "chooseMedium":
            MessageLookupByLibrary.simpleMessage("Välj medium för din bild"),
        "chooseMood":
            MessageLookupByLibrary.simpleMessage("Välj humör för din bild"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Välj användningsfall"),
        "choseStyle":
            MessageLookupByLibrary.simpleMessage("Välj stil för din bild"),
        "clear": MessageLookupByLibrary.simpleMessage("Klar"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Är du säker på att rensa innehåll?"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Tydligt innehåll"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Tydlig konversation"),
        "confirm": MessageLookupByLibrary.simpleMessage("Bekräfta"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Vänligen bekräfta om du vill fortsätta med raderingen av detta objekt. Du kan inte ångra den här åtgärden."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Är du säker på att du vill ta bort det här objektet?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Är du säker på att ta bort nyckeln?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Kopierat innehåll till urklipp"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopia"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Det gick inte att skapa chatt"),
        "delete": MessageLookupByLibrary.simpleMessage("Radera"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Radering misslyckades"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalj"),
        "download": MessageLookupByLibrary.simpleMessage("Ladda ner"),
        "edit": MessageLookupByLibrary.simpleMessage("Redigera"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Det gick inte att generera"),
        "generate": MessageLookupByLibrary.simpleMessage("Generera"),
        "grid": MessageLookupByLibrary.simpleMessage("Rutnät"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Bild generera"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Bildstorlek"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Inmatningsnyckel"),
        "interest": MessageLookupByLibrary.simpleMessage("Intressera"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Din API-nyckel lagras lokalt på din mobil och skickas aldrig någon annanstans. Du kan spara din nyckel för att använda den senare. Du kan också ta bort din nyckel om du inte vill använda den längre."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Ogiltig nyckel"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Arbetsroll"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Arbetserfarenheter"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Layoutstil"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Lyssnande..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Ladda nyckel misslyckades"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ladda nyckel framgång"),
        "manage": MessageLookupByLibrary.simpleMessage("Hantera"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "mood": MessageLookupByLibrary.simpleMessage("humör"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Fler alternativ"),
        "newChat": MessageLookupByLibrary.simpleMessage("Ny chatt"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Ingen bild genereras"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Antal bilder"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Antalet bilder som ska genereras. Måste vara mellan 1 och 10."),
        "options": MessageLookupByLibrary.simpleMessage("alternativ"),
        "page": MessageLookupByLibrary.simpleMessage("Sida"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Kontrollera din anslutning och försök igen!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Var god fyll i alla fält"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Vänligen ange nyckel"),
        "prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Lägg din nyckel här"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Återskapa svar"),
        "remaining": MessageLookupByLibrary.simpleMessage("Återstående"),
        "remove": MessageLookupByLibrary.simpleMessage("Ta bort"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Det gick inte att ta bort nyckel"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Nyckeln har tagits bort"),
        "reset": MessageLookupByLibrary.simpleMessage("Återställa"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Återställ inställningar"),
        "save": MessageLookupByLibrary.simpleMessage("Spara"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Spara nyckel"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Spara nyckel misslyckades"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Nyckeln har sparats"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Sök efter uppmaning..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Sektionssökord"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Avsnittsämne"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Välj Chatt misslyckades"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Välj Fråga"),
        "settings": MessageLookupByLibrary.simpleMessage("Inställningar"),
        "share": MessageLookupByLibrary.simpleMessage("Dela med sig"),
        "skills": MessageLookupByLibrary.simpleMessage("Kompetens"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Något gick fel!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Något gick fel! Vänligen försök igen senare. Tack så mycket!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Tal inte tillgängligt"),
        "style": MessageLookupByLibrary.simpleMessage("Stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Tryck på mikrofonen för att prata"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Text genererar"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Textgenerator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Skriv ett meddelande..."),
        "view": MessageLookupByLibrary.simpleMessage("Se"),
        "viewType": MessageLookupByLibrary.simpleMessage("Visa typ"),
        "write": MessageLookupByLibrary.simpleMessage("skriva")
      };
}
