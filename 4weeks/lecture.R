library(help = datasets)

? trees
data("trees")
data("state")
#형태확인
class(trees)
class(state.area)
class(state.abb)
class(state.division)
#dataframe아닐수도있으므로 형식강제변환
df_trees <- as.data.frame(trees)
#형태확인
class(trees)

#head
head(trees)
head(trees, n = 8)

#tail
tail(trees)
tail(trees, n = 8)

#칼럼명
names(trees)

#데이터의 내부구조
str(trees)

#차원 확인
dim(trees)

#기초 통계
summary(trees)

#데이터 불러오기
data("Orange")

#출력
Orange

#내부구조
str(Orange)

?write.table
#csv형태로 저장하기위해선 sep을 ,로 주면된다.
write.table(Orange, "orange.txt", sep = ",")

# 불러올때 칼럼명이 존재한 상태라면 header=T 칼럼명이 없다면 header=F
df_orange <- read.csv("orange2.txt", header = F)
df_orange


#변수명 변경

#복사본만들어서 변수명을 변경해줘야 안전하게 진행가능

install.packages("MASS")
library(MASS)
Cars93
View(Cars93)
?Cars93


names(Cars93)
#1~5까지 칼럼 추출해 새로운 변수에 저장
cars93_subset <- Cars93[,c(1:5)]

class(names(cars93_subset))
#names로 subset 열의 메모리의 값들을 대체
names(cars93_subset) <- c("V1", "V2", "V3", "V4", "V5")

names(cars93_subset)

View(cars93_subset)

#전체 데이터프레임 복사
cars_new <- Cars93

#1:5까지 칼럼을 따로 추출해서 새로운 변수 생성,
# 이 새로운 변수의 칼럼명을 바꾸고 명령어 종료되므로 데이터는 사라진다.
names(cars_new[c(1:5)]) <- c("V1", "V2", "V3", "V4", "V5")

#따라서, 일부분만 바꾸고싶으면 reshape를 사용해야한다.

#install.packages("reshape")
library(reshape)


cars93_subset <- reshape::rename(cars93_subset, 
                        c(V1 = "V1_manufacturer", 
                          V2 = "V2_model", 
                          V3 = "V3_type", 
                          V4 = "V4_min_price", 
                          V5 = "V5_price"))
names(cars93_subset)

names(cars_new)
cars_new <- reshape::rename(cars_new,
                   c(Manufacturer = "V1",
                     Model = "V2"
                     ))

names(cars_new)


#install.packages("dplyr")
library(dplyr)

cars_new <- rename(cars_new,
                   v1_Manufacturer = V1,
                   v2_Model = V2)
names(cars_new)
# 동일한 함수가 다른 패키지에 정의되어있으면 R은 실행에 
#detach는 실행이후로부터 실행되는 커맨드에만 적용된다. 순서대로가 아님!
 
detach("package:reshape", unload = TRUE)
?detach


#파생변수(derived variable)

df_score <- data.frame(kor = c(50, 60 , 90 , 70 , 95),
                       eng = c(85, 90, 80, 75, 95),
                       math = c(75, 80, 85, 100, 95))
df_score
df_score$total <- df_score$kor + df_score$eng + df_score$math
df_score
df_score$avg <- round((df_score$kor + df_score$eng + df_score$math) / 3, 1)
df_score

#sum, mean을 사용할 수 없다.


df_score$result <- ifelse(df_score$avg >= 70, "Pass", "Fail")
df_score

#ifelse->중첩문 사용

df_score$grade <- ifelse(df_score$avg >= 90, "A", 
                         ifelse(df_score$avg >= 80, "B", 
                                ifelse(df_score$avg >= 70, "C",
                                       "F")))
df_score



# 데이터 전처리

# 조건 추출 filter(행추출)

library(readxl)
empdata <- read_excel("data.xlsx")
empdata
class(empdata)
names(empdata)

library(dplyr)

empdata[empdata$department == "Sales",]
empdata %>%
  filter(department == "Sales")

empdata %>%
  filter(position == "Manager")

empdata[empdata$department == "Sales" & empdata$position == "Manager",]

empdata %>%
  filter(department == "Sales" & position == "Manager")


# 필요한 칼럼만 추출 select

str(empdata)
empdata

#rownames(empdata) <- c("e1", "e2", "e3", "e4", "e5", "e6", "e7", "e8", "e9", "e10", "e11", "e12")
empdata
empdata %>%
  select(position, department)

empdata[c('name', 'department')]


# dplyr함수 조합

empdata[empdata$department == "Sales",][c("name", "worktime")]
empdata %>%
  filter(department == "Sales") %>%
  select(name, worktime)


# 데이터 정렬

# arrange사용


empdata %>%
  arrange(name)

#department먼저 정렬, 같은 값이면 position 기준 정렬
empdata %>%
  arrange(department, position)

empdata %>%
  select(name, salary) %>%
  #arrange(desc(salary))
  arrange(-salary)

empdata %>%
  select(-name)
