import 'dart:ui' as ui;
import 'dart:html' as html; // Web only
import 'package:flutter/material.dart';

enum AppLang { en, fr }

/// Stocke la langue courante + expose t(key)
class I18n extends InheritedWidget {
  final ValueNotifier<AppLang> lang;
  final Map<String, Map<AppLang, String>> _strings;

  I18n({
    super.key,
    required Widget child,
    required AppLang initial,
  })  : lang = ValueNotifier<AppLang>(initial),
        _strings = _kStrings,
        super(child: child);

  static I18n of(BuildContext context) {
    final i = context.dependOnInheritedWidgetOfExactType<I18n>();
    assert(i != null, 'I18n not found. Wrap your app with I18n.');
    return i!;
  }

  static AppLang autoDetect() {
    // 1) préférence utilisateur
    final stored = html.window.localStorage['lang'];
    if (stored == 'fr') return AppLang.fr;
    if (stored == 'en') return AppLang.en;

    // 2) navigateur
    final nav = html.window.navigator.language.toLowerCase();
    if (nav.startsWith('fr')) return AppLang.fr;

    // 3) locale device (fallback)
    final device = ui.PlatformDispatcher.instance.locale.languageCode.toLowerCase();
    if (device.startsWith('fr')) return AppLang.fr;

    return AppLang.en;
  }

  String t(String key) {
    final m = _strings[key];
    if (m == null) return key;
    return m[lang.value] ?? m[AppLang.en] ?? key;
  }

  void setLang(AppLang l) {
    lang.value = l;
    html.window.localStorage['lang'] = l == AppLang.fr ? 'fr' : 'en';
  }

  @override
  bool updateShouldNotify(I18n oldWidget) => lang != oldWidget.lang;
}

extension I18nExt on BuildContext {
  String tr(String key) => I18n.of(this).t(key);
  ValueNotifier<AppLang> get langNotifier => I18n.of(this).lang;
  void setLang(AppLang l) => I18n.of(this).setLang(l);
}

