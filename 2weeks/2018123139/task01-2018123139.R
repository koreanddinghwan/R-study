###################
# 2주차 주별 과제 #
###################

# 1. 다음 표의 내용을 데이터 프레임 구조로 만들어보고 다음 실행결과와 같이 나오도록 출력하시오. 단, 데이터 프레임은 적절한 변수명을 지정하여 만드시오.

#이름 성별  취미  나이
#aaa  남자  독서  25
#bbb  여자  등산  23
#ccc  여자  게임  28
#ddd  남자  야구  29

#   name gender hobby age
#1  aaa   남자  독서  25
#2  bbb   여자  등산  23
#3  ccc   여자  게임  28
#4  ddd   남자  야구  29


# create vector in korean
이름 <- c("aaa", "bbb", "ccc", "ddd")
성별 <- c("남자", "여자", "여자", "남자")
취미 <- c("독서", "등산", "게임", "야구")
나이 <- c(25, 23, 28, 29)

# create vector in english
name <- c("aaa", "bbb", "ccc", "ddd")
gender <- c("남자", "여자", "여자", "남자")
hobby <- c("독서", "등산", "게임", "야구")
age <- c(25, 23, 28, 29)

# create dataframe by vectors
answer_1 <- data.frame(이름, 성별, 취미, 나이)
answer_2 <- data.frame(name, gender, hobby, age)
# 출력
answer_1
answer_2

# 2. 다음 실행결과 같이 위 데이터 프레임에서 bbb의 자료를 모두 추출하시오.

#   name gender hobby age
#2  bbb   여자  등산  23

# get data from row 2
answer_2[2, ]

# 3. 다음 실행결과 같이 위 데이터 프레임에서 취미정보를 모두 추출하시오. (여러 가지 방법이 있다면 모두 작성)

#[1] "독서" "등산" "게임" "야구"

#answer_2["hobby"] => 열과 행 정보를 모두 가져온다.
# 데이터만 가져오기위해선 [["hobby"]], $hobby, [[3]] 으로 데이터만 추출할 수 있다.
answer_2[["hobby"]]
answer_2$hobby
answer_2[[3]]

answer_2$"hobby" # $hobby는 결국 문자열 형태이므로 $"hobby"와 같은의미
answer_2[1:4, 3] # 벡터 생성 시, c(1:3)처럼 범위를 주었던 것 처럼, 가져올 데이터의 범위도 지정가능


# 4. 다음 실행결과 같이 위 데이터 프레임에서 ddd의 취미를 축구로 변경하고, 다시 아래와 같이 출력하시오.

#   name gender hobby age
# 1  aaa   남자  독서  25
# 2  bbb   여자  등산  23
# 3  ccc   여자  게임  28
# 4  ddd   남자  축구  29

# 4행 3열 의 데이터를 "축구"로 할당, 
answer_2[4, 3] <- "축구"
#출력
answer_2


# 5. 워킹 디렉터리(프로젝트 폴더)에 'rain.csv' 파일을 다운로드 받아서 불러와 데이터 프레임에 저장하고 출력하시오.

# 프로젝트 폴더 내의 rain.csv를 가져온다. 
df <- read.csv(file = "rain.csv")
# 출력
df


# 6. 위 문제에서 불러온 'rain.csv' 파일에 들어있는 데이터 타입을 아래와 같이 확인해보시오.

# 'data.frame':	10 obs. of  3 variables:
#   $ 년    : int  2011 2012 2013 2014 2015 2016 2017 2018 2019 2020
# $ 지점  : int  108 108 108 108 108 108 108 108 108 108
# $ 강수량: num  2039 1646 1404 809 792 ...

# class가 데이터타입을 알려주는데 반해, str은 내부에 어떤 데이터를 가지는지 상세하게 알려준다.
#class(df)
str(df)

