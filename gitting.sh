# !bin/bash/
echo "Starting git sync"
sudo git add *
sudo git commit -m "auto"
sudo git push --set-upstream origin master
echo "$(yellow building nix)"
sudo nixos-rebuild switch --flake /etc/nixos#default
