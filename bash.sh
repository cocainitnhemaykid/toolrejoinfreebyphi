cd
if [ -e "/data/data/com.termux/files/home/storage" ]; then
	rm -rf /data/data/com.termux/files/home/storage
fi
termux-setup-storage
yes | pkg update
. <(curl -Ls https://raw.githubusercontent.com/cocainitnhemaykid/toolrejoinfreebyphi/refs/heads/main/termux-change-repo.sh)
yes | pkg upgrade
yes | pkg i python -y
yes | pkg i python-pip -y
pip install requests rich prettytable pytz pycryptodome
export CFLAGS="-Wno-error=implicit-function-declaration"
pkg install python-psutil -y

curl -Ls "https://raw.githubusercontent.com/cocainitnhemaykid/toolrejoinfreebyphi/refs/heads/main/phitoolrj.py" -o /sdcard/Download/phitoolrj.py
