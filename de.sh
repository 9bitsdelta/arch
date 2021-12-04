#!/bin/bash

# setup the desktop environment (bspwm, polybar, etc)

pacman -S xorg xorg-xinit archlinux-wallpaper feh picom bspwm sxhkd alacritty rofi git firefox

git clone https://aur.archlinux.org/yay
cd yay
makepg -si
cd ../

yay -S polybar
yay -Rsnd i3-wm

git clone https://github.com/9bitsdelta/dotfiles
cp -r ./dotfiles ~/
