#/bin/bash

http POST "https://ax48t.auth.tuat.ac.jp/cgi-bin/Login.cgi?uid=50009154011&pwd=4885rtyu"
sudo systemctl restart network-wireless@wifi1
ifconfig
