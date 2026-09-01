#!/usr/bin/env bash
# Shared helpers for generating the C# exercise scaffolds.
# Mirrors the DSA/ convention: README.txt, Notes.txt, Program.cs, Solution.cs, Tests.cs

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODE="$ROOT/Code"

# extract_readme <guide.md> <ID>
# Pulls the "### E01.1 — Title" block out of a guide and reformats it as plain
# text suitable for README.txt. Drops the "Before you code" prompt (that lives in
# the guide, not the exam paper) but keeps constraints, target and edge cases.
extract_readme() {
  local guide="$1" id="$2"
  awk -v id="$id" '
    $0 ~ ("^### " id " ") { grab = 1; sub("^### " id " — ", ""); print; print ""; next }
    grab && /^### / { exit }
    grab && /^---$/ { exit }
    grab {
      if ($0 ~ /\*\*Before you code:\*\*/) { skip = 1; next }
      if (skip && $0 ~ /^  /) next
      skip = 0
      if ($0 ~ /\*\(Stub exists/) next
      gsub(/\*\*/, "")
      gsub(/`/, "")
      print
    }
  ' "$guide" | sed 's/[[:space:]]*$//' | cat -s
}

# write_files <book> <slug> <id> <guide> <difficulty> <topic> <time>
# Creates the folder and writes README.txt + Notes.txt.
# Program.cs / Solution.cs / Tests.cs are written by the caller into $DIR.
start_exercise() {
  local book="$1" slug="$2" id="$3" guide="$4" difficulty="$5" topic="$6" time="$7"
  DIR="$CODE/$book/$slug"
  mkdir -p "$DIR"

  {
    extract_readme "$ROOT/$guide" "$id"
    echo
    echo "----"
    echo "Guide: BOOKSHELF/Exercises/$guide  (hints at the bottom of that file)"
  } > "$DIR/README.txt"

  cat > "$DIR/Notes.txt" <<NOTESEOF
Exercise:
$id

Difficulty:
$difficulty

Topic:
$topic

Expected Time:
$time

Attempts:
(record attempt 1, 2, 3 here — what you tried and what was wrong)
NOTESEOF
}

banner() { printf '  %-34s %s\n' "$1" "$2"; }
