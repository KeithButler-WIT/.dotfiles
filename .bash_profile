#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /home/keith/.nix-profile/etc/profile.d/nix.sh ]; then . /home/keith/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
