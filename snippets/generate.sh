#! /usr/bin/env bash

set -e

readonly ROOT_DIR="$PWD"
readonly REPO_DIR="git-kilavuzu-calisma"
readonly VARIABLES_FILE="$ROOT_DIR/variables.yml"

rm -rf "$REPO_DIR" || true;

mkdir "$REPO_DIR" && cd "$REPO_DIR" && git init;

# This is requires because git omits ref names
# if the output is not going to a terminal
git config log.decorate short

create-inline-snippet() {
    echo "\`$2\`" > "$1"
}

create-snippet() {
    echo "\`\`\`bash $2" > "$1"
}

append-snippet() {
    sed -e "s|buravc|<username>|gI;s|avcii\.brk@gmail\.com|email|gI" >> "$1"
}

finish-snippet() {
    echo "\`\`\`" >> "$1"
}

echo-command-and-result() {
    # set -x
    local cmd="$*"
    echo "$ $cmd"
    eval "$cmd" 2>&1
    # set +x
}

# commit section prefix
PREFIX="$ROOT_DIR/snippets/commit";
rm -rf "$PREFIX" || true;
mkdir -p "$PREFIX"

# Snippet commit-00
CURRENT_SNIPPET_PATH="${PREFIX}/initial-echo.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result echo \"Hello world\" \> test.txt | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"


# Snippet commit-01
CURRENT_SNIPPET_PATH="${PREFIX}/initial-git-status.md"
create-snippet "$CURRENT_SNIPPET_PATH" "hl_lines=\"6-8\""

echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-02
CURRENT_SNIPPET_PATH="${PREFIX}/git-initial-add-status.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git add test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-03
CURRENT_SNIPPET_PATH="${PREFIX}/git-initial-commit.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git commit -m \"Ilk commit\" | append-snippet "$CURRENT_SNIPPET_PATH"
# Calculate Commit hash and update variable
yq -Y -i ".commit.first_commit_hash = \"$(git rev-parse HEAD)\"" "$VARIABLES_FILE"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-04
CURRENT_SNIPPET_PATH="${PREFIX}/git-initial-log.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git log | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-06
CURRENT_SNIPPET_PATH="${PREFIX}/echo-merhaba-dunya-status.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result echo \"Merhaba Dunya\" \>\> test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-07
CURRENT_SNIPPET_PATH="${PREFIX}/second-add-status.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git add test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-08
CURRENT_SNIPPET_PATH="${PREFIX}/second-commit.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git commit -m \"Dosyaya Merhaba Dunya ekledim\" | append-snippet "$CURRENT_SNIPPET_PATH"
# Calculate Commit hash and update variable
yq -Y -i ".commit.second_commit_hash = \"$(git rev-parse HEAD)\"" "$VARIABLES_FILE"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-09
CURRENT_SNIPPET_PATH="${PREFIX}/second-log.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git log --graph | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"

# Snippet commit-10
CURRENT_SNIPPET_PATH="${PREFIX}/third-log-patch.md"
create-snippet "$CURRENT_SNIPPET_PATH"

echo-command-and-result git log --graph --patch | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH"