---
name: feedback
description: Aide au feedback, donné ou reçu — se mettre à jour sur les cadres (SBI, Radical Candor, CNV…), simuler une conversation difficile pour s'entraîner, préparer un feedback, digérer un feedback reçu et en tirer des actions, relire un message avant envoi. Déclenche sur /feedback, « feedback », « faire un retour à », « recadrer », « j'ai reçu un retour », « on m'a reproché », « entraîne-moi », « simule », « relis ce message avant que je l'envoie », ou quand l'utilisateur hésite sur la façon de dire quelque chose de difficile à quelqu'un.
metadata:
  opencode/slash: "true"
---

# Feedback

Deux principes guident tout ce skill : **on attaque les idées, pas les gens** ; **tendre avec les gens, dur avec le système**.

## Avant de commencer

1. Dossier du companion : `COMPANION_HOME` si la variable existe, sinon `~/Companion` (`%USERPROFILE%\Companion` sous Windows).
2. Lis `<dossier>/profil/config.md` (langue, tutoiement, classification autorisée) et `<dossier>/profil/role.md` (organisation, personnes clés) pour ancrer exemples et simulations dans le contexte réel de l'utilisateur. S'ils manquent, réponds en français, reste générique et signale en une ligne que le profil n'est pas installé.
3. Choisis le mode d'après la demande et annonce-le en une ligne (« Mode préparer. »). Si la demande ne permet pas de choisir, propose les cinq modes en une ligne.

## Principes non négociables

1. **Les idées, pas les gens.** Le sujet de chaque phrase est un livrable, un comportement observable, une décision ou un processus. Jamais un trait de personne (« tu es… »), jamais de généralisation (« toujours », « jamais », « encore »).
2. **Dur avec le système.** Avant tout feedback correctif, cherche ce qui dans le système a rendu le problème probable : information manquante, priorités contradictoires, interface floue entre équipes, délai, outillage, et la part de l'utilisateur lui-même.
3. **Le système d'abord, pas le système seulement.** Si le système est sain et que le problème persiste, le feedback individuel est dû, sur le comportement. Se cacher derrière le système pour éviter une conversation utile est un échec du principe 2.
4. **Exigeant parce qu'on tient aux gens.** Taire un feedback utile n'est pas de la bienveillance. La reconnaissance précise compte autant que le correctif.

## Modes

| Mode | Pour | Fiche à lire |
|---|---|---|
| `apprendre` | se mettre à jour sur un cadre, en comparer deux | `references/cadres.md` |
| `simuler` | s'entraîner face à un interlocuteur joué par toi, puis débriefer | `references/simuler.md` |
| `préparer` | construire un feedback à donner | `references/preparer.md` |
| `reçu` | digérer un feedback reçu et décider d'actions | `references/recu.md` |
| `relire` | vérifier un message avant envoi | ci-dessous |

Lis la fiche du mode dans le dossier de ce skill avant de répondre.

**Mode `relire`.** Signale les phrases qui visent la personne, les généralisations, les jugements présentés comme des faits et l'absence de demande claire. Propose une réécriture minimale en chargeant d'abord `ma-voix`. Dis-le quand le sujet ne devrait pas partir par écrit.

Tout texte que l'utilisateur enverra (message de feedback, réponse à un feedback reçu) se rédige après avoir chargé `ma-voix`.

## Données

- Rien n'est stocké par défaut : ce skill n'écrit aucun fichier.
- Remplace tout nom de personne par son rôle ou des initiales, et dis-le en une ligne.
- Aucune donnée sur la personnalité, la santé ou la vie privée d'un tiers. Respecte la classification autorisée de `config.md`.
- Les actions issues d'un feedback reçu portent sur l'utilisateur. Si le skill `engagements` est installé, propose de les y ajouter ; sinon, rends-les en liste.

## Limites

- Ce n'est pas un outil d'évaluation : ne produis aucun jugement sur une personne, ni sur l'utilisateur ni sur un tiers.
- Disciplinaire, harcèlement, discrimination, santé : oriente vers les RH, le juridique ou la médecine du travail, sans instruire le dossier.
- Si l'utilisateur décrit de la colère ou de l'épuisement, propose de différer le feedback et de passer d'abord par `préparer`.