// ====== Chaînes ======
const Map<String, Map<AppLang, String>> _kStrings = {
  // AppBar
  'app.title': {
    AppLang.en: 'Puzzix',
    AppLang.fr: 'Puzzix',
  },
  'nav.privacy': {
    AppLang.en: 'Privacy',
    AppLang.fr: 'Confidentialité',
  },
  'nav.terms': {
    AppLang.en: 'Terms',
    AppLang.fr: 'Conditions',
  },
  'nav.legal': {
    AppLang.en: 'Legal',
    AppLang.fr: 'Mentions légales',
  },
  'nav.delete': {
    AppLang.en: 'Data Deletion Policy',
    AppLang.fr: 'Suppression des données',
  },

  // Hero
  'hero.title': {
    AppLang.en: 'Puzzix',
    AppLang.fr: 'Puzzix',
  },
  'hero.subtitle': {
    AppLang.en: 'A soothing sliding-puzzle with 1000 levels and daily reminders.',
    AppLang.fr: 'Un taquin relaxant avec 1000 niveaux et des rappels quotidiens.',
  },

  // CTA
  'cta.headline': {
    AppLang.en: 'Play. Relax. Repeat.',
    AppLang.fr: 'Joue. Respire. Recommence.',
  },
  'cta.text': {
    AppLang.en:
    'A clean, satisfying sliding puzzle with 1000 handcrafted levels, daily streaks and notifications.',
    AppLang.fr:
    'Un taquin fluide et satisfaisant avec 1000 niveaux faits main, séries quotidiennes et rappels.',
  },
  'cta.play': {
    AppLang.en: 'Get it on Google Play',
    AppLang.fr: 'Disponible sur Google Play',
  },
  'cta.appstore': {
    AppLang.en: 'Download on the App Store',
    AppLang.fr: 'Télécharger sur l’App Store',
  },

  // Features
  'feat.1.title': { AppLang.en: '1000 Levels', AppLang.fr: '1000 niveaux' },
  'feat.1.text': {
    AppLang.en: 'Gradually increasing grids, handcrafted pacing.',
    AppLang.fr: 'Grilles progressives et rythme soigné.',
  },
  'feat.2.title': { AppLang.en: 'Gentle Reminders', AppLang.fr: 'Rappels discrets' },
  'feat.2.text': {
    AppLang.en: 'Keep your daily streak with optional notifications.',
    AppLang.fr: 'Conserve ta série avec des notifications facultatives.',
  },
  'feat.3.title': { AppLang.en: 'Snappy & Smooth', AppLang.fr: 'Rapide et fluide' },
  'feat.3.text': {
    AppLang.en: 'Fast animations and a crisp feel.',
    AppLang.fr: 'Animations rapides et expérience nette.',
  },

  // Footer
  'footer.copyright': {
    AppLang.en: '© {y} MAHUGNON SERVICES LTD',
    AppLang.fr: '© {y} MAHUGNON SERVICES LTD',
  },

  // -------- Privacy (résumé existant) --------
  'privacy.title': {
    AppLang.en: 'Privacy Policy',
    AppLang.fr: 'Politique de confidentialité',
  },
  'privacy.body': {
    AppLang.en:
    'We collect anonymous identifiers, level progress and push tokens to operate the app, send reminders and improve features. We do not sell personal data.',
    AppLang.fr:
    'Nous collectons des identifiants anonymes, la progression des niveaux et les tokens push pour faire fonctionner l’app, envoyer des rappels et améliorer les fonctionnalités. Nous ne vendons pas de données personnelles.',
  },
  'privacy.contact': {
    AppLang.en: 'Contact: support@[your-domain].com',
    AppLang.fr: 'Contact : support@[votre-domaine].com',
  },

  // -------- Legal (résumé existant) --------
  'legal.title': {
    AppLang.en: 'Legal Notice',
    AppLang.fr: 'Mentions légales',
  },
  'legal.body': {
    AppLang.en:
    'Publisher: MAHUGNON SERVICES LTD (UK). Hosting: Google Play / App Store. Backend: Supabase, Firebase. All content protected. Governing law: England & Wales.',
    AppLang.fr:
    'Éditeur : MAHUGNON SERVICES LTD (UK). Hébergement : Google Play / App Store. Backend : Supabase, Firebase. Contenus protégés. Droit applicable : Angleterre & Pays de Galles.',
  },

  // ===================== Privacy – version détaillée =====================
  'privacy.appbar': {
    AppLang.fr: '🔒 Politique de confidentialité',
    AppLang.en: '🔒 Privacy Policy',
  },
  'privacy.heading': {
    AppLang.fr: 'Puzzix – Politique de confidentialité',
    AppLang.en: 'Puzzix – Privacy Policy',
  },
  'privacy.updated': {
    AppLang.fr: 'Dernière mise à jour : 26 septembre 2025',
    AppLang.en: 'Last updated: September 26, 2025',
  },
  'privacy.intro': {
    AppLang.fr:
    'La présente politique explique comment MAHUGNON SERVICES LTD (« nous », « notre ») traite vos données lors de l’utilisation de l’application mobile Puzzix.',
    AppLang.en:
    'This policy explains how MAHUGNON SERVICES LTD (“we”, “our”) processes your data when you use the Puzzix mobile application.',
  },

  'privacy.controller_title': {
    AppLang.fr: '1. Responsable du traitement',
    AppLang.en: '1. Data Controller',
  },
  'privacy.controller_body': {
    AppLang.fr:
    'MAHUGNON SERVICES LTD\nCompany Number : 16010860\nAdresse : 20 Wenlock Road, London, N1 7GU, Royaume-Uni\nEmail : support@puzzixapp.com',
    AppLang.en:
    'MAHUGNON SERVICES LTD\nCompany Number: 16010860\nAddress: 20 Wenlock Road, London, N1 7GU, United Kingdom\nEmail: support@puzzixapp.com',
  },

  'privacy.data_title': { AppLang.fr: '2. Données que nous traitons', AppLang.en: '2. Data We Process' },
  'privacy.data_needed_title': {
    AppLang.fr: 'Données techniques et d’usage (nécessaires au fonctionnement) :',
    AppLang.en: 'Technical and usage data (required for operation):',
  },
  'privacy.data_needed_1': {
    AppLang.fr: 'Identifiant anonyme local (généré sur l’appareil).',
    AppLang.en: 'Anonymous local identifier (generated on the device).',
  },
  'privacy.data_needed_2': {
    AppLang.fr: 'Progression dans les niveaux (niveaux terminés, temps, mouvements).',
    AppLang.en: 'Level progression (completed levels, time, moves).',
  },
  'privacy.data_needed_3': {
    AppLang.fr: 'Horodatages d’activité (ouverture/jeu) pour relances d’inactivité.',
    AppLang.en: 'Activity timestamps (open/play) to support inactivity reminders.',
  },
  'privacy.data_needed_4': {
    AppLang.fr: 'Token de notifications push (Android/iOS) si vous l’autorisez.',
    AppLang.en: 'Push notification token (Android/iOS) if you allow it.',
  },
  'privacy.data_needed_5': {
    AppLang.fr: 'Données techniques d’appareil/OS (journalisation limitée).',
    AppLang.en: 'Device/OS technical data (limited logging).',
  },
  'privacy.data_not_title': {
    AppLang.fr: 'Ce que nous NE collectons pas :',
    AppLang.en: 'What we do NOT collect:',
  },
  'privacy.data_not_1': {
    AppLang.fr: 'Aucune donnée nominative (nom, email, téléphone) via l’app.',
    AppLang.en: 'No personally identifying data (name, email, phone) via the app.',
  },
  'privacy.data_not_2': {
    AppLang.fr: 'Aucune donnée de localisation fine.',
    AppLang.en: 'No precise location data.',
  },
  'privacy.data_not_3': {
    AppLang.fr: 'Aucun suivi publicitaire tiers dans l’app.',
    AppLang.en: 'No third-party advertising tracking within the app.',
  },

  'privacy.purposes_title': {
    AppLang.fr: '3. Finalités & bases légales',
    AppLang.en: '3. Purposes & Legal Bases',
  },
  'privacy.purpose_1': {
    AppLang.fr: 'Fournir les fonctionnalités du jeu (exécution du contrat d’utilisation).',
    AppLang.en: 'Provide game features (performance of the user agreement).',
  },
  'privacy.purpose_2': {
    AppLang.fr: 'Sauvegarder votre progression (intérêt légitime / exécution).',
    AppLang.en: 'Save your progression (legitimate interest / performance).',
  },
  'privacy.purpose_3': {
    AppLang.fr: 'Envoyer des notifications de rappel (consentement).',
    AppLang.en: 'Send reminder notifications (consent).',
  },
  'privacy.purpose_4': {
    AppLang.fr: 'Mesurer l’usage de façon agrégée pour améliorer l’app (intérêt légitime).',
    AppLang.en: 'Measure usage in aggregate to improve the app (legitimate interest).',
  },
  'privacy.purpose_5': {
    AppLang.fr: 'Sécurité, prévention de la fraude et journalisation minimale (intérêt légitime).',
    AppLang.en: 'Security, fraud prevention and minimal logging (legitimate interest).',
  },

  'privacy.cookies_title': { AppLang.fr: '4. Cookies & traçeurs', AppLang.en: '4. Cookies & Trackers' },
  'privacy.cookies_body': {
    AppLang.fr:
    'Puzzix n’utilise pas de cookies dans l’application mobile. Des services tiers (ex. Firebase Cloud Messaging) utilisent leurs propres identifiants techniques pour délivrer les notifications.',
    AppLang.en:
    'Puzzix does not use cookies within the mobile app. Third-party services (e.g., Firebase Cloud Messaging) use their own technical identifiers to deliver notifications.',
  },

  'privacy.shared_title': { AppLang.fr: '5. Partage avec des tiers', AppLang.en: '5. Sharing with Third Parties' },
  'privacy.shared_intro': {
    AppLang.fr:
    'Nous utilisons des sous-traitants techniques pour héberger et acheminer les données strictement nécessaires :',
    AppLang.en: 'We use technical processors to host and route strictly necessary data:',
  },
  'privacy.shared_1': {
    AppLang.fr: 'Supabase (hébergement des données de progression et fonctions Edge).',
    AppLang.en: 'Supabase (hosting progression data and Edge functions).',
  },
  'privacy.shared_2': {
    AppLang.fr: 'Firebase Cloud Messaging (envoi des notifications).',
    AppLang.en: 'Firebase Cloud Messaging (sending notifications).',
  },
  'privacy.shared_3': {
    AppLang.fr: 'Google Apps Script (réception d’événements techniques et envoi d’emails internes).',
    AppLang.en: 'Google Apps Script (receiving technical events and sending internal emails).',
  },
  'privacy.shared_note': {
    AppLang.fr:
    'Ces prestataires agissent conformément à nos instructions et aux lois applicables. Aucune vente de données n’est effectuée.',
    AppLang.en: 'These providers act under our instructions and applicable laws. We do not sell data.',
  },

  'privacy.retention_title': { AppLang.fr: '6. Durées de conservation', AppLang.en: '6. Retention Periods' },
  'privacy.retention_1': {
    AppLang.fr:
    'Progression & activité : conservées tant que l’app est utilisée (nettoyage des inactifs au-delà d’une période raisonnable).',
    AppLang.en:
    'Progression & activity: kept while the app is used (inactive accounts are pruned after a reasonable period).',
  },
  'privacy.retention_2': {
    AppLang.fr: 'Tokens de notification : supprimés/rotations automatiques et à la désinstallation.',
    AppLang.en: 'Notification tokens: automatically rotated/removed and deleted on uninstallation.',
  },
  'privacy.retention_3': {
    AppLang.fr: 'Journaux techniques : rétention courte, uniquement pour diagnostic.',
    AppLang.en: 'Technical logs: short retention, for diagnostics only.',
  },

  'privacy.transfers_title': {
    AppLang.fr: '7. Transferts hors Royaume-Uni / UE',
    AppLang.en: '7. Transfers outside the UK / EU',
  },
  'privacy.transfers_body': {
    AppLang.fr:
    'Certains prestataires peuvent opérer hors du Royaume-Uni/UE. Nous mettons en place des garanties appropriées (clauses contractuelles types, mesures techniques et organisationnelles).',
    AppLang.en:
    'Some providers may operate outside the UK/EU. We implement appropriate safeguards (standard contractual clauses, technical and organizational measures).',
  },

  'privacy.rights_title': { AppLang.fr: '8. Vos droits', AppLang.en: '8. Your Rights' },
  'privacy.rights_body': {
    AppLang.fr:
    'Conformément au UK GDPR/PECR, vous disposez de droits d’accès, de rectification, d’effacement, de limitation, d’opposition, et de portabilité lorsque applicable. Vous pouvez retirer votre consentement aux notifications depuis les réglages de l’appareil.',
    AppLang.en:
    'Under the UK GDPR/PECR, you have rights of access, rectification, erasure, restriction, objection, and portability where applicable. You can withdraw consent to notifications in your device settings.',
  },
  'privacy.contact_line': {
    AppLang.fr:
    'Pour exercer vos droits : support@puzzixapp.com. Autorité de contrôle (UK) : Information Commissioner’s Office (ICO).',
    AppLang.en:
    'To exercise your rights: support@puzzixapp.com. Supervisory authority (UK): Information Commissioner’s Office (ICO).',
  },

  'privacy.security_title': { AppLang.fr: '9. Sécurité', AppLang.en: '9. Security' },
  'privacy.security_body': {
    AppLang.fr:
    'Nous appliquons des mesures raisonnables (chiffrement en transit, contrôle d’accès, clés côté serveur). Aucun système n’est totalement invulnérable.',
    AppLang.en:
    'We apply reasonable measures (encryption in transit, access control, server-side keys). No system is completely invulnerable.',
  },

  'privacy.minors_title': { AppLang.fr: '10. Mineurs', AppLang.en: '10. Minors' },
  'privacy.minors_body': {
    AppLang.fr:
    'Puzzix est destiné à un large public familial. Les données traitées sont techniques et non nominatives. Les parents/tuteurs peuvent désactiver les notifications sur l’appareil.',
    AppLang.en:
    'Puzzix is intended for a broad family audience. Data processed is technical and non-identifying. Parents/guardians can disable notifications on the device.',
  },

  'privacy.changes_title': { AppLang.fr: '11. Modifications', AppLang.en: '11. Changes' },
  'privacy.changes_body': {
    AppLang.fr:
    'Nous pouvons mettre à jour cette politique. La nouvelle version remplacera la précédente et sera publiée dans l’app.',
    AppLang.en:
    'We may update this policy. The new version will replace the previous one and be published in the app.',
  },

  'privacy.contact_title': { AppLang.fr: '12. Contact', AppLang.en: '12. Contact' },
  'privacy.contact_block': {
    AppLang.fr:
    'MAHUGNON SERVICES LTD\nAdresse : 20 Wenlock Road, London, N1 7GU, Royaume-Uni\nEmail : support@puzzixapp.com',
    AppLang.en:
    'MAHUGNON SERVICES LTD\nAddress: 20 Wenlock Road, London, N1 7GU, United Kingdom\nEmail: support@puzzixapp.com',
  },

  // ===================== Terms =====================
  'terms.appbar': {
    AppLang.fr: '📄 Conditions d’utilisation',
    AppLang.en: '📄 Terms of Use',
  },
  'terms.heading': {
    AppLang.fr: 'Puzzix – Conditions Générales d’Utilisation',
    AppLang.en: 'Puzzix – Terms of Use',
  },
  'terms.updated': {
    AppLang.fr: 'Dernière mise à jour : 26 septembre 2025',
    AppLang.en: 'Last updated: September 26, 2025',
  },

  'terms.s1_title': { AppLang.fr: '1. Éditeur', AppLang.en: '1. Publisher' },
  'terms.s1_body': {
    AppLang.fr:
    'Application éditée par MAHUGNON SERVICES LTD (Company Number : 16010860) – 20 Wenlock Road, London, N1 7GU, Royaume-Uni – Contact : support@puzzixapp.com.',
    AppLang.en:
    'App published by MAHUGNON SERVICES LTD (Company Number: 16010860) – 20 Wenlock Road, London, N1 7GU, United Kingdom – Contact: support@puzzixapp.com.',
  },

  'terms.s2_title': { AppLang.fr: '2. Objet', AppLang.en: '2. Purpose' },
  'terms.s2_body': {
    AppLang.fr:
    'Les présentes CGU encadrent l’utilisation de l’application mobile Puzzix. En installant et utilisant l’App, vous acceptez ces conditions sans réserve.',
    AppLang.en:
    'These Terms govern the use of the Puzzix mobile application. By installing and using the App, you agree to these Terms without reservation.',
  },

  'terms.s3_title': { AppLang.fr: '3. Accès & disponibilité', AppLang.en: '3. Access & Availability' },
  'terms.s3_1': {
    AppLang.fr: 'App disponible gratuitement sur App Store et Google Play.',
    AppLang.en: 'The App is available for free on the App Store and Google Play.',
  },
  'terms.s3_2': {
    AppLang.fr: 'Connexion Internet requise pour certaines fonctionnalités.',
    AppLang.en: 'Internet connection is required for certain features.',
  },
  'terms.s3_3': {
    AppLang.fr: 'Nous pouvons modifier, suspendre ou interrompre l’App sans préavis.',
    AppLang.en: 'We may modify, suspend, or discontinue the App without prior notice.',
  },

  'terms.s4_title': { AppLang.fr: '4. Compte & identité', AppLang.en: '4. Account & Identity' },
  'terms.s4_1': {
    AppLang.fr: 'Aucun compte nominatif requis : un identifiant anonyme est généré localement.',
    AppLang.en: 'No named account is required: an anonymous identifier is generated locally.',
  },
  'terms.s4_2': {
    AppLang.fr: 'Vous êtes responsable de l’usage de l’App sur votre appareil.',
    AppLang.en: 'You are responsible for use of the App on your device.',
  },

  'terms.s5_title': { AppLang.fr: '5. Fonctionnalités', AppLang.en: '5. Features' },
  'terms.s5_1': {
    AppLang.fr:
    'Jeu de puzzle avec progression (niveaux, grilles, meilleurs temps/mouvements).',
    AppLang.en:
    'Puzzle gameplay with progression (levels, grids, best time/moves).',
  },
  'terms.s5_2': {
    AppLang.fr: 'Notifications push facultatives (rappels d’inactivité).',
    AppLang.en: 'Optional push notifications (inactivity reminders).',
  },
  'terms.s5_3': {
    AppLang.fr: 'Sauvegarde locale et synchronisation technique via nos services.',
    AppLang.en: 'Local save and technical sync via our services.',
  },

  'terms.s6_title': { AppLang.fr: '6. Propriété intellectuelle', AppLang.en: '6. Intellectual Property' },
  'terms.s6_1': {
    AppLang.fr: 'L’App, son code, ses visuels et contenus sont protégés.',
    AppLang.en: 'The App, its code, visuals and content are protected.',
  },
  'terms.s6_2': {
    AppLang.fr: 'Toute reproduction, modification ou diffusion non autorisée est interdite.',
    AppLang.en: 'Any unauthorised reproduction, modification or distribution is prohibited.',
  },

  'terms.s7_title': { AppLang.fr: '7. Comportements interdits', AppLang.en: '7. Prohibited Conduct' },
  'terms.s7_1': {
    AppLang.fr: 'Reverse engineering, contournement des mécanismes techniques.',
    AppLang.en: 'Reverse engineering or circumventing technical safeguards.',
  },
  'terms.s7_2': {
    AppLang.fr: 'Usage frauduleux, commercial ou publicitaire non autorisé.',
    AppLang.en: 'Fraudulent, commercial, or advertising use without authorisation.',
  },
  'terms.s7_3': {
    AppLang.fr:
    'Toute action portant atteinte à la sécurité, disponibilité ou intégrité des services.',
    AppLang.en:
    'Any action harming the security, availability or integrity of the services.',
  },

  'terms.s8_title': { AppLang.fr: '8. Services tiers', AppLang.en: '8. Third-Party Services' },
  'terms.s8_body': {
    AppLang.fr:
    'L’App s’appuie sur des services techniques : Supabase, Firebase Cloud Messaging, Google Apps Script. Leur fonctionnement peut impacter la disponibilité globale.',
    AppLang.en:
    'The App relies on technical services: Supabase, Firebase Cloud Messaging, Google Apps Script. Their operation may affect overall availability.',
  },

  'terms.s9_title': { AppLang.fr: '9. Responsabilité', AppLang.en: '9. Liability' },
  'terms.s9_1': {
    AppLang.fr: 'L’App est fournie « en l’état » sans garantie d’absence d’erreurs.',
    AppLang.en: 'The App is provided “as is” without a warranty of error-free operation.',
  },
  'terms.s9_2': {
    AppLang.fr: 'Nous ne saurions être responsables des dommages indirects ou pertes de données.',
    AppLang.en: 'We are not liable for indirect damages or data loss.',
  },
  'terms.s9_3': {
    AppLang.fr: 'Vous devez conserver vos appareils à jour et sécurisés.',
    AppLang.en: 'You must keep your devices up to date and secured.',
  },

  'terms.s10_title': { AppLang.fr: '10. Données personnelles', AppLang.en: '10. Personal Data' },
  'terms.s10_body': {
    AppLang.fr:
    'Le traitement des données est décrit dans la Politique de confidentialité disponible dans l’App. Merci de la consulter.',
    AppLang.en:
    'Data processing is described in the Privacy Policy available in the App. Please review it.',
  },

  'terms.s11_title': { AppLang.fr: '11. Notifications', AppLang.en: '11. Notifications' },
  'terms.s11_1': {
    AppLang.fr: 'Le consentement est requis sur l’appareil (Android 13+/iOS).',
    AppLang.en: 'Consent is required at the device level (Android 13+/iOS).',
  },
  'terms.s11_2': {
    AppLang.fr: 'Vous pouvez désactiver les notifications dans les réglages système.',
    AppLang.en: 'You can disable notifications in the system settings.',
  },

  'terms.s12_title': { AppLang.fr: '12. Résiliation', AppLang.en: '12. Termination' },
  'terms.s12_1': {
    AppLang.fr: 'Vous pouvez désinstaller l’App à tout moment.',
    AppLang.en: 'You may uninstall the App at any time.',
  },
  'terms.s12_2': {
    AppLang.fr: 'Nous pouvons suspendre/mettre fin à l’accès en cas de violation des CGU.',
    AppLang.en: 'We may suspend/terminate access in case of breach of these Terms.',
  },

  'terms.s13_title': { AppLang.fr: '13. Modifications', AppLang.en: '13. Changes' },
  'terms.s13_body': {
    AppLang.fr:
    'Nous pouvons mettre à jour ces CGU. La version applicable est celle publiée dans l’App à la date d’utilisation.',
    AppLang.en:
    'We may update these Terms. The applicable version is the one published in the App at the time of use.',
  },

  'terms.s14_title': { AppLang.fr: '14. Droit applicable & juridiction', AppLang.en: '14. Governing Law & Jurisdiction' },
  'terms.s14_body': {
    AppLang.fr:
    'Les CGU sont régies par le droit anglais. Tout litige relève des juridictions compétentes d’Angleterre et du Pays de Galles.',
    AppLang.en:
    'These Terms are governed by English law. Any dispute falls under the competent courts of England and Wales.',
  },

  'terms.s15_title': { AppLang.fr: '15. Contact', AppLang.en: '15. Contact' },
  'terms.s15_body': {
    AppLang.fr:
    'MAHUGNON SERVICES LTD – 20 Wenlock Road, London, N1 7GU, Royaume-Uni\nEmail : support@puzzixapp.com',
    AppLang.en:
    'MAHUGNON SERVICES LTD – 20 Wenlock Road, London, N1 7GU, United Kingdom\nEmail: support@puzzixapp.com',
  },

  // ===================== Legal (détaillé) =====================
  'legal.appbar': {
    AppLang.fr: '📑 Mentions légales',
    AppLang.en: '📑 Legal Notice',
  },
  'legal.heading': {
    AppLang.fr: 'Mentions légales – Application Puzzix',
    AppLang.en: 'Legal Notice – Puzzix App',
  },

  'legal.publisher_title': { AppLang.fr: 'Éditeur de l’application', AppLang.en: 'Publisher' },
  'legal.publisher_body': {
    AppLang.fr:
    'MAHUGNON SERVICES LTD\nSociété enregistrée au Royaume-Uni\nNuméro d’enregistrement : 16010860\nSiège social : 20 Wenlock Road, London, N1 7GU, Royaume-Uni\nEmail de contact : support@puzzixapp.com\nTéléphone : +44 7492 804164',
    AppLang.en:
    'MAHUGNON SERVICES LTD\nCompany registered in the United Kingdom\nCompany Number: 16010860\nRegistered office: 20 Wenlock Road, London, N1 7GU, United Kingdom\nContact email: support@puzzixapp.com\nPhone: +44 7492 804164',
  },

  'legal.director_title': {
    AppLang.fr: 'Directeur de la publication',
    AppLang.en: 'Publication Director',
  },
  'legal.director_body': {
    AppLang.fr:
    'M. Mahugnon Elie SOGLO, en qualité de représentant légal de MAHUGNON SERVICES LTD.',
    AppLang.en:
    'Mr. Mahugnon Elie SOGLO, acting as the legal representative of MAHUGNON SERVICES LTD.',
  },

  'legal.hosting_title': { AppLang.fr: 'Hébergement', AppLang.en: 'Hosting' },
  'legal.hosting_body': {
    AppLang.fr:
    'L’application Puzzix est hébergée et distribuée via :\n • Google Play Store (Google LLC – 1600 Amphitheatre Parkway, Mountain View, CA 94043, États-Unis)\n • App Store (Apple Inc. – One Apple Park Way, Cupertino, CA 95014, États-Unis)\n\nLes services backend et la base de données sont fournis par :\n • Supabase (Supabase, Inc. – 970 Toa Payoh North, #07-04, Singapore)\n • Google Firebase (Google LLC – 1600 Amphitheatre Parkway, Mountain View, CA 94043, États-Unis)',
    AppLang.en:
    'The Puzzix application is hosted and distributed via:\n • Google Play Store (Google LLC – 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA)\n • App Store (Apple Inc. – One Apple Park Way, Cupertino, CA 95014, USA)\n\nBackend services and database are provided by:\n • Supabase (Supabase, Inc. – 970 Toa Payoh North, #07-04, Singapore)\n • Google Firebase (Google LLC – 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA)',
  },

  'legal.ip_title': { AppLang.fr: 'Propriété intellectuelle', AppLang.en: 'Intellectual Property' },
  'legal.ip_body': {
    AppLang.fr:
    'L’ensemble des éléments de l’application Puzzix (contenus, textes, images, graphismes, logos, bases de données, sons) est protégé par les lois en vigueur sur la propriété intellectuelle.\n\nToute reproduction, représentation, modification, publication, adaptation de tout ou partie des éléments de l’application, quel que soit le moyen ou le procédé utilisé, est interdite, sauf autorisation écrite préalable de MAHUGNON SERVICES LTD.',
    AppLang.en:
    'All elements of the Puzzix application (content, text, images, graphics, logos, databases, sounds) are protected by applicable intellectual property laws.\n\nAny reproduction, representation, modification, publication or adaptation of all or part of the application content, regardless of the means or process used, is prohibited without prior written authorisation from MAHUGNON SERVICES LTD.',
  },

  'legal.liability_title': { AppLang.fr: 'Responsabilité', AppLang.en: 'Liability' },
  'legal.liability_body': {
    AppLang.fr:
    'MAHUGNON SERVICES LTD s’efforce de fournir une information fiable et mise à jour dans l’application Puzzix. Toutefois, des erreurs ou omissions peuvent survenir.\n\nL’utilisateur reconnaît utiliser l’application sous sa propre responsabilité. MAHUGNON SERVICES LTD ne saurait être tenue responsable d’éventuels dommages directs ou indirects résultant de l’utilisation de l’application.',
    AppLang.en:
    'MAHUGNON SERVICES LTD strives to provide reliable and up-to-date information within the Puzzix application. However, errors or omissions may occur.\n\nThe user acknowledges using the application at their own risk. MAHUGNON SERVICES LTD shall not be liable for any direct or indirect damages resulting from the use of the application.',
  },

  'legal.data_title': { AppLang.fr: 'Données personnelles', AppLang.en: 'Personal Data' },
  'legal.data_body': {
    AppLang.fr:
    'L’application Puzzix collecte certaines données (identifiant anonyme, progression des niveaux, notifications push) uniquement pour le bon fonctionnement de ses services et à des fins statistiques.\n\nCes données sont traitées conformément au RGPD (UE 2016/679) et au UK GDPR. Pour toute demande relative à vos données : support@puzzixapp.com.',
    AppLang.en:
    'The Puzzix application collects certain data (anonymous identifier, level progression, push notifications) only for the proper functioning of its services and for statistical purposes.\n\nThis data is processed in accordance with the GDPR (EU 2016/679) and the UK GDPR. For any request regarding your data: support@puzzixapp.com.',
  },

  'legal.law_title': { AppLang.fr: 'Droit applicable', AppLang.en: 'Governing Law' },
  'legal.law_body': {
    AppLang.fr:
    'Les présentes mentions légales sont soumises au droit anglais. Tout litige sera de la compétence exclusive des tribunaux du Royaume-Uni.',
    AppLang.en:
    'This legal notice is governed by English law. Any dispute shall fall under the exclusive jurisdiction of the courts of the United Kingdom.',
  },

  // ===== Data Deletion Policy =====
  'delpol.appbar': {
    AppLang.fr: '🗑️ Politique de suppression des données',
    AppLang.en: '🗑️ Data Deletion Policy',
  },
  'delpol.heading': {
    AppLang.fr: 'Politique de suppression des données — Puzzix',
    AppLang.en: 'Data Deletion Policy — Puzzix',
  },
  'delpol.updated': {
    AppLang.fr: 'Dernière mise à jour : 28 septembre 2025',
    AppLang.en: 'Last updated: September 28, 2025',
  },
  'delpol.intro': {
    AppLang.fr:
    'Chez MAHUGNON SERVICES LTD, nous respectons vos droits relatifs à vos données personnelles et appliquons une politique claire de suppression.',
    AppLang.en:
    'At MAHUGNON SERVICES LTD, we respect your data rights and apply a clear and transparent deletion policy.',
  },

  // 1. Données concernées
  'delpol.s1_title': { AppLang.fr: '1. Données concernées', AppLang.en: '1. Data Covered' },
  'delpol.s1_1': {
    AppLang.fr: 'Identifiant anonyme généré par l’application.',
    AppLang.en: 'Anonymous identifier generated by the app.',
  },
  'delpol.s1_2': {
    AppLang.fr: 'Progression des niveaux et statistiques de jeu.',
    AppLang.en: 'Level progression and gameplay statistics.',
  },
  'delpol.s1_3': {
    AppLang.fr: 'Token de notifications push.',
    AppLang.en: 'Push notification token.',
  },
  'delpol.s1_4': {
    AppLang.fr: 'Historique technique minimal lié à la session de jeu.',
    AppLang.en: 'Minimal technical history related to gameplay sessions.',
  },

  // 2. Procédure
  'delpol.s2_title': { AppLang.fr: '2. Procédure de demande', AppLang.en: '2. Request Procedure' },
  'delpol.s2_1': {
    AppLang.fr: 'Envoyez un e-mail à support@puzzixapp.com avec pour objet « Suppression de compte ».',
    AppLang.en: 'Send an email to support@puzzixapp.com with the subject “Account Deletion”.',
  },
  'delpol.s2_2': {
    AppLang.fr: 'Indiquez l’adresse e-mail ou l’identifiant associé à votre compte.',
    AppLang.en: 'Include the email address or identifier associated with your account.',
  },
  'delpol.s2_3': {
    AppLang.fr: 'Vous recevrez une confirmation une fois la suppression effectuée.',
    AppLang.en: 'You will receive a confirmation once the deletion is completed.',
  },

  // 3. Délais
  'delpol.s3_title': { AppLang.fr: '3. Délais de suppression', AppLang.en: '3. Deletion Timeframes' },
  'delpol.s3_body': {
    AppLang.fr:
    'Vos données sont supprimées dans un délai maximum de 30 jours à compter de la réception de votre demande.',
    AppLang.en:
    'Your data will be deleted within a maximum of 30 days from receipt of your request.',
  },

  // 4. Données non supprimées immédiatement
  'delpol.s4_title': { AppLang.fr: '4. Données non supprimées immédiatement', AppLang.en: '4. Data Not Deleted Immediately' },
  'delpol.s4_1': {
    AppLang.fr: 'Données de sécurité : conservation pouvant aller jusqu’à 90 jours.',
    AppLang.en: 'Security logs: retained for up to 90 days.',
  },
  'delpol.s4_2': {
    AppLang.fr: 'Obligations légales : conservation plus longue si la loi l’exige.',
    AppLang.en: 'Legal obligations: longer retention if required by law.',
  },

  // 5. Irréversibilité
  'delpol.s5_title': { AppLang.fr: '5. Irréversibilité', AppLang.en: '5. Irreversibility' },
  'delpol.s5_body': {
    AppLang.fr:
    'La suppression est définitive et irréversible. Une fois vos données supprimées, elles ne peuvent pas être restaurées.',
    AppLang.en:
    'Deletion is final and irreversible. Once your data is deleted, it cannot be restored.',
  },

  // 6. Contact
  'delpol.s6_title': { AppLang.fr: '6. Contact', AppLang.en: '6. Contact' },
  'delpol.s6_body': {
    AppLang.fr:
    'Pour toute question : support@puzzixapp.com — MAHUGNON SERVICES LTD, 20 Wenlock Road, London, N1 7GU, Royaume-Uni.',
    AppLang.en:
    'For any questions: support@puzzixapp.com — MAHUGNON SERVICES LTD, 20 Wenlock Road, London, N1 7GU, United Kingdom.',
  },
};
