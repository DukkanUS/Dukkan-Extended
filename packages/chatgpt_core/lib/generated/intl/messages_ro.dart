// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ro locale. All the
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
  String get localeName => 'ro';

  static String m0(limit) =>
      "Există doar ${limit}x căutare de imagini în versiunea gratuită.";

  static String m1(limit) =>
      "Până la ${limit} mesaje pot fi afișate numai în versiunea gratuită.";

  static String m2(date) => "Data expirării abonamentului ${date}";

  static String m3(number) =>
      "Generați (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Despre"),
        "apply": MessageLookupByLibrary.simpleMessage("aplica"),
        "artist": MessageLookupByLibrary.simpleMessage("Artist"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anulare"),
        "chat": MessageLookupByLibrary.simpleMessage("conversație"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Detaliu chat"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chat cu Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Alege un artist pentru imaginea ta"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Alegeți detaliile pentru imaginea dvs"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Alegeți mediul pentru imaginea dvs"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Alegeți starea de spirit pentru imaginea dvs"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Alegeți cazul de utilizare"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Alegeți stilul pentru imaginea dvs"),
        "clear": MessageLookupByLibrary.simpleMessage("clar"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Ești sigur că ștergi conținutul?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Conținut clar"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Conversație clară"),
        "confirm": MessageLookupByLibrary.simpleMessage("A confirma"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Vă rugăm să confirmați dacă doriți să continuați cu ștergerea acestui articol. Nu puteți anula această acțiune."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Sigur doriți să ștergeți acest articol?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Sunteți sigur că eliminați cheia?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Conținut copiat în clipboard"),
        "copy": MessageLookupByLibrary.simpleMessage("Copie"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Crearea chat a eșuat"),
        "delete": MessageLookupByLibrary.simpleMessage("Șterge"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Ștergerea a eșuat"),
        "detail": MessageLookupByLibrary.simpleMessage("Detaliu"),
        "download": MessageLookupByLibrary.simpleMessage("Descarca"),
        "edit": MessageLookupByLibrary.simpleMessage("Editați | ×"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Nu s-a putut genera"),
        "generate": MessageLookupByLibrary.simpleMessage("genera"),
        "grid": MessageLookupByLibrary.simpleMessage("Grilă"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Generarea imaginii"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Marimea imaginii"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Tasta de intrare"),
        "interest": MessageLookupByLibrary.simpleMessage("interes"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Cheia dvs. API este stocată local pe mobil și nu este trimisă niciodată altundeva. Puteți salva cheia pentru a o utiliza mai târziu. De asemenea, vă puteți elimina cheia dacă nu doriți să o mai folosiți."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Cheie invalida"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Rolul postului"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Abilități de muncă"),
        "layoutStyle":
            MessageLookupByLibrary.simpleMessage("asezare in pagina"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Ascultare..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Încărcarea cheii a eșuat"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Încărcare cheie de succes"),
        "manage": MessageLookupByLibrary.simpleMessage("Administra"),
        "medium": MessageLookupByLibrary.simpleMessage("Mediu"),
        "mood": MessageLookupByLibrary.simpleMessage("Dispoziţie"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Mai multe opțiuni"),
        "newChat": MessageLookupByLibrary.simpleMessage("Chat nou"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Nicio imagine generată"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Numărul de imagini"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Numărul de imagini de generat. Trebuie să fie între 1 și 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opțiuni"),
        "page": MessageLookupByLibrary.simpleMessage("pagină"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Vă rugăm să vă verificați conexiunea și să încercați din nou!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Vă rugăm să completați toate câmpurile"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage(
            "Vă rugăm să introduceți tasta"),
        "prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Pune-ți cheia aici"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerați răspunsul"),
        "remaining": MessageLookupByLibrary.simpleMessage("Rămas"),
        "remove": MessageLookupByLibrary.simpleMessage("Elimina"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Eliminare cheie a eșuat"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Cheia eliminată cu succes"),
        "reset": MessageLookupByLibrary.simpleMessage("Restabili"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Reseteaza setarile"),
        "save": MessageLookupByLibrary.simpleMessage("Salvați"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Salvare cheie"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Salvare cheie a eșuat"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Cheie salvată cu succes"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Căutați după prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Secțiunea Cuvinte cheie"),
        "sectionTopic":
            MessageLookupByLibrary.simpleMessage("Sectiunea Subiect"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Selectați Chat eșuat"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Selectați Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Setări"),
        "share": MessageLookupByLibrary.simpleMessage("Acțiune"),
        "skills": MessageLookupByLibrary.simpleMessage("Aptitudini"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Ceva n-a mers bine!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Ceva n-a mers bine! Vă rugăm să încercați din nou mai târziu. Mulțumesc foarte mult!"),
        "speechNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Discursul nu este disponibil"),
        "style": MessageLookupByLibrary.simpleMessage("stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Atingeți microfonul pentru a vorbi"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Generare text"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Generator de text"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Scrie un mesaj..."),
        "view": MessageLookupByLibrary.simpleMessage("Vedere"),
        "viewType":
            MessageLookupByLibrary.simpleMessage("Tipul de vizualizare"),
        "write": MessageLookupByLibrary.simpleMessage("scrie")
      };
}
