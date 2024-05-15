// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a el locale. All the
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
  String get localeName => 'el';

  static String m0(limit) =>
      "Υπάρχει μόνο ${limit}x αναζήτηση εικόνων στη δωρεάν έκδοση.";

  static String m1(limit) =>
      "Μέχρι ${limit} μηνύματα μπορούν να εμφανιστούν μόνο στη δωρεάν έκδοση.";

  static String m2(date) => "Ημερομηνία λήξης συνδρομής ${date}";

  static String m3(number) =>
      "Δημιουργία (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Σχετικά με"),
        "apply": MessageLookupByLibrary.simpleMessage("Ισχύουν"),
        "artist": MessageLookupByLibrary.simpleMessage("Καλλιτέχνης"),
        "cancel": MessageLookupByLibrary.simpleMessage("Ματαίωση"),
        "chat": MessageLookupByLibrary.simpleMessage("Κουβέντα"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Λεπτομέρεια συνομιλίας"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Συνομιλία GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Συνομιλία με Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε καλλιτέχνη για την εικόνα σας"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε λεπτομέρεια για την εικόνα σας"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε μέσο για την εικόνα σας"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε διάθεση για την εικόνα σας"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Επιλέξτε περίπτωση χρήσης"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε στυλ για την εικόνα σας"),
        "clear": MessageLookupByLibrary.simpleMessage("Σαφή"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Είστε βέβαιοι ότι θα διαγράψετε το περιεχόμενο;"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Καθαρό περιεχόμενο"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Καθαρή συνομιλία"),
        "confirm": MessageLookupByLibrary.simpleMessage("Επιβεβαιώνω"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Επιβεβαιώστε εάν θέλετε να προχωρήσετε στη διαγραφή αυτού του στοιχείου. Δεν μπορείτε να αναιρέσετε αυτήν την ενέργεια."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Είστε βέβαιοι ότι θέλετε να διαγράψετε αυτό το στοιχείο;"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Είστε βέβαιοι ότι θα αφαιρέσετε το κλειδί;"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Αντιγράφηκε περιεχόμενο στο πρόχειρο"),
        "copy": MessageLookupByLibrary.simpleMessage("αντίγραφο"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Η δημιουργία συνομιλίας απέτυχε"),
        "delete": MessageLookupByLibrary.simpleMessage("Διαγράφω"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Η διαγραφή απέτυχε"),
        "detail": MessageLookupByLibrary.simpleMessage("Λεπτομέρεια"),
        "download": MessageLookupByLibrary.simpleMessage("Κατεβάστε"),
        "edit": MessageLookupByLibrary.simpleMessage("Επεξεργασία"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Αποτυχία δημιουργίας"),
        "generate": MessageLookupByLibrary.simpleMessage("Παράγω"),
        "grid": MessageLookupByLibrary.simpleMessage("Πλέγμα"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Δημιουργία εικόνας"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Μέγεθος εικόνας"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Κλειδί εισόδου"),
        "interest": MessageLookupByLibrary.simpleMessage("Ενδιαφέρον"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Το κλειδί API αποθηκεύεται τοπικά στο κινητό σας και δεν αποστέλλεται ποτέ πουθενά αλλού. Μπορείτε να αποθηκεύσετε το κλειδί σας για να το χρησιμοποιήσετε αργότερα. Μπορείτε επίσης να αφαιρέσετε το κλειδί σας εάν δεν θέλετε να το χρησιμοποιείτε πλέον."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Μη έγκυρο κλειδί"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Ρόλος Εργασίας"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Επαγγελματικές Δεξιότητες"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Στυλ Διάταξης"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Ακούγοντας..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Το κλειδί φόρτωσης απέτυχε"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Επιτυχία φόρτωσης κλειδιού"),
        "manage": MessageLookupByLibrary.simpleMessage("Διαχειρίζονται"),
        "medium": MessageLookupByLibrary.simpleMessage("Μεσαίο"),
        "mood": MessageLookupByLibrary.simpleMessage("Διάθεση"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Περισσότερες επιλογές"),
        "newChat": MessageLookupByLibrary.simpleMessage("Νέα συνομιλία"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Δεν δημιουργείται εικόνα"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Αριθμός εικόνων"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Ο αριθμός των εικόνων που θα δημιουργηθούν. Πρέπει να είναι μεταξύ 1 και 10."),
        "options": MessageLookupByLibrary.simpleMessage("Επιλογές"),
        "page": MessageLookupByLibrary.simpleMessage("Σελίδα"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Παρακαλώ συμπληρώστε όλα τα πεδία"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Παρακαλώ εισάγετε το κλειδί"),
        "prompt": MessageLookupByLibrary.simpleMessage("Προτροπή"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Βάλτε το κλειδί σας εδώ"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Αναγέννηση απόκρισης"),
        "remaining": MessageLookupByLibrary.simpleMessage("Παραμένων"),
        "remove": MessageLookupByLibrary.simpleMessage("Αφαιρώ"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Η αφαίρεση του κλειδιού απέτυχε"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Το κλειδί καταργήθηκε με επιτυχία"),
        "reset": MessageLookupByLibrary.simpleMessage("Επαναφορά"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Επαναφορά ρυθμίσεων"),
        "save": MessageLookupByLibrary.simpleMessage("Αποθηκεύσετε"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Αποθήκευση κλειδιού"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Η αποθήκευση κλειδιού απέτυχε"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Το κλειδί αποθηκεύτηκε με επιτυχία"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Αναζήτηση μέσω προτροπής..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Λέξεις-κλειδιά ενότητας"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Θέμα Ενότητας"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Επιλέξτε Η συνομιλία απέτυχε"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Επιλέξτε Ερώτηση"),
        "settings": MessageLookupByLibrary.simpleMessage("Ρυθμίσεις"),
        "share": MessageLookupByLibrary.simpleMessage("Μερίδιο"),
        "skills": MessageLookupByLibrary.simpleMessage("Δεξιότητες"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Κάτι πήγε στραβά!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Κάτι πήγε στραβά! Παρακαλώ δοκιμάστε ξανά αργότερα. Σε ευχαριστώ πάρα πολύ!"),
        "speechNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Η ομιλία δεν είναι διαθέσιμη"),
        "style": MessageLookupByLibrary.simpleMessage("Στυλ"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Πατήστε το μικρόφωνο για να μιλήσετε"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Δημιουργία κειμένου"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Γεννήτρια κειμένου"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage(
            "Πληκτρολογήστε ένα μήνυμα ..."),
        "view": MessageLookupByLibrary.simpleMessage("Θέα"),
        "viewType": MessageLookupByLibrary.simpleMessage("Τύπος προβολής"),
        "write": MessageLookupByLibrary.simpleMessage("Γράφω")
      };
}
