# Leadership companion

Des skills pour agent de code qui aident un manager technique à tenir son rôle quand les urgences débordent : un log du jour en moins d'une minute, un tri du vendredi qui aide à dire non, un suivi des engagements, un recrutement où rien ne passe à la trappe, des brouillons rédigés dans sa propre voix, et un mentor de méthode quand on bloque.

Conçu pour [opencode](https://opencode.ai) et des modèles d'entreprise. Fonctionne avec tout outil qui lit le format `SKILL.md`. S'appuie sur [LeadDeck](https://github.com/gigacool/leaddeck-vscode) quand il est installé, et fonctionne sans.

## Installer

1. Clonez ce dépôt.
2. Copiez `profil.exemple/` dans un dépôt privé à vous, et remplissez-le.
3. Lancez le script d'installation en lui donnant le chemin de votre profil.

Windows (PowerShell) :

```powershell
.\scripts\install.ps1 -Profil C:\chemin\vers\mon-profil\profil
```

macOS, Linux :

```sh
./scripts/install.sh --profil ~/chemin/vers/mon-profil/profil
```

Le script relie les skills à `~/.agents/skills/`, crée le dossier des données (`~/Companion`, ou la valeur de `COMPANION_HOME`) et y relie votre profil. Il ne modifie aucun fichier existant et peut être relancé sans risque. Mettre à jour le companion revient à faire un `git pull` : les skills sont des liens vers le dépôt.

Sans `--profil`, le script copie le profil d'exemple dans `~/Companion/profil`. Pour passer ensuite à votre profil privé, supprimez ce dossier copié, puis relancez avec `--profil`.

Dans opencode, tapez ensuite `/log-du-jour` en fin de journée.

## Skills

| Skill | Rôle | État |
|---|---|---|
| `log-du-jour` | énergie, une fierté, le non-fait, en moins d'une minute | disponible |
| `ma-voix` | rédiger comme vous, sans formules creuses | disponible |
| `recrutement` | fiches pseudonymisées, entretiens, relances | à venir |
| `engagements` | ce que je dois, ce qu'on me doit | à venir |
| `tri-du-vendredi` | accepter, déléguer, refuser, planifier | à venir |
| `retro-hebdo` | le rapport de la semaine | à venir |
| `mentor-methode` | le bon cadre de management, appliqué à votre cas | à venir |

## Vos données

Ce dépôt ne contient aucune donnée. Votre profil va dans un dépôt privé. Vos données professionnelles (candidats, notes de 1:1, staffing) restent en local, ou dans un dépôt interne à votre entreprise si ses règles le permettent, jamais sur un service public.

## Documents

- [Vision](docs/vision.md)
- [PRD du MVP](docs/prd.md)
- [Backlog](docs/backlog.md)

## Licence

[MIT](LICENSE) © 2026 Cédric Hartland
