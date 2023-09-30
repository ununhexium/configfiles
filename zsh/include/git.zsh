## GIT
function ggo {
    cd $(fzf_ggo)
}

function gcot {
    git checkout $(git tag --list | fzf)
}

