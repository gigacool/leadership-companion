#!/usr/bin/env sh
# Installe le leadership companion pour l'utilisateur courant (macOS, Linux).
# Relie chaque skill dans ~/.agents/skills/, crée le dossier des données,
# relie le profil. Ne modifie aucun fichier existant ; peut être relancé.

set -eu

usage() {
  echo "Usage : $0 [--profil <dossier du profil>]"
  echo "  --profil  dossier 'profil' de votre dépôt privé. Sans cette option,"
  echo "            le profil d'exemple est copié s'il n'y a pas encore de profil."
  echo "  Dossier des données : \$COMPANION_HOME, sinon ~/Companion."
}

PROFIL=""
while [ $# -gt 0 ]; do
  case "$1" in
    --profil) [ $# -ge 2 ] || { usage; exit 1; }; PROFIL="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Option inconnue : $1"; usage; exit 1 ;;
  esac
done

REPO="$(cd "$(dirname "$0")/.." && pwd)"
COMPANION="${COMPANION_HOME:-$HOME/Companion}"
SKILLS_DIR="$HOME/.agents/skills"

mkdir -p "$SKILLS_DIR" \
  "$COMPANION/log" "$COMPANION/tri" \
  "$COMPANION/recrutement/candidats" "$COMPANION/recrutement/cv"

# Relie $2 (source) en $1 (cible). Un lien existant est mis à jour,
# un vrai dossier ou fichier existant est laissé tel quel.
relier() {
  cible="$1"; source="$2"; libelle="$3"
  if [ -L "$cible" ]; then
    ln -sfn "$source" "$cible"
    echo "  mis à jour  $libelle"
  elif [ -e "$cible" ]; then
    echo "  ignoré      $libelle : $cible existe déjà et n'est pas un lien"
  else
    ln -s "$source" "$cible"
    echo "  relié       $libelle"
  fi
}

echo "Skills -> $SKILLS_DIR"
for dossier in "$REPO"/.agents/skills/*/; do
  nom="$(basename "$dossier")"
  relier "$SKILLS_DIR/$nom" "${dossier%/}" "$nom"
done

echo "Profil -> $COMPANION/profil"
if [ -n "$PROFIL" ]; then
  [ -d "$PROFIL" ] || { echo "  Le dossier du profil n'existe pas : $PROFIL"; exit 1; }
  relier "$COMPANION/profil" "$(cd "$PROFIL" && pwd)" "profil"
elif [ -e "$COMPANION/profil" ]; then
  echo "  conservé    profil existant"
else
  cp -R "$REPO/profil.exemple" "$COMPANION/profil"
  echo "  copié       profil d'exemple, à remplir"
fi

echo "Données -> $COMPANION"
echo "Terminé. Dans opencode, tapez /log-du-jour en fin de journée."
