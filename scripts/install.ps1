<#
.SYNOPSIS
  Installe le leadership companion pour l'utilisateur courant (Windows).

.DESCRIPTION
  Relie chaque skill dans ~\.agents\skills\ par une jonction (pas besoin de
  droits administrateur), crée le dossier des données et y relie le profil.
  Ne modifie aucun fichier existant ; peut être relancé.

.PARAMETER Profil
  Dossier 'profil' de votre dépôt privé. Sans ce paramètre, le profil
  d'exemple est copié s'il n'y a pas encore de profil.

.EXAMPLE
  .\scripts\install.ps1 -Profil C:\dev\mon-profil\profil
#>
param(
  [string]$Profil = ""
)

$ErrorActionPreference = "Stop"

$Repo = Split-Path -Parent $PSScriptRoot
$HomeDir = if ($env:USERPROFILE) { $env:USERPROFILE } else { $HOME }
$Companion = if ($env:COMPANION_HOME) { $env:COMPANION_HOME } else { Join-Path $HomeDir "Companion" }
$SkillsDir = Join-Path (Join-Path $HomeDir ".agents") "skills"

$dossiers = @(
  $SkillsDir,
  (Join-Path $Companion "log"),
  (Join-Path $Companion "tri"),
  (Join-Path (Join-Path $Companion "recrutement") "candidats"),
  (Join-Path (Join-Path $Companion "recrutement") "cv")
)
foreach ($d in $dossiers) { New-Item -ItemType Directory -Force -Path $d | Out-Null }

# Relie $Source en $Cible. Un lien existant est mis à jour, un vrai dossier
# existant est laissé tel quel.
function Set-Lien([string]$Cible, [string]$Source, [string]$Libelle) {
  if (Test-Path -LiteralPath $Cible) {
    $item = Get-Item -LiteralPath $Cible -Force
    if ($item.LinkType) {
      # Supprime le lien seulement, jamais le dossier qu'il désigne.
      [System.IO.Directory]::Delete($Cible)
      New-Item -ItemType Junction -Path $Cible -Target $Source | Out-Null
      Write-Host "  mis à jour  $Libelle"
    } else {
      Write-Host "  ignoré      $Libelle : $Cible existe déjà et n'est pas un lien"
    }
  } else {
    New-Item -ItemType Junction -Path $Cible -Target $Source | Out-Null
    Write-Host "  relié       $Libelle"
  }
}

Write-Host "Skills -> $SkillsDir"
$skills = Get-ChildItem -Directory -Path (Join-Path (Join-Path $Repo ".agents") "skills")
foreach ($s in $skills) {
  Set-Lien (Join-Path $SkillsDir $s.Name) $s.FullName $s.Name
}

$CibleProfil = Join-Path $Companion "profil"
Write-Host "Profil -> $CibleProfil"
if ($Profil) {
  if (-not (Test-Path -LiteralPath $Profil -PathType Container)) {
    throw "Le dossier du profil n'existe pas : $Profil"
  }
  Set-Lien $CibleProfil (Resolve-Path -LiteralPath $Profil).Path "profil"
} elseif (Test-Path -LiteralPath $CibleProfil) {
  Write-Host "  conservé    profil existant"
} else {
  Copy-Item -Recurse -Path (Join-Path $Repo "profil.exemple") -Destination $CibleProfil
  Write-Host "  copié       profil d'exemple, à remplir"
}

Write-Host "Données -> $Companion"
Write-Host "Terminé. Dans opencode, tapez /log-du-jour en fin de journée."
