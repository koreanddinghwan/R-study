# 1. mtcars 데이터를 이용하여 다음 내용을 작성하세요.


# 1.1. dplyr 패키지의 함수를 사용하여 무게(wt)가 무거운 순으로
#     상위 5종의 자동차를 1위부터 5위 순서대로 출력하세요.

data("mtcars")
# class(mtcars)

# library 불러오기
library(dplyr)

# ?arrange -> 무거운 순 정렬
# ?head -> 상위 5개 데이터 추출
mtcars %>%
  arrange(-wt) %>%
  head(n = 5)

# 1.2. dplyr 패키지의 함수를 사용하여 엔진 실린더(cyl)가 8인 자동차들 중에 연비(mpg)가 낮은 하위
#     5종의 자동차를 하위 5위부터 1위 순서대로 출력하세요.

# ?dplyr::filter -> 특정 값 가진 데이터 추출
mtcars %>%
  filter(cyl == 8) %>%
  arrange(-mpg) %>%
  tail(n = 5)


detach("package:dplyr", unload = TRUE)


# 2. mtcars 데이터를 이용하여 다음과 같은 파생 변수를 생성해보세요.

# 2.1. dplyr 패키지의 함수를 사용하여 year 칼럼을 추가하고
#     모든 데이터 값은 1974가 되도록 출력하세요.
#     (같은 값으로 할당할 때는 해당하는 값을 등호로 변수 또는 칼럼명과 연결하면 됩니다.)

library(dplyr)
data("mtcars")
mtcars_copy <- mtcars

# ?dplyr::mutate
# 사용하면 실제 변경이 아닌 예상값만 출력해주므로, 재할당을 해줘야한다.
mtcars_copy <- mtcars_copy %>%
  mutate(year = 1974)

mtcars_copy

# 2.2. 내장함수를 사용하여 am의 값이 0이면 automatic, 1이면 manual인 trans1 변수를 추가하세요.

# ?ifelse
# ifelse(test, yes, no)
mtcars_copy$trans1 <- ifelse(mtcars_copy$am == 0, "automatic", "manual")


# 2.3. dplyr 패키지의 함수를 사용하여 am의 값이 0이면 automatic,
#     1이면 manual인 trans2 변수를 추가하세요.

# mutate 사용, 역시 할당시켜줘야 추가된다.
mtcars_copy <- mtcars_copy %>%
  mutate(trans2 = ifelse(am == 0, "automatic", "manual"))

detach("package:dplyr", unload = TRUE)


# 3. mtcars 데이터를 이용하여 다음 문제를 해결해보세요.

# 3.1. dplyr 패키지의 함수를 사용하여 trans2의 값(“automatic”, “manual”)에 따른
#     평균 연비(mpg), 평균 배기량(disp)를 출력하세요.

library(dplyr)
# ?summarise -> 통계치 산출 함수

# ?group_by
# group_by는 기존 tbl을 가져와서 그룹화된 tbl로 변환.
# mtcars_copy %>%
#  group_by(trans2) -> group_by로만은 어떤 변화가 있는지 알 수 없다.

# group단위로 수행된 연산에서 영향을 준다.
mtcars_copy %>%
  group_by(trans2) %>%
  summarise(mean_mpg = mean(mpg), mean_disp = mean(disp))


# 3.2. dplyr 패키지의 함수를 사용하여 엔진 실린더별로 몇 대의 자동차가 있는지 출력해보세요.

# ?n()
# cyl로 집단화를 시켜주고, n()함수 사용.
# n()는 집단화된 group의 크기를 반환한다.

mtcars_copy %>%
  group_by(cyl) %>%
  summarise(cnt_car = n())

detach("package:dplyr", unload = TRUE)


# 4.1. 실습에서 사용된 데이터 프레임 df_a에 대하여 dplyr 패키지의
#      left_join( ), inner_join( ), full_join( )함수를 사용하여
#      df_ex1과 결합하여 각각 df_left, df_inner, df_full에 저장해보고,
#      어떤 차이가 있는지서술하세요.

library(dplyr)

df_a <- data.frame(
  name = c("aaa", "bbb", "ccc", "ddd"),
  birthyear = c(1984, 1989, 1985, 1991)
)

df_ex1 <- data.frame(
  name = c("bbb", "ccc", "eee", "ddd"),
  gen = c("F", "M", "F", "M")
)

# 동일 키값 name만 있으므로, name을 기준으로 join수행.

# left_join(x, y, by = "key")
# left_join은 x의 모든 행과 key값이 일치하는 y행을 결합한다.
# df_a에는 key값이 있으나, df_ex1에는 해당 key값이 없다면, NULL로 표현한다.
df_left <- left_join(df_a, df_ex1, by = "name")
df_left

# 따라서 아래와 같은 명령은 df_ex1의 모든 행을 포함하므로, 위와 다른 결과를 나타낸다.
# df_left <- left_join(df_ex1, df_a, by = "name")
# df_left

