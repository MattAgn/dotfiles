# MIT (c) Wenxuan Zhang
forgit::warn() { printf "%b[Warn]%b %s\n" '\e[0;33m' '\e[0m' "$@" >&2; }
forgit::info() { printf "%b[Info]%b %s\n" '\e[0;32m' '\e[0m' "$@" >&2; }
forgit::inside_work_tree() { git rev-parse --is-inside-work-tree >/dev/null; }

# https://github.com/wfxr/emoji-cli
hash emojify &>/dev/null && forgit_emojify='|emojify'

forgit_pager=$(git config core.pager || echo 'cat')

# git commit viewer
forgit::log() {
    forgit::inside_work_tree || return 1
    local cmd opts
    cmd="echo {} |grep -Eo '[a-f0-9]+' |head -1 |xargs -I% git show --color=always % $* | $forgit_pager"
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        +s +m --tiebreak=index --preview=\"$cmd\"
        --bind=\"enter:execute($cmd | LESS='-R' less)\"
        --bind=\"ctrl-y:execute-silent(echo {} |grep -Eo '[a-f0-9]+' | head -1 | tr -d '\n' |${FORGIT_COPY_CMD:-pbcopy})\"
        $FORGIT_LOG_FZF_OPTS
    "
    eval "git log --graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr' $* $forgit_emojify" |
        FZF_DEFAULT_OPTS="$opts" fzf
}

# git diff viewer
forgit::diff() {
    forgit::inside_work_tree || return 1
    local cmd files opts commit repo
    [[ $# -ne 0 ]] && {
        if git rev-parse "$1" -- &>/dev/null ; then
            commit="$1" && files=("${@:2}")
        else
            files=("$@")
        fi
    }

    repo="$(git rev-parse --show-toplevel)"
    target="\$(echo {} | sed 's/.*]  //')"
    cmd="git diff --color=always $commit -- $repo/$target | $forgit_pager"
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        +m -0 --preview=\"$cmd\" --bind=\"enter:execute($cmd |LESS='-R' less)\"
        $FORGIT_DIFF_FZF_OPTS
    "
    eval "git diff --name-status $commit -- ${files[*]} | sed -E 's/^(.)[[:space:]]+(.*)$/[\1]  \2/'" |
        FZF_DEFAULT_OPTS="$opts" fzf
}

# git add selector
forgit::add() {
    forgit::inside_work_tree || return 1
    local changed unmerged untracked files opts
    changed=$(git config --get-color color.status.changed red)
    unmerged=$(git config --get-color color.status.unmerged red)
    untracked=$(git config --get-color color.status.untracked red)

    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        -0 -m --nth 2..,..
        --preview=\"if (git status --porcelain -- {-1} | grep '^??') &>/dev/null; then  # diff with /dev/null for untracked files
                        git diff --color=always --no-index -- /dev/null {-1} | $forgit_pager | sed '2 s/added: /untracked: /'
                    else
                        git diff --color=always -- {-1} | $forgit_pager;
                    fi\"
        $FORGIT_ADD_FZF_OPTS
    "
    files=$(git -c color.status=always -c status.relativePaths=true status --short --untracked-files |
        grep -F -e "$changed" -e "$unmerged" -e "$untracked" |
        sed -E 's/^(..[^[:space:]]*)[[:space:]]+(.*)$/[\1]  \2/' |
        FZF_DEFAULT_OPTS="$opts" fzf |
        sed 's/^.*]  //' |
        sed 's/.* -> //') # for rename case
    [[ -n "$files" ]] && echo "$files"| tr '\n' '\0' |xargs -0 -I% git add % && git status --short --untracked-files && return
    echo 'Nothing to add.'
}

# git reset HEAD (unstage) selector
forgit::reset::head() {
    forgit::inside_work_tree || return 1
    local cmd files opts
    cmd="git diff --cached --color=always -- {} | $forgit_pager "
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        -m -0 --preview=\"$cmd\"
        $FORGIT_RESET_HEAD_FZF_OPTS
    "
    files="$(git diff --cached --name-only --relative | FZF_DEFAULT_OPTS="$opts" fzf)"
    [[ -n "$files" ]] && echo "$files" | tr '\n' '\0' | xargs -0 -I% git reset -q HEAD % && git status --short && return
    echo 'Nothing to unstage.'
}


# git stash viewer
forgit::stash::show() {
    forgit::inside_work_tree || return 1
    local cmd opts
    cmd="git stash show \$(echo {}| cut -d: -f1) --color=always --ext-diff | $forgit_pager"
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        +s +m -0 --tiebreak=index --preview=\"$cmd\" --bind=\"enter:execute($cmd | LESS='-R' less)\"
        $FORGIT_STASH_FZF_OPTS
    "
    git stash list | FZF_DEFAULT_OPTS="$opts" fzf
}

# git clean selector
forgit::clean() {
    forgit::inside_work_tree || return 1
    local files opts
    opts="
        $FORGIT_FZF_DEFAULT_OPTS
        -m -0
        $FORGIT_CLEAN_FZF_OPTS
    "
    # Note: Postfix '/' in directory path should be removed. Otherwise the directory itself will not be removed.
    files=$(git clean -xdfn "$@"| sed 's/^Would remove //' | FZF_DEFAULT_OPTS="$opts" fzf |sed 's#/$##')
    [[ -n "$files" ]] && echo "$files" | tr '\n' '\0' | xargs -0 -I% git clean -xdf '%' && return
    echo 'Nothing to clean.'
}

FORGIT_FZF_DEFAULT_OPTS="
$FZF_DEFAULT_OPTS
--ansi
--height='80%'
--reverse
--preview-window='right:60%'
$FORGIT_FZF_DEFAULT_OPTS
"

# register aliases
# shellcheck disable=SC2139
if [[ -z "$FORGIT_NO_ALIASES" ]]; then
    alias "ga"='forgit::add'
    alias "glg"='forgit::log'
    alias "gdiff"='forgit::diff'
fi