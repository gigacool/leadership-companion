# Consignes pour les agents qui travaillent sur ce dépôt

Ce dépôt contient des skills (format `SKILL.md`) pour un companion de manager technique. Il est public.

## Règles

- **Aucune donnée personnelle ou professionnelle ici.** Ni nom de personne, ni nom d'entreprise, ni détail d'organisation interne, ni exemple tiré d'une vraie situation. Ce qui est propre à un utilisateur va dans son profil privé (`<dossier du companion>/profil/`).
- **Tout ce qui varie d'un utilisateur à l'autre se lit dans le profil**, jamais en dur dans un skill : langue, chemins, classification autorisée, rôle, chantiers, règle d'arbitrage, voix.
- **Langue des skills : français.** La langue des réponses à l'utilisateur vient de `profil/config.md`.
- **Ne jamais écrire dans les fichiers JSON de LeadDeck.** Seul `reports/` peut recevoir du texte.

## Écrire un skill

- Un dossier par skill dans `.agents/skills/<nom>/`, avec un `SKILL.md`.
- `name` : minuscules, chiffres et tirets simples (`^[a-z0-9]+(-[a-z0-9]+)*$`), identique au nom du dossier.
- `description` : moins de 1024 caractères, dit quand déclencher le skill avec les mots que l'utilisateur emploiera.
- `metadata` : `opencode/slash: "true"` pour un skill qu'on lance à la main (`/log-du-jour`) ; `opencode/autoinvoke: "false"` pour un skill qu'on ne doit charger qu'à la demande.
- Chaque skill commence par la section « Avant de commencer » : où trouver le dossier du companion et le profil, quoi faire s'ils manquent.
- Un skill qui rédige un texte que l'utilisateur enverra charge d'abord `ma-voix`.
- Un skill tient en une page. Les fiches longues vont dans `references/`, les gabarits de fichiers dans `templates/`, dans le dossier du skill lui-même : seuls les dossiers de skills sont reliés au poste.

## Tester

Lancer `scripts/install.sh --profil profil.exemple` (ou `install.ps1`) avec `COMPANION_HOME` pointé vers un dossier temporaire, puis vérifier que l'agent liste les skills.
