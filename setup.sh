#!/bin/bash

# Basic setup for Arch Linux
# 
# you must manually add users and their groups

HOST=	$1
REGION=	$2
CITY=	$3

ln -sf /usr/share/zoneinfo/&REGION/&CITY /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo $HOST >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 "&HOST".domain "$HOST >> /etc/hosts

pacman -S base-devel networkmanager grub efibootmgr dosfstools os-prober mtools sudo nvim

systemctl enable NetworkManager

mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
