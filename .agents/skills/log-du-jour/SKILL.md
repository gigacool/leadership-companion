---
name: log-du-jour
description: Log de fin de journée en moins d'une minute — énergie de 1 à 5, une chose dont l'utilisateur est content, ce qui n'a pas été fait — ajouté au fichier du mois. Déclenche sur /log-du-jour, « log du jour », « log de la journée », « fin de journée », ou quand l'utilisateur donne spontanément son énergie du jour et ce qu'il a fait ou pas fait.
metadata:
  opencode/slash: "true"
---

# Log du jour

Une ligne par jour, en moins d'une minute. Ce log alimente plus tard la rétro de la semaine : l'énergie, les fiertés et l'écart entre ce qui était prévu et ce qui a été fait.

## Avant de commencer

1. Dossier du companion : la variable d'environnement `COMPANION_HOME` si elle existe, sinon `~/Companion` (`%USERPROFILE%\Companion` sous Windows). Vérifie-le avec l'outil shell.
2. Lis `<dossier>/profil/config.md` pour la langue. S'il manque, réponds en français et signale en une ligne que le profil n'est pas installé (`scripts/install`).
3. Date du jour : demande-la au shell (`date +%F`, ou `Get-Date -Format yyyy-MM-dd` sous PowerShell). Ne la devine pas. Si l'utilisateur parle d'un autre jour (« hier », « vendredi »), calcule cette date-là.

## Déroulé

1. **Si le message contient déjà les trois éléments**, passe directement à l'écriture.
2. **Sinon, pose les trois questions dans un seul message**, sans introduction :

   > Énergie de 1 à 5 ? Une chose dont tu es content aujourd'hui ? Ce qui n'a pas été fait ?
   > (en une ligne si tu veux : `3 · relu la spec · budget pas fini`)

   Tutoie ou vouvoie selon `tutoiement par défaut` dans `config.md`.
3. **Accepte la réponse telle qu'elle vient.** « rien », « ? » ou une absence de réponse sont valides : note `—`. Si l'énergie n'est pas un chiffre (« crevé », « bien »), demande le chiffre une seule fois ; sans réponse, note `?`.
4. **Écris la ligne** dans `<dossier>/log/AAAA-MM.md` :

   ```
   - 2026-10-19 · énergie 3/5 · fierté : relu la spec avec l'équipe · non-fait : budget Q1
   ```

   - Si le fichier n'existe pas, crée-le à partir de `templates/log-mois.md` (dans le dossier de ce skill), sinon avec un titre `# Log — <mois en toutes lettres> <année>` suivi d'une ligne vide.
   - Ajoute la ligne à la fin. Garde les mots de l'utilisateur, ne les reformule pas, retire seulement ce qui ferait déborder la ligne (sauts de ligne).
   - S'il existe déjà une ligne pour cette date, demande : « Il y a déjà une ligne pour ce jour. Je la remplace ? » et attends.
5. **Confirme en un mot** : « Noté. »

## Ce que tu ne fais pas

- Pas de conseil, pas d'encouragement, pas de commentaire sur l'énergie ou sur le non-fait, sauf si l'utilisateur le demande.
- Pas de question supplémentaire. Le log doit rester sous une minute.
- Pas de nom de personne ni de détail sensible dans la ligne : si la réponse en contient, remplace le nom par le rôle (« mon N+1 », « un candidat ») et dis-le en une ligne.

## Une seule exception

Si les trois dernières lignes du fichier, en comptant celle du jour, ont toutes une énergie de 2 ou moins, ajoute après « Noté. » une phrase factuelle, une seule fois :

> Troisième jour de suite à 2 ou moins.

Rien de plus. La rétro de la semaine s'en servira.
