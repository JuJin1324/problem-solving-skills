#!/usr/bin/env bash
set -euo pipefail

TARGET_ROOT="${TARGET_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
SOURCE_REPO="${SOURCE_REPO:-$TARGET_ROOT/../problem-solving}"
SOURCE_CODEX="${SOURCE_CODEX:-$HOME/.codex/skills}"
INCLUDE_CODEX_SYSTEM="false"
DRY_RUN="false"

usage() {
  cat <<USAGE
Usage: scripts/sync-skills.sh [options]

Options:
  --source-repo <path>       Source repo path with .claude/skills
  --source-codex <path>      Source codex skills path (default: ~/.codex/skills)
  --target-root <path>       Target repo root (default: script parent)
  --include-codex-system     Include .system codex skills
  --dry-run                  Show actions without copying
  -h, --help                 Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --source-repo)
      SOURCE_REPO="$2"; shift 2 ;;
    --source-codex)
      SOURCE_CODEX="$2"; shift 2 ;;
    --target-root)
      TARGET_ROOT="$2"; shift 2 ;;
    --include-codex-system)
      INCLUDE_CODEX_SYSTEM="true"; shift ;;
    --dry-run)
      DRY_RUN="true"; shift ;;
    -h|--help)
      usage; exit 0 ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1 ;;
  esac
done

CLAUDE_SRC="$SOURCE_REPO/.claude/skills"
CLAUDE_DST="$TARGET_ROOT/.claude/skills"
CODEX_DST="$TARGET_ROOT/.codex/skills"
GEMINI_SKILLS_DST="$TARGET_ROOT/.gemini/skills"
GEMINI_COMMANDS_DST="$TARGET_ROOT/.gemini/commands"

mkdir -p "$CLAUDE_DST" "$CODEX_DST" "$GEMINI_SKILLS_DST" "$GEMINI_COMMANDS_DST"

RSYNC_FLAGS=("-a")
if [[ "$DRY_RUN" == "true" ]]; then
  RSYNC_FLAGS+=("--dry-run" "-v")
fi

echo "[1/4] Sync Claude skills"
if [[ -d "$CLAUDE_SRC" ]]; then
  rsync "${RSYNC_FLAGS[@]}" "$CLAUDE_SRC/" "$CLAUDE_DST/"
else
  echo "  - skipped: not found ($CLAUDE_SRC)"
fi

echo "[2/4] Sync Codex skills"
if [[ -d "$SOURCE_CODEX" ]]; then
  if [[ "$INCLUDE_CODEX_SYSTEM" == "true" ]]; then
    rsync "${RSYNC_FLAGS[@]}" "$SOURCE_CODEX/" "$CODEX_DST/"
  else
    rsync "${RSYNC_FLAGS[@]}" --exclude '.system/' "$SOURCE_CODEX/" "$CODEX_DST/"
  fi
else
  echo "  - skipped: not found ($SOURCE_CODEX)"
fi

echo "[3/4] Sync Gemini skills (mirror Claude skills)"
if [[ -d "$CLAUDE_DST" ]]; then
  rsync "${RSYNC_FLAGS[@]}" "$CLAUDE_DST/" "$GEMINI_SKILLS_DST/"
else
  echo "  - skipped: not found ($CLAUDE_DST)"
fi

echo "[4/4] Generate Gemini commands from Gemini skills"
if [[ "$DRY_RUN" == "true" ]]; then
  echo "  - dry-run: skip file generation"
else
  shopt -s nullglob
  for skill_dir in "$GEMINI_SKILLS_DST"/*; do
    [[ -d "$skill_dir" ]] || continue
    skill_name="$(basename "$skill_dir")"
    skill_file="$skill_dir/SKILL.md"
    [[ -f "$skill_file" ]] || continue

    cat > "$GEMINI_COMMANDS_DST/${skill_name}.toml" <<TOML
description = "Run ${skill_name} workflow"
prompt = """
Follow the skill instructions in \
".gemini/skills/${skill_name}/SKILL.md".

Execute the workflow in order and keep outputs concise.
If required files are missing, create a minimal template and proceed.
"""
TOML
  done
fi

echo "Done"
echo "- Claude skills: $CLAUDE_DST"
echo "- Codex skills:  $CODEX_DST"
echo "- Gemini skills: $GEMINI_SKILLS_DST"
echo "- Gemini cmds:   $GEMINI_COMMANDS_DST"
