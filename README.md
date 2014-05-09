# MoMAK 2014

## 시작하기

### Node.js 설치

http://nodejs.org

#### nodemon 설치

명령 프롬포트 창에서

    sudo npm install -g nodemon

#### coffeescript 설치

명령 프롬포트 창에서

    sudo npm install -g coffee-script

### UPPERSITE 설치

http://uppercase.io/#UPPERSITE

### COFFEESITE 설치

https://github.com/BTNcafe/COFFEESITE/releases

### UUTIL 설치

https://github.com/BTNcafe/UUTIL/releases

### DB 설치

http://www.mongodb.org/downloads

에서 받아 압축을 풀고, 도큐먼트 폴더 밑에 mongodb 라는 폴더를 만든 다음,
터미널에서 푼 디렉토리 밑의 bin 디렉토리에서

    ./mongod --dbpath ~/Documents/mongodb

를 실행한다.

### 서버 실행

명령 프롬프트 창에서

    nodemon MoMAK.litcoffee

으로 띄우고 나서 브라우저로

    http://localhost:8889

을 연다.

## 초기화

http://localhost:8889 에서 자키로 들어가서 필요한 데이터를 로드한다.
