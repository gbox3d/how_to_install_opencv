## macos 에 설치하기. 

1. brew 설치한다.

이부분은 이미 설치 되어있다면 다음 과정인 업데이트만 해주고 건너 뛰어도된다.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

이미 설치되었다면 업데이만 해줘도 된다.

```bash
# update homebrew 
brew update
```

/usr/local/bin 을 패스에 추가한다. 이미 되어있다면 건너뛰어도 된다. 아마도 nodejs같은것을 설치했다면 패스가 잡혀 있을것이다.

```bash
# Add Homebrew path in PATH
echo "# Homebrew" >> ~/.bash_profile
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
```

2. 파이썬 설치하기

시스템에 기본적으로 설치되어있는 파이썬 대신에 홈부루 버전의 파이썬으로 다시 설치한다.
```bash
# If installing python for the first time using Homebrew, 
# else skip the 3 lines below and upgrade. 
brew install python python3
brew link python
brew link python3
```
 
만약 홈부루 버전의 파이썬이 설치되어있다면 업그래이드만 해준다.
```bash
# NOTE : If you have python already installed using homebrew, 
# it might ask you to upgrade.
# Upgrade the python using new homebrew formulae.
brew upgrade python
brew upgrade python3

```

버전 별로 설치 위치를 확인해 본다. 주석에 나와있는대로 나오면 제대로 설치된것이다.  
만약 /usr/bin/python 이라고 나온다면 설치가 잘안된것이다.  
이것은 OS에 기본적으로 깔려있는 파이썬이다.  
```bash
# Check whether Python using homebrew install correctly
which python2  # it should output /usr/local/bin/python2
which python3  # it should output /usr/local/bin/python3
 
```

다음과 버전확인을한다.
```bash
python --version
python2 --version
python3 --version
````

초기에는 python 은 2.x대로 되어있을것이다. 만약 python 명령어로 새로 설치한 최신버전 파이썬을 실행하고 싶다면,  
아래와 같이 bash_profile 에 추가한다.
```bash
# Adding this line to end of .bash_profile will make python command 
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

```

3. 버츄얼환경에 파이썬 라이브러리 설치하기

가상 개발환경 만들기 위하여 virtualenv 설치하기
```bash
# Install virtual environment
pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"
echo "VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3" >> ~/.bash_profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
source ~/.bash_profile

```

mkvirtualenv 로 가상 개발 환경을 생성한다.  
workon 으로 가상 개발환경으로 진입한다.

```bash
# Create virtual environment
mkvirtualenv opencvstudy-py3 -p python3
workon opencvstudy-py3
```

필요한 라이브러리를 가상환경에 설치한다.
```bash
# Now install python libraries within this virtual environment
pip install numpy scipy matplotlib scikit-image scikit-learn ipython pandas
  
# Quit virtual environment
deactivate
```

4. opencv 설치하기 

1) brew 를 이용한 간편 설치 
현재(2018.12.18)는 opencv 버전 3.4.3이 설치된다.
```bash
brew install opencv
```

sitepackage 경로를 추가 해준다.
```bash
echo /usr/local/opt/opencv/lib/python3.7/site-packages >> /usr/local/lib/python3.7/site-packages/opencv3.pth
```

가상환경에 심볼릭 링크를 만든다.
```bash
cd ~/.virtualenvs/opencvstudy-py3/lib/python3.7/site-packages/
ln -s /usr/local/opt/opencv/lib/python3.7/site-packages/cv2.cpython-37m-darwin.so cv2.so

```

설치확인 과정 아래 소스가 에러없이 수행되면 정상설치

```shell
$ workon cv
$ python
>>> import cv2
>>> cv2.__version__
'버 전 정 보'
>>> exit()
```

2) 직접 소스 컴파일하기 

xcode가 설치 되어있다고 가정하고 cmake,qt5 를 설치한다.

```bash
brew install cmake
brew install qt5
 
QT5PATH=/usr/local/Cellar/qt/<설치된 버전 이름>
```

그 다음엔 첨부된 install_cv_py.sh 실행한다.

### 참고자료 

주요 자료  
https://www.learnopencv.com/install-opencv3-on-macos/

https://edykim.com/ko/post/installing-opencv-on-mac-and-running-examples/

파이썬과 opencv4 버전 설치  
https://www.pyimagesearch.com/2018/08/17/install-opencv-4-on-macos/

http://jeongchul.tistory.com/515  

https://medium.com/@nuwanprabhath/installing-opencv-in-macos-high-sierra-for-python-3-89c79f0a246a  


xcode 프로잭트 세팅  
https://gist.github.com/sigmadream/f1a7778eeaeab79f9888a3292976e438
