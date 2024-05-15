// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  static String m0(limit) =>
      "Er is slechts ${limit}x zoeken naar afbeeldingen in de gratis versie.";

  static String m1(limit) =>
      "Er kunnen maximaal ${limit} berichten worden weergegeven in de gratis versie.";

  static String m2(date) => "Vervaldatum abonnement ${date}";

  static String m3(number) =>
      "Genereren (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Wat betreft"),
        "apply": MessageLookupByLibrary.simpleMessage("Van toepassing zijn"),
        "artist": MessageLookupByLibrary.simpleMessage("Artiest"),
        "cancel": MessageLookupByLibrary.simpleMessage("annuleren"),
        "chat": MessageLookupByLibrary.simpleMessage("babbelen"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chatdetails"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("GPT chatten"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chatten met bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Kies artiest voor je afbeelding"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Kies detail voor uw afbeelding"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Kies medium voor je afbeelding"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Kies de stemming voor uw afbeelding"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Kies een use-case"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Kies stijl voor uw afbeelding"),
        "clear": MessageLookupByLibrary.simpleMessage("Duidelijk"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Weet u zeker dat u de inhoud wilt wissen?"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Duidelijke inhoud"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Duidelijke conversatie"),
        "confirm": MessageLookupByLibrary.simpleMessage("Bevestigen"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Gelieve te bevestigen of u door wilt gaan met het verwijderen van dit item. U kunt deze actie niet ongedaan maken."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Weet u zeker dat u dit item wilt verwijderen?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Weet u zeker dat u de sleutel wilt verwijderen?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Gekopieerde inhoud naar klembord"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopiëren"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Chat maken mislukt"),
        "delete": MessageLookupByLibrary.simpleMessage("Verwijder"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Verwijderen is mislukt"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "edit": MessageLookupByLibrary.simpleMessage("BEWERK"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Kan niet genereren"),
        "generate": MessageLookupByLibrary.simpleMessage("voortbrengen"),
        "grid": MessageLookupByLibrary.simpleMessage("Rooster"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Afbeelding genereren"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Afbeeldingsgrootte"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Invoersleutel"),
        "interest": MessageLookupByLibrary.simpleMessage("Interesseren"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Uw API-sleutel wordt lokaal op uw mobiel opgeslagen en wordt nooit ergens anders naartoe gestuurd. U kunt uw sleutel opslaan om deze later te gebruiken. U kunt uw sleutel ook verwijderen als u deze niet meer wilt gebruiken."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Ongeldige sleutel"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Taakomschrijving"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Baan vaardigheden"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Layout-stijl"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Luisteren..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Sleutel laden mislukt"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Laad sleutelsucces"),
        "manage": MessageLookupByLibrary.simpleMessage("Beheren"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "mood": MessageLookupByLibrary.simpleMessage("Humeur"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Meer opties"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nieuw gesprek"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage(
            "Er wordt geen afbeelding gegenereerd"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Aantal afbeeldingen"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Het aantal te genereren afbeeldingen. Moet tussen 1 en 10 zijn."),
        "options": MessageLookupByLibrary.simpleMessage("opties"),
        "page": MessageLookupByLibrary.simpleMessage("Pagina"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Controleer je verbinding en probeer het opnieuw!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Vul alstublieft alle velden in"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Voer de sleutel in"),
        "prompt": MessageLookupByLibrary.simpleMessage("snel"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Leg hier uw sleutel neer"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Reactie opnieuw genereren"),
        "remaining": MessageLookupByLibrary.simpleMessage("overblijvende"),
        "remove": MessageLookupByLibrary.simpleMessage("Verwijderen"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Sleutel verwijderen mislukt"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Sleutel succesvol verwijderd"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Reset instellingen"),
        "save": MessageLookupByLibrary.simpleMessage("Opslaan"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Sleutel opslaan"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Sleutel opslaan mislukt"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Sleutel succesvol opgeslagen"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Zoeken op prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Sectie Trefwoorden"),
        "sectionTopic":
            MessageLookupByLibrary.simpleMessage("Sectie onderwerp"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Selecteer Chat mislukt"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Selecteer vragen"),
        "settings": MessageLookupByLibrary.simpleMessage("instellingen"),
        "share": MessageLookupByLibrary.simpleMessage("Delen"),
        "skills": MessageLookupByLibrary.simpleMessage("vaardigheden"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Er is iets fout gegaan!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Er is iets fout gegaan! Probeer het later opnieuw. Ontzettend bedankt!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Spraak niet beschikbaar"),
        "style": MessageLookupByLibrary.simpleMessage("Stijl"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Tik op de microfoon om te praten"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Tekst genereren"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Tekstgenerator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Type een bericht..."),
        "view": MessageLookupByLibrary.simpleMessage("Uitzicht"),
        "viewType": MessageLookupByLibrary.simpleMessage("Type weergave"),
        "write": MessageLookupByLibrary.simpleMessage("SCHRIJVEN")
      };
}
