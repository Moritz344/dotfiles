lspci | grep -i nvidia
ubuntu-drivers devices

sudo apt remove --purge '^nvidia-.*'
sudo apt remove --purge nvidia*
sudo apt autoremove
sudo apt update

sudo apt install nvidia-driver-575-open # installiere treiber
