install.packages("readxl")
library(readxl)

df_birth = read_excel("./birth.xlsx")

#tibble형식 데이터
df_birth

#excel 데이터 표현
View(df_birth)

#기초통계함수 

name = c("강명환", "이나연", "양진혁")
min(name)
max(name)
abs(-1)
sqrt(3)
trunc(sqrt(3))
round(sqrt(3), 3)
length(name);


df_seoul <- read.csv("./seoul_weather.csv")
df_seoul
length(df_seoul$Avg_temp)
mean(df_seoul$Avg_temp)
median(df_seoul$Avg_temp)
min(df_seoul$Avg_temp)
range(df_seoul$Avg_temp)
sd(df_seoul$Avg_temp)
summary(df_seoul$Avg_temp)


total <- function(x, y)
{
  s <- x + y
  return (s)
}

total(10, 10)

score <- c(100,2,3,4,90)

if (score >= 80)
{
  print("합격")
}else
{
  print("ㅂㄹ힙갹")
}

ifelse (score >= 80, "합격", "불합갹")

df_seoul[df_seoul$Avg_temp >= 0,]
str(df_seoul[df_seoul$Avg_temp >= 0,1])
df_seoul[df_seoul$Avg_temp >= 0,]['date']
df_seoul[df_seoul$Avg_temp >= 0,'date']

df_seoul[df_seoul$Avg_temp >= 2 & df_seoul$Max_temp <= 10,]


##ggplot2데이터를 시각화
#dplyr 데이터 전처리

install.packages('ggplot2')
library(ggplot2)

weather <- read.csv("weather.csv")
View(weather)
str(weather)

#1. 데이터연결
#2. 축
#3. 그래프 모양지정
#4. 기호로 그래프 연결

ggplot(weather, aes(x = region, y = avg_temp)) +  geom_point()
ggplot(weather, aes(x = region, y = avg_temp)) +  geom_boxplot()

