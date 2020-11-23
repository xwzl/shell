
git submodule foreach pwd >> path.txt
awk -f ./awk-git.awk path.txt
git remote set-url origin http://192.192.192.56/tcjkbackend/root.git
rm -rf ./path.txt
