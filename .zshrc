for file in $HOME/.zsh/autoload/pre/*.zsh(.N); do
    source "${file}"
done

if [[ -o login ]]; then
    for file in $HOME/.zsh/autoload/login/*.zsh(.N); do
        source "${file}"
    done
fi

if [[ -o interactive ]]; then
    for file in $HOME/.zsh/autoload/interactive/*.zsh(.N); do
        source "${file}"
    done
fi

for file in $HOME/.zsh/autoload/post/*.zsh(.N); do
    source "${file}"
done
