#! /usr/bin/env bash

set -e
set -o pipefail

readonly ROOT_DIR="$PWD"
readonly REPO_DIR="git-kilavuzu-calisma"
readonly VARIABLES_FILE="$ROOT_DIR/variables.yaml"
readonly SNIPPETS_OUTPUT_DIR="$ROOT_DIR/snippets";
readonly PAGE_SNIPPET_DECLARATIONS="$ROOT_DIR/snippets.yaml"

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -b|--bundle)
            readonly BUNDLE_FILE="$2";
            shift 2;
            ;;
        -s|--start-from)
            readonly START_STEP="$2";
            shift 2;
            ;;
        --clean-all)
            rm "$SNIPPETS_OUTPUT_DIR/"*.md || true;
            shift 2;
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if [[ -f "$BUNDLE_FILE" ]]; then
    echo "bundle file provided, restoring bundle"
    rm -rf "$REPO_DIR" || true;
    git clone "$BUNDLE_FILE" "$REPO_DIR" && cd "$REPO_DIR"
elif [[ -z "$START_STEP" ]]; then
    echo "no bundle is provided, creating new repo..."
    rm -rf "$REPO_DIR" || true;
    mkdir "$REPO_DIR" && cd "$REPO_DIR" && git init;
else
    cd "$REPO_DIR"
fi

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

echo-run-output() {
    # set -x
    local cmd="$*"
    echo "\$ $cmd"
    eval "$cmd" 2>&1
    # set +x
}

echo-run-output-error() {
    # set -x
    local cmd="$*"
    echo "\$ $cmd"
    eval "$cmd" 2>&1 || true
    # set +x
}

expand-echo-run-output() {
    # set -x
    local cmd="$*"
    echo "\$ ${!cmd}"
    eval "${!cmd}" 2>&1
    # set +x
}

process-page() {
    local PAGE;
    PAGE="$(cat)"
    local CURRENT_PAGE_NAME="$1"
    local CURRENT_PAGE_OUTPUT_PATH="${SNIPPETS_OUTPUT_DIR}/$CURRENT_PAGE_NAME.md"
    rm "$CURRENT_PAGE_OUTPUT_PATH" || true;
    local len_snippets;
    len_snippets="$(echo "$PAGE" | yq "length")"
    for ((snippet_index = 0; snippet_index < len_snippets; snippet_index++)); do
        echo "$PAGE" | yq -Y ".[${snippet_index}]" | process-snippet "$CURRENT_PAGE_OUTPUT_PATH"
    done
}

process-snippet() {
    local SNIPPET SNIPPET_NAME OUTPUT_PATH HIGHLIGHT;
    SNIPPET="$(cat)"
    OUTPUT_PATH="$1"
    SNIPPET_NAME="$(echo "$SNIPPET" | yq -r ".snippet")"
    HIGHLIGHT="$(echo "$SNIPPET" | (yq -r ".highlight // empty" 2>/dev/null || true))"
    create-snippet "$OUTPUT_PATH" "$SNIPPET_NAME" "${HIGHLIGHT:+hl_lines=\"$HIGHLIGHT\"}"

    len_cmds="$(echo "$SNIPPET" | yq -r ".commands | length")"
    for ((cmd_index = 0; cmd_index < len_cmds; cmd_index++)); do
        local COMMAND COMMAND_TYPE VALUE;
        COMMAND="$(echo "$SNIPPET" | yq -Y ".commands[$cmd_index]")"
        COMMAND_TYPE="$(echo "$COMMAND" | yq -r "keys[0]")"
        VALUE="$(echo "$COMMAND" | yq -r ".$COMMAND_TYPE")"
        case "$COMMAND_TYPE" in
            echo_run_output)
            echo-run-output $VALUE | append-snippet "$OUTPUT_PATH";
            ;;
            echo_run_output_error)
            echo-run-output-error $VALUE | append-snippet "$OUTPUT_PATH";
            ;;
            expand_echo_run_output)
            expand-echo-run-output $VALUE | append-snippet "$OUTPUT_PATH";
            ;;
            echo)
            echo "${VALUE}" | append-snippet "$OUTPUT_PATH"
            ;;
            run)
            # set -x;
            eval $VALUE;
            # set +x;
            ;;
            *)
            echo "failed to determine command";
            ;;
        esac
    done

    finish-snippet "$OUTPUT_PATH" "$SNIPPET_NAME"
}

main() {
    local skip=false;
    if [[ -n "$START_STEP" ]];then
        skip=true;
    fi

    local len_pages;
    len_pages=$(yq 'length' "$PAGE_SNIPPET_DECLARATIONS")
    for ((page_index = 0; page_index < len_pages; page_index++)); do
        local CURRENT_PAGE_NAME;
        CURRENT_PAGE_NAME="$(yq -r ".[${page_index}] | keys[0]" "$PAGE_SNIPPET_DECLARATIONS")"
        # if $START_STEP is provided, then skip until the provided step
        if [[ "$skip" == true ]]; then
            if [[ "$CURRENT_PAGE_NAME" != "$START_STEP" ]]; then
                continue
            else
                skip=false;
            fi
        fi
        yq -Y ".[${page_index}].$CURRENT_PAGE_NAME" "$PAGE_SNIPPET_DECLARATIONS" | process-page "$CURRENT_PAGE_NAME"
    done
    git bundle create ../git-kilavuzu-calisma.bundle --all
}

main