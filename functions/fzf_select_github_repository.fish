function fzf_select_github_repository -d 'fzf source to cd to repository under $HOME/GitHub'
    set -l github_directory "$HOME/ghq/github.com"

    find "$github_directory" -mindepth 2 -maxdepth 2 -type d \
        | string replace "$github_directory/" "" \
        | fzf \
        | read repository

    if test -n "$repository"
        commandline "cd $github_directory/$repository"
        commandline -f execute
    end
end
