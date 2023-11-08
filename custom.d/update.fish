function update
  if not test -r ~/.config/fish/functions/fisher.fish
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  end
  fisher
end
