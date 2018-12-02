##mac 
1. brew 설치한다.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

설치되었다면 업데이만 해줘도 된다.

```bash
# update homebrew 
brew update
```

/usr/local/bin 을 패스에 추가한다. 이미 되어있다면 건너뛰어도 된다.

```bash
# Add Homebrew path in PATH
echo "# Homebrew" >> ~/.bash_profile
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
```

2)  
