###################
# 2주차 주별 과제 #
###################

# 1. 다음 표의 내용을 데이터 프레임 구조로 만들어보고 다음 실행결과와 같이 나오도록 출력하시오. 단, 데이터 프레임은 적절한 변수명을 지정하여 만드시오.

#이름 성별  취미  나이
#aaa  남자  독서  25
#bbb  여자  등산  23
#ccc  여자  게임  28
#ddd  남자  야구  29

# create vector
이름 <- c("aaa", "bbb", "ccc", "ddd")
성별 <- c("남자", "여자", "여자", "남자")
취미 <- c("독서", "등산", "게임", "야구")
나이 <- c(25, 23, 28, 29)

#   name gender hobby age
#1  aaa   남자  독서  25
#2  bbb   여자  등산  23
#3  ccc   여자  게임  28
#4  ddd   남자  야구  29

name <- c("aaa", "bbb", "ccc", "ddd")
gender <- c("남자", "여자", "여자", "남자")
hobby <- c("독서", "등산", "게임", "야구")
age <- c(25, 23, 28, 29)


# create dataframe by vectors
answer_1 <- data.frame(이름, 성별, 취미, 나이)
answer_2 <- data.frame(name, gender, hobby, age)
answer_1
answer_2


# 2. 다음 실행결과 같이 위 데이터 프레임에서 bbb의 자료를 모두 추출하시오.

#   name gender hobby age
#2  bbb   여자  등산  23

# get data from row 2
answer_2[2, ]

cat("\n")
# 3. 다음 실행결과 같이 위 데이터 프레임에서 취미정보를 모두 추출하시오. (여러 가지 방법이 있다면 모두 작성)

#[1] "독서" "등산" "게임" "야구"

# "hobby"를 가진 열의 데이터


answer_2[["hobby"]]
answer_2$hobby

answer_2[[3]]
answer_2[1:4, 3]
answer_2$"hobby"


cat("\n")
# 4. 다음 실행결과 같이 위 데이터 프레임에서 ddd의 취미를 축구로 변경하고, 다시 아래와 같이 출력하시오.

#   name gender hobby age
# 1  aaa   남자  독서  25
# 2  bbb   여자  등산  23
# 3  ccc   여자  게임  28
# 4  ddd   남자  축구  29

answer_2[4, 3] <- "축구"
answer_2



cat("\n")
# 5. 워킹 디렉터리(프로젝트 폴더)에 'rain.csv' 파일을 다운로드 받아서 불러와 데이터 프레임에 저장하고 출력하시오.

df <- read.csv(file = "rain.csv")
df




cat("\n")
# 6. 위 문제에서 불러온 'rain.csv' 파일에 들어있는 데이터 타입을 아래와 같이 확인해보시오.

# 'data.frame':	10 obs. of  3 variables:
#   $ 년    : int  2011 2012 2013 2014 2015 2016 2017 2018 2019 2020
# $ 지점  : int  108 108 108 108 108 108 108 108 108 108
# $ 강수량: num  2039 1646 1404 809 792 ...

str(df)