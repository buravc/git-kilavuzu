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

create-snippet() {
    echo "# --8<-- [start:$2]" >> "$1"
    echo "\`\`\`bash $3" >> "$1"
}

append-snippet() {
    sed -e "s|buravc|<username>|gI;s|avcii\.brk@gmail\.com|email|gI" >> "$1"
}

finish-snippet() {
    echo "\`\`\`" >> "$1"
    echo "# --8<-- [end:$2]" >> "$1"
}

echo-command-and-result() {
    # set -x
    local cmd="$*"
    echo "$ $cmd"
    eval "$cmd" 2>&1
    # set +x
}

# commit section prefix
SNIPPET_DIR="$ROOT_DIR/snippets";
rm "$SNIPPET_DIR/"*.md || true;
CURRENT_SNIPPET_PATH="${SNIPPET_DIR}/commit.md"

# commit snippets
# region snippet hello world
SNIPPET_NAME="hello-world"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result echo \"Hello world\" \> test.txt | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git status
SNIPPET_NAME="git-status"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME" "hl_lines=\"6-8\""

echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git add git status
SNIPPET_NAME="git-add-git-status-1"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git add test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git commit
SNIPPET_NAME="git-commit-1"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git commit -m \"Ilk commit\" | append-snippet "$CURRENT_SNIPPET_PATH"
# Calculate Commit hash and update variable
yq -Y -i ".commit.first_commit_hash = \"$(git rev-parse HEAD)\"" "$VARIABLES_FILE"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git log
SNIPPET_NAME="git-log-1"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git log | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region echo merhaba dunya, git status
SNIPPET_NAME="echo-merhaba-git-status"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result echo \"Merhaba Dunya\" \>\> test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git add; git status
SNIPPET_NAME="git-add-git-status-2"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git add test.txt | append-snippet "$CURRENT_SNIPPET_PATH"
echo "" | append-snippet "$CURRENT_SNIPPET_PATH"
echo-command-and-result git status | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git commit
SNIPPET_NAME="git-commit-2"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git commit -m \"Dosyaya Merhaba Dunya ekledim\" | append-snippet "$CURRENT_SNIPPET_PATH"
# Calculate Commit hash and update variable
yq -Y -i ".commit.second_commit_hash = \"$(git rev-parse HEAD)\"" "$VARIABLES_FILE"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git log --graph
SNIPPET_NAME="git-log-graph"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git log --graph | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion

# region git log --graph --patch
SNIPPET_NAME="git-log-graph-patch"
create-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"

echo-command-and-result git log --graph --patch | append-snippet "$CURRENT_SNIPPET_PATH"

finish-snippet "$CURRENT_SNIPPET_PATH" "$SNIPPET_NAME"
# endregion