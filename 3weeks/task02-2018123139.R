###################
# 3주차 주별 과제 #
###################
# 다음 표는 뷰티몰의 회원등급관리 데이터입니다.
# 
# 이름  회원등급  구매액
# aaa     VIP      35000
# bbb     gold     25000
# ccc   welcome    15000
# ddd     gold     23000
# eee     VIP      42000

# 1. 위 표의 내용을 아래와 같은 실행결과가 나오도록 데이터 프레임 구조로 만들어 변수에 저장하고, 출력해보세요.
# 
# name   grade price
# 1  aaa     VIP 35000
# 2  bbb    gold 25000
# 3  ccc welcome 15000
# 4  ddd    gold 23000
# 5  eee     VIP 42000

#벡터를 만들어 매개변수로 주어 바깥에서 사용되지 않게 한다.
df_mallMember <- data.frame(
                    name = c("aaa", "bbb", "ccc", "ddd", "eee"),
                    grade = c("VIP", "gold", "welcome", "gold", "VIP"),
                    price = c(35000, 25000, 15000, 23000, 42000)
                  )

df_mallMember
# 2. 기초통계량 함수를 이용해 구매액의 최대값, 최소값, 평균값, 중앙값을 순서대로 구해보세요.

# input값의 최대, 최소, 평균, 중앙값을 구하는
# 기초통계량함수 min, max, mean, median함수 사용

max(df_mallMember$price)
min(df_mallMember$price)
mean(df_mallMember$price)
median(df_mallMember$price)

# 3. 문자열 함수를 이용해 gold를 silver로 변경한 후 바뀐 데이터 프레임을 출력해보세요.
# 
# name   grade price
# 1  aaa     VIP 35000
# 2  bbb  silver 25000
# 3  ccc welcome 15000
# 4  ddd  silver 23000
# 5  eee     VIP 42000

# 문자열 처리 함수 gsub("patternStr","replaceStr", characterVecter)
df_mallMember$grade <- gsub("gold", "silver", df_mallMember$grade)

df_mallMember

# 4. 논리식을 활용하여 회원등급이 VIP이면서 구매액이 39000원 이상인 회원의 모든 정보를 추출하세요.
# 
# name grade price
# 5  eee   VIP 42000

# dataframe은 대괄호를 통해 조건을 줄 수 있다.
# &, | 등을통해 다양한 조건을 줄 수 있다.
df_mallMember[df_mallMember$grade == "VIP" & 
              df_mallMember$price >= 39000,]



# 5. 논리식을 활용하여 회원등급이 silver인 회원의 이름만 데이터프레임 형태로 추출하세요.
# 
# name
# 2  bbb
# 4  ddd

# 특정 조건을 만족하는 데이터 전체를 dataframe에서 추출한 후, name column만을 추출한다.

df_mallMember[df_mallMember$grade == "silver",]["name"]


# 6. ggplot2를 이용해 이름별 구매액을 점 그래프로 그려보세요. 이름이 가로, 구매액이 세로에 표시되도록 하세요.

#패키지 설치. 
#install.packages("ggplot2")
#설치되어있다는 가정하에 라이브러리만을 불러오겠습니다.
#패키지 불러오기
library(ggplot2)
#ggplot(data, aes(x = x축데이터, y = y축데이터)) + 그래프모양()
ggplot(df_mallMember, aes(x = name, y = price)) + geom_point()


