# Backlog

Unité d'effort : un **créneau**, environ 2 heures.
Un incrément est terminé quand son signal est observé, pas quand le skill est écrit. Sans signal en deux semaines, on simplifie ou on supprime avant d'ajouter autre chose.

## Ordre

| # | Incrément | Effort | Raison |
|---|---|---|---|
| 0 | Socle + `log-du-jour` | 1 créneau | Tout en dépend. Le log produit dès la première semaine la matière des rétros. |
| 1 | `recrutement` | 2 créneaux | Douleur aiguë et périmètre borné. |
| 2 | `engagements` + `tri-du-vendredi` | 2 créneaux | Agit sur le flux entrant. |
| 3 | `retro-hebdo` | 1 créneau | Plus utile une fois le tri et deux semaines de log en place. |
| 4 | `mentor-methode` | 1 créneau, puis au fil de l'eau | Peu cher, peut être avancé à tout moment. |
| 4b | `feedback` | 1 créneau | Avancé : besoin immédiat. Détaché de `mentor-methode` parce qu'il a ses propres modes (simulation, préparation, feedback reçu). |

## Incrément 0 · Socle + log du jour

- [x] `profil.exemple/` : config, rôle, chantiers, arbitrage, voix, exemples.
- [x] Skill `ma-voix`.
- [x] Skill `log-du-jour` + son gabarit de fichier mensuel.
- [x] `scripts/install.ps1` (Windows) et `scripts/install.sh` (macOS, Linux).
- [ ] Tester `install.ps1` sur Windows (seul `install.sh` a été testé).
- [ ] Vérifier sur un vrai poste que le modèle charge et utilise les skills.
- **Signal** : 4 logs par semaine sur deux semaines.

## Incrément 1 · Recrutement

- [ ] Gabarits : `identites.md`, fiche candidat, `pipeline.md`.
- [ ] Skill `recrutement` : créer une fiche, mettre à jour depuis un email collé, préparer un entretien, structurer des notes brutes, lister les relances, rédiger une réponse.
- [ ] Grille d'évaluation par poste, dans le profil.
- [ ] Durée de conservation par défaut, réglable dans `config.md`.
- **Signal** : zéro relance ratée sur deux semaines. Préparation d'entretien en 10 minutes ou moins.

## Incrément 2 · Engagements et tri du vendredi

- [ ] Skill `engagements` : LeadDeck si présent (`tasks.json`, `projects.json`, `stakeholders.json`, mêmes seuils que LeadDeck : 5 jours, 14 jours), sinon liste collée.
- [ ] Skill `tri-du-vendredi` : quatre décisions avec raison, refus et délégations rédigés, gestes à faire dans LeadDeck.
- [ ] Gabarit `tri/AAAA-Wss.md`.
- **Signal** : l'écart prévu / fait se réduit. Au moins un refus ou une délégation explicite par semaine.

## Incrément 3 · Rétro de la semaine

- [ ] Skill `retro-hebdo` : lecture de la semaine, trois questions, rédaction dans `reports/AAAA-Wss.md` en complétant le squelette de LeadDeck s'il existe.
- [ ] Section « Fiertés de la semaine ».
- **Signal** : un rapport par semaine, 15 minutes au plus.

## Incrément 4 · Mentor de méthode

- [ ] Skill `mentor-methode`.
- [ ] Premières fiches de `references/` : délégation en matriciel, make or buy, bases juridiques du management, formules Excel utiles.
- **Signal** : une utilisation par semaine, question réglée sans autre recherche.

## Incrément 4b · Feedback

- [x] Skill `feedback` : modes apprendre, simuler, préparer, reçu, relire.
- [x] Fiches `references/` : cadres, simulation (personas, débrief), préparation, feedback reçu.
- [ ] Tester une simulation sur une vraie situation et régler le ton des personas.
- [ ] Brancher les actions du mode `reçu` sur `engagements` quand il existera.
- **Signal** : une utilisation par semaine ; les feedbacks préparés sont effectivement donnés.

## Après le MVP

Préparation des 1:1 et des ateliers · journal des feedbacks donnés · jalons des chantiers · journal d'accomplissements · rituels de communauté et onboarding · formulaire de recrutement · lecture des emails et de l'agenda si l'environnement l'autorise · bilan trimestriel · veille · quiz.
