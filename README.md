# SSH for Github

```bash
# generate ssh key
ssh-keygen -t ed25519 -C "genie.other@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/other_genie

cp ./ssh_config ~/.ssh/config
```

# gvm

```bash
sudo apt-get install bison
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```
