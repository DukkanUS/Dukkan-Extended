// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(limit) =>
      "Il n\'y a que ${limit}x recherche d\'images dans la version gratuite.";

  static String m1(limit) =>
      "Jusqu\'à ${limit}  messages ne peuvent être affichés que dans la version gratuite.";

  static String m2(date) => "Date d\'expiration de l\'abonnement ${date}";

  static String m3(number) =>
      "Générer (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("sur"),
        "apply": MessageLookupByLibrary.simpleMessage("appliquer"),
        "artist": MessageLookupByLibrary.simpleMessage("Artiste"),
        "cancel": MessageLookupByLibrary.simpleMessage("annuler"),
        "chat": MessageLookupByLibrary.simpleMessage("bavarder"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Détails du chat"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Chatter avec le robot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Choisissez l\'artiste pour votre image"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Choisissez le détail de votre image"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Choisissez le support de votre image"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Choisissez l\'ambiance de votre image"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage(
            "Choisissez le cas d\'utilisation"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Choisissez le style de votre image"),
        "clear": MessageLookupByLibrary.simpleMessage("Clair"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous vraiment effacer le contenu ?"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Effacer le contenu"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Conversation claire"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmer"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Veuillez confirmer si vous souhaitez procéder à la suppression de cet élément. Vous ne pouvez pas annuler cette action."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous vraiment supprimer cet élément?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Êtes-vous sûr de retirer la clé ?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Contenu copié dans le presse-papiers"),
        "copy": MessageLookupByLibrary.simpleMessage("copie"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Échec de la création du chat"),
        "delete": MessageLookupByLibrary.simpleMessage("Effacer"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("La suppression a échoué"),
        "detail": MessageLookupByLibrary.simpleMessage("Détail"),
        "download": MessageLookupByLibrary.simpleMessage("Télécharger"),
        "edit": MessageLookupByLibrary.simpleMessage("modifier"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("n\'a pas réussi à générer"),
        "generate": MessageLookupByLibrary.simpleMessage("produire"),
        "grid": MessageLookupByLibrary.simpleMessage("la grille"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Génération d\'images"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Taille de l\'image"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Clé d\'entrée"),
        "interest": MessageLookupByLibrary.simpleMessage("Intérêt"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Votre clé API est stockée localement sur votre mobile et n\'est jamais envoyée ailleurs. Vous pouvez enregistrer votre clé pour l\'utiliser plus tard. Vous pouvez également retirer votre clé si vous ne souhaitez plus l\'utiliser."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Clé non valide"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Rôle de l\'emploi"),
        "jobSkills": MessageLookupByLibrary.simpleMessage(
            "Compétences professionnelles"),
        "layoutStyle":
            MessageLookupByLibrary.simpleMessage("Style de mise en page"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Écoute..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Échec du chargement de la clé"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Charger la clé réussie"),
        "manage": MessageLookupByLibrary.simpleMessage("Gérer"),
        "medium": MessageLookupByLibrary.simpleMessage("Moyen"),
        "mood": MessageLookupByLibrary.simpleMessage("Ambiance"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Plus d\'options"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nouveau chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Aucune image générée"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Nombre d\'images"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Le nombre d\'images à générer. Doit être compris entre 1 et 10."),
        "options": MessageLookupByLibrary.simpleMessage("Les options"),
        "page": MessageLookupByLibrary.simpleMessage("Page"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Veuillez vérifier votre connexion et réessayer !"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Merci de remplir tous les champs"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Veuillez entrer la clé"),
        "prompt": MessageLookupByLibrary.simpleMessage("rapide"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Mettez votre clé ici"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Régénérer la réponse"),
        "remaining": MessageLookupByLibrary.simpleMessage("Restant"),
        "remove": MessageLookupByLibrary.simpleMessage("Retirer"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Échec de la suppression de la clé"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Clé supprimée avec succès"),
        "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Réinitialiser les options"),
        "save": MessageLookupByLibrary.simpleMessage("sauvegarder"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Enregistrer la clé"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Échec de l\'enregistrement de la clé"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Clé enregistrée avec succès"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Rechercher par invite..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Mots-clés de la section"),
        "sectionTopic":
            MessageLookupByLibrary.simpleMessage("Sujet de la section"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Échec de la sélection du chat"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Sélectionnez l\'invite"),
        "settings": MessageLookupByLibrary.simpleMessage("Réglages"),
        "share": MessageLookupByLibrary.simpleMessage("Partager"),
        "skills": MessageLookupByLibrary.simpleMessage("compétences"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Quelque chose s\'est mal passé !!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Quelque chose s\'est mal passé ! Veuillez réessayer plus tard. Merci beaucoup!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Discours non disponible"),
        "style": MessageLookupByLibrary.simpleMessage("Style"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Appuyez sur le micro pour parler"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Génération de texte"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Générateur de texte"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Tapez un message ..."),
        "view": MessageLookupByLibrary.simpleMessage("Vue"),
        "viewType": MessageLookupByLibrary.simpleMessage("Type de vue"),
        "write": MessageLookupByLibrary.simpleMessage("Écrire")
      };
}
