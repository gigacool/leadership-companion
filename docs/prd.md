# PRD — MVP

Version 0.2 · octobre 2026 · Pourquoi ce projet existe : [vision.md](vision.md).

## 1. Utilisateur

Un manager ou leader technique, seul utilisateur de son companion. Il a un agent de code (opencode) branché sur un modèle qu'il a le droit d'utiliser, et un accès limité aux outils de son entreprise : pas de lecture automatique de sa boîte mail ni de son agenda.

## 2. Contraintes

| Contrainte | Conséquence |
|---|---|
| Fonctionner sur opencode et des modèles d'entreprise | Format standard `SKILL.md`. Rien qui dépende d'un assistant ou d'un modèle particulier. Le modèle doit savoir appeler des outils. |
| Données professionnelles sensibles | Le profil déclare les niveaux de classification autorisés. Le companion n'en accepte pas d'autres. |
| RGPD | Candidats pseudonymisés. Durée de conservation fixée à la création de chaque fiche. |
| Accès aux outils limité | L'utilisateur colle ou résume emails et demandes, le companion structure. |
| Temps de construction rare | Chaque incrément tient en un ou deux créneaux et rend du temps sous deux semaines. |
| Plafond d'entretien | Au plus 10 min/jour au-delà du gain. |

## 3. Architecture

Trois endroits, trois niveaux de confidentialité.

```
leadership-companion/            ce dépôt, public : skills, gabarits, installation
  .agents/skills/<nom>/SKILL.md   + templates/ et references/ propres au skill
  profil.exemple/
  scripts/install.ps1, install.sh

<dépôt privé de l'utilisateur>/  son profil, versionné où il veut
  profil/
    config.md      langue, chemins, classification autorisée, jour du tri
    role.md        rôle, périmètre, organisation
    chantiers.md   chantiers longs en cours
    arbitrage.md   règle quand deux sujets réclament le même créneau
    voix.md        façon d'écrire
    exemples/      vrais messages écrits par l'utilisateur, sans donnée sensible

~/Companion/                     données, jamais dans un dépôt public
  profil/          lien vers le profil privé
  log/AAAA-MM.md
  tri/AAAA-Wss.md
  recrutement/identites.md, candidats/, cv/

~/LeadDeck/                      optionnel, si LeadDeck est installé
  *.json           lus, jamais écrits
  reports/         rapport de la semaine, le companion peut y rédiger
```

### Règles

- **Le dossier des données** est `~/Companion` par défaut, ou la valeur de la variable `COMPANION_HOME`. Le profil est toujours lu dans `<dossier>/profil/`.
- **Les skills sont installés au niveau utilisateur** (`~/.agents/skills/`), pour servir quel que soit le dossier où l'agent est lancé. opencode lit ce dossier, comme `.opencode/skills/` et `.claude/skills/`.
- **Les données ne vont dans aucun dépôt public.** Le profil va dans un dépôt privé ; les données professionnelles restent en local, ou dans un dépôt interne à l'entreprise si ses règles le permettent.
- **LeadDeck est une source optionnelle.** Si son dossier existe, les skills l'utilisent. Sinon, ils travaillent avec ce que l'utilisateur colle.
- **Les agents n'écrivent jamais dans les JSON de LeadDeck.** Sa validation au chargement est stricte : une entrée invalide bloque l'app. Le companion propose les gestes, l'utilisateur les fait dans LeadDeck.
- **`reports/` est le seul point d'écriture dans LeadDeck.** LeadDeck ne surveille pas ce dossier et n'écrase jamais un rapport existant. Son squelette laisse un ` — ` au bout de chaque ligne pour la prose.

## 4. Rédaction

Le companion rédige à la place de l'utilisateur : rapports, refus, relances, réponses aux candidats. Il le fait dans la voix de l'utilisateur, avec le skill `ma-voix`, que chaque skill de rédaction charge.

- Par défaut : phrases courtes, voix active, termes de métier de l'utilisateur, aucune formule creuse ou cryptique.
- Le profil (`voix.md`, `exemples/`) précise et l'emporte sur ces règles par défaut.
- L'utilisateur relit toujours avant d'envoyer ou de figer.

## 5. Fonctionnalités du MVP

Chaque fonctionnalité est un skill, avec un signal qui dira en deux semaines s'il sert.

| Skill | Déclencheur | Ce qu'il fait | Signal |
|---|---|---|---|
| `log-du-jour` | fin de journée | Trois questions en un message (énergie de 1 à 5, une fierté, le non-fait), une ligne dans `log/AAAA-MM.md`. Moins d'une minute, sans commentaire. | 4 logs par semaine |
| `recrutement` | à la demande | Fiche pseudonymisée, identités dans un seul fichier, préparation d'entretien, notes structurées par critère, relances à faire, réponses rédigées. | zéro relance ratée ; préparation en 10 min |
| `engagements` | à la demande, et au début du tri | Ce que je dois (↑) et ce qu'on me doit (↓), échéances proches ou dépassées, relances rédigées. Lit LeadDeck s'il est là. | aucun statut dû découvert en retard |
| `tri-du-vendredi` | une fois par semaine, 20 min | Captures, tâches non engagées, demandes collées : accepter, déléguer, refuser ou planifier, avec une raison qui applique `arbitrage.md`. Refus et délégations rédigés. | l'écart prévu / fait se réduit ; au moins un refus ou une délégation explicite |
| `retro-hebdo` | après le tri | Lit la semaine (LeadDeck, log), pose trois questions, rédige le rapport dans `reports/`, avec une section « Fiertés de la semaine ». | un rapport par semaine en 15 min |
| `mentor-methode` | à la demande | Le cadre de management utile, appliqué à la situation, terminé par une action. Fiches dans `references/`. Renvoie au juridique pour le droit. | une utilisation par semaine, question réglée |
| `ma-voix` | chargé par les autres | Règles de rédaction et exemples du profil. | les brouillons partent avec peu de retouches |

## 6. Hors MVP

Préparation des 1:1 et des ateliers, jalons des chantiers, journal d'accomplissements, rituels de communauté, formulaire de recrutement, lecture des emails et de l'agenda, bilan trimestriel, veille, quiz.

## 7. Questions ouvertes

1. Emplacement exact du dossier des agents personnalisés et syntaxe des permissions par chemin dans opencode : à vérifier sur la version utilisée avant d'écrire un agent dédié. Le MVP n'utilise que des skills.
2. Faut-il un agent principal dédié (permissions restreintes aux dossiers du companion), ou les skills suffisent-ils avec l'agent par défaut ?