# inner_join(x, y, by = "key")
# key가 일치하는 x와 y의 행만을 결합한다.
df_inner <- inner_join(df_a, df_ex1, by = "name")
df_inner

# full_join(x, y, by = "key")
# x와 y의 모든 행을 결합한다.
# 따라서 "aaa"의 gen, "eee"의 birthyear는 NULL로 나타낸다.
df_full <- full_join(df_a, df_ex1, by = "name")
df_full


# 4.2. dplyr 패키지의 bind_rows( ) 함수를 사용하여
#      df_ex1에 df_ex2의 3개 데이터를 추가해보세요.
df_ex1
df_ex2 <- data.frame(
  name = c("fff", "ggg", "hhh"),
  gen = c("M", "M", "F")
)

# 칼럼명이 같은 데이터를 위아래로 결합한다.
df_ex1 <- bind_rows(df_ex1, df_ex2)
df_ex1
library(dplyr)
?bind_rows
# 4.3. dplyr 패키지의 데이터 결합 함수를 사용하여 아래 데이터프레임으로
#      파생변수 vs_name을 mtcars에 추가하세요

data("mtcars")
# 데이터 조작하므로 복사본 생성
df_mtcars_copy <- mtcars

# dataframe 생성
df_vs_name <- data.frame(
  vs = c(0, 1),
  vs_name = c("V-shaped", "straight")
)

# vs에 결측치 없으므로, vs를 키값으로 inner join수행
df_mtcars_copy <- inner_join(df_mtcars_copy, df_vs_name, by = "vs")

detach("package:dplyr", unload = TRUE)

# 5. airquality 데이터를 이용하여 다음을 해결하세요.

data("airquality")
# class(airquality)
# View(airquality)

# 5.1. 태양복사 에너지(Solar.R)의 관측값에 몇 개의 결측치가 있는지 확인하세요.

# table 함수는 빈도표를 생성, is.na로 결측치 확인
table(is.na(airquality$Solar.R))

# 5.2. dplyr 패키지의 함수를 사용하여 Solar.R의 결측치를 모두 제외하고 평균을 구하세요.

library(dplyr)

# , na.rm = T로 결측치 데이터를 제외
airquality %>%
  summarise(mean_Solar = mean(Solar.R, na.rm = T))

# 5.3. Solar.R의 결측치를 평균으로 대체하세요.
#     (단, 평균은 소수점 첫째자리에서 반올림한 정수값을 직접 입력하여 사용하세요.)

# 데이터 조작하므로 복사본생성
df_air_copy <- airquality

# solar.R의 결측치 제외한 평균값을 데이터프레임화
df_mean_solar <- df_air_copy %>%
  summarise(mean_Solar = mean(Solar.R, na.rm = T))

# ifelse문으로 결측치인 값에 소수점 1째자리에서 반올림한 정수값 할당
df_air_copy$Solar.R <- ifelse(is.na(df_air_copy$Solar.R),
  round(df_mean_solar[1, ], digit = 0),
  df_air_copy$Solar.R
)

df_air_copy

# 5.4. dplyr 패키지의 함수를 사용하여 결측치를 평균으로 대체한 Solar.R의 평균을 구하세요

df_air_copy %>%
  summarise(mean_Solar = mean(Solar.R))

detach("package:dplyr", unload = TRUE)

# 6. airquality 데이터를 이용하여 다음을 해결하세요.

# 6.1. 변수 Ozone에 몇 개의 결측치가 있는지 알아보세요.

data("airquality")
df_air_copy2 <- airquality
table(is.na(df_air_copy2$Ozone))

# 6.2. 변수 Ozone에 대한 박스플랏(상자그림)을 그려 이상치(극단치)가 있는지 확인하고,
#     어떤 값을 벗어난 값이 이상치(극단치)인지 확인하세요.

library(ggplot2)
#빈 동그라미 2개가 이상치이다.
list_box_ozone <- boxplot(df_air_copy$Ozone)

#아래 두 값의 범위에서 벗어난 값은 이상치이다.
ozone_min <- list_box_ozone$stats[1,]
ozone_max <- list_box_ozone$stats[5,]
class(ozone_max)
# 6.3. 변수 Ozone의 모든 이상치(극단치)를 결측치로 바꾸고, 몇 개의 결측치가 추가됐는지 살펴보세요.

# 위에서 구한 범위에서 벗어난 값을 NA로 바꾼다.
df_air_copy2$Ozone <- ifelse(df_air_copy2$Ozone < ozone_min |
                               df_air_copy2$Ozon > ozone_max,
                                  NA, df_air_copy2$Ozone)

# 결측치 2개가 추가된 것을 확인할 수 있다.
table(is.na(df_air_copy2$Ozone))


# 6.4 dplyr 패키지의 함수를 사용하여 변수 Ozone의 결측치를 제외한 값들의 평균을 구하세요.

library(dplyr)

df_air_copy2 %>%
  summarise(mean_Ozone = mean(df_air_copy2$Ozone, na.rm = T))

detach("package:dplyr", unload = TRUE)

