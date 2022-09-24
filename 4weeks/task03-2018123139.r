#1. R에서 제공하는 내부 데이터 세트 중 CO2 데이터 세트의 데이터를 다음과 같이 조회해보세요.

  #CO2 데이터 불러오기
  data("CO2")
  #데이터의 직접적인 값 조작이아닌 조회만을 하는 과제이므로, 
  #사본없이 과제 풀이
  #df_CO2 <- as.data.frame(CO2)

#1.1. CO2의 전체 데이터를 조회하세요.

  CO2

#1.2. CO2의 행과 열의 개수(차원)를 조회하세요.

  # dim함수로 dataframe의 차원조회
  dim(CO2)


#1.3. CO2의 앞부분 10개의 데이터만 조회하세요.

  # head(객체, 앞에서부터 출력할 행 갯수)
  head(CO2, n= 10)

#1.4. CO2의 뒷부분 10개의 데이터만 조회하세요.
  
  # tail(객체, 뒤에서부터 출력할 행 갯수)
  tail(CO2, n= 10)

#1.5. CO2의 데이터 내부구조를 조회하세요.
  
  # str(객체)로 내부 정보를 조회.
  str(CO2)

#1.6. CO2의 기초통계량 요약 정보를 조회하세요.

  # summary함수로 데이터셋의 통계정보를 조회한다.
  summary(CO2)
  

#2. R에서 제공하는 내부 데이터 세트 중 state.x77 데이터에 대해 
#   다음 코드를 작성하세요.

#2.1. state.x77 데이터 세트의 데이터 타입을 확인하고 
#     데이터 프레임 형태로 불러와서 st 변수에 저장 하세요.

  # data("state.x77")->에러발생
  # data("state")로 데이터셋을 불러온 후, 
  # state.x77 데이터셋만 사용.
  data("state")

  #데이터 타입 확인
  class(state.x77)

  # matrix, array 데이터 형식이므로, dataframe으로 변환
  st <- as.data.frame(state.x77)
  #class(st)

#2.2. state.x77 데이터 세트의 인구(population)와 수입(income) 열의 
#     값들만 추출하여 “state_x77.txt” 파일로 저장하세요.

  library(dplyr)

  #st[c("Population", "Income")]
  #st %>%
  #  select(Population, Income)
  #st[c("Population", "Income")]
  
  
  # csv는 ,를 구분자로 사용한다.
  write.table(st[c("Population", "Income")],
              "state_x77.txt", sep = ",")
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
#2.3. 위 항목에서 작성한 “state_x77.txt” 파일을 읽어서 
#     ds 변수에 저장한 후 ds의 내용을 출력하세요.
  
  # ?read.csv
  # txt파일에 헤더가 명시되어 있는 상태.
    # header옵션은 default로 TRUE임에도 불구하고, 헤더가 있다는 것을
      # 명시적으로 알려주기위해 옵션을 명시한다.
    
  ds <- read.csv("state_x77.txt", header = T)
  ds


#3. R에서 제공하는 내부 데이터 세트 중 iris 데이터에 대해 다음 작업을 수행 하세요.
  
#3.1. iris 데이터 세트의 변수명(칼럼명)을 출력하세요.

  #데이터 불러오기
  data("iris")
  #class(iris)
  #str(iris)
  
  #names함수로 칼럼명 출력
  names(iris)
  
#3.2. iris 데이터 세트의 “Sepal.Length”, “Sepal.Width”, “Species” 열의 모든 데이터를 
#     iris_subset 변수 에 저장하고, names( ) 함수를 이용하여 변수명을 “V1”, “V2”, “V3”으로 변경하세요.

  #vector를 사용해 특정 칼럼의 데이터만 가져와서 저장.
  iris_subset <- iris[, c("Sepal.Length", "Sepal.Width", "Species")]
  #View(iris_subset)
  names(iris_subset) <- c("V1", "V2", "V3")
  #View(iris_subset)

#3.3. iris_subset 데이터 세트의 변수명을 dplyr 패키지의 rename( ) 함수를 사용하여 
#     “Length”, “Width”, “Variety”로 변경하여 iris_subset2 변수로 저장하세요.
  
  #라이브러리 불러오기
  library(dplyr)
  # ?rename
  # 사용법 : rename(.data, new_name = old_name, ...)
  iris_subset2 <- rename(iris_subset, Length = V1, Width = V2, Variety = V3)
  
  #iris_subset2의 칼럼명만 바뀌어야한다.
  #names(iris_subset)
  #names(iris_subset2)
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  

#4. R에서 제공하는 내부 데이터 세트 중 women 데이터를 파악하고, 다음과 같이 파생 변수를 생성 하 세요.

  #4.1. women의 데이터 내부구조와 데이터 앞부분을 출력하세요.
  
  #데이터 불러오기
  data("women")
  #str로 내부 구조 파악
  str(women)
  #head명령어로 앞부분 출력
  head(women)
  
#4.2. women의 height와 weight 변수를 height_in와 weight_lb로 변수명을 변경하세요.
  
  #rename을 위한 라이브러리 불러오기
  library(dplyr)
  
  #데이터 조작하기때문에, 복사본 생성
  df_women_copy <- women
  
  #복사본에 대해 rename함수로 칼럼명 변경
  df_women_copy <- rename(df_women_copy, height_in = height, weight_lb = weight)
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
#4.3. women의 height_in와 weight_lb 값을 센티미터(cm)와 킬로그램(kg)으로 변환하여 
  #   height_cm와 weight_kg으로 파생 변수를 생성하세요. (1in = 0.24cm, 1lb = 0.453592kg)
  
  # 1inch= 0.24cm? 
  #df_women_copy$height_cm <- 2.54 * df_women_copy$height_in
  #로 문제를 풀어도 bmi의 모든 값들이 표준범위내에 존재하므로, 
  #0.24를 곱해 문제를 풀어도 모두 과체중으로 값이 나오므로 
  #문제에 큰 영향이 없다고 판단해서 주어진 수식 그대로 적용했습니다.
  
  # 파생변수를 기존변수에 수식을 적용해 생성
  df_women_copy$height_cm <- 0.24 * df_women_copy$height_in
  df_women_copy$weight_kg <- 0.453592 * df_women_copy$weight_lb
  
#4.4. women의 height_cm와 weight_kg를 이용하여 bmi 파생 변수를 생성하세요. 
#     (bmi = 체중(kg) / 신장(m) * 신장(m))
  
  #cm에 각각 0.01을 곱해 m로 변환해 제곱.
  df_women_copy$bmi <- df_women_copy$weight_kg / 
      (df_women_copy$height_cm * 0.01 * df_women_copy$height_cm * 0.01)
  
#4.5. bmi 값에 따라 비만 여부를 result 파생 변수로 생성하세요. 
#     (bmi: 20이하(저체중), 20초과25이하(표준), 25초과(과체중))
  
  #ifelse(조건식, 조건식TRUE일때 실행할 식, 조건식 FALSE일때 실행할 식)
  df_women_copy$result <- ifelse(df_women_copy$bmi <= 20, "저체중",
                                 ifelse(df_women_copy$bmi >25, "과체중",
                                        "표준"))


#5. mtcars 데이터를 이용하여 다음에 해당하는 R코드를 작성하세요.
#5.1. 엔진 실린더(cyl) 변수가 6인 데이터만 추출해보세요.

  #데이터 불러오기
  data("mtcars")
  
  #str(mtcars)
  #View(mtcars)
  #데이터프레임 저장
  df_mtcars <- as.data.frame(mtcars)
  
  #dplyr불러오기
  library(dplyr)
  
  #filter로 원하는 조건의 데이터만 추출
  #df_mtcars[df_mtcars$cyl == 6,]
  df_mtcars %>%
    filter(cyl == 6)

  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
    
#5.2. cyl가 4이고 연비(mpg)가 25보다 큰 데이터만 추출해보세요.
  
  #dplyr불러오기
  library(dplyr)
  
  #df_mtcars[df_mtcars$cyl == 4 & df_mtcars$mpg > 25,]
  df_mtcars %>%
    filter(cyl == 4 & mpg > 25)
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
#5.3. 변속기(am)가 0(automatic)인 자동차의 mpg, cyl, disp를 추출해보세요.
  
  #dplyr불러오기
  library(dplyr)
  
  #df_mtcars[df_mtcars$am == 0, c("mpg", "cyl", "disp")]
  df_mtcars %>%
    filter(am == 0) %>%
    select(mpg, cyl, disp)
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
#6. mtcars 데이터를 이용하여 다음 내용을 작성하세요.
#6.1. 연비(mpg)가 높은 순으로 자동차를 출력하세요.
  
  #dplyr불러오기
  library(dplyr)
  
  #arrange함수->기본 오름차순이므로, -로 내림차순 출력
  #desc함수로도 같은 결과 출력 가능.
  df_mtcars %>%
    arrange(-mpg)
   #arrange(desc(mpg))
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
#6.2. 엔진 실린더(cyl)를 기준으로 오름차순 정렬하고, 같은 값인 경우 연비(mpg)를 기준으로
#     내림차순 정렬하여 데이터를 출력하세요.

  #dplyr불러오기
  library(dplyr)
  
  #arrange함수에 인자를 여러개 적용하면, 선행인자로 우선 정렬 후,
  #후행인자로 같은 값에 대해 정렬한다.
  #따라서, cyl기준 오름차순정렬(cyl), 같은값은 -mpg로 정렬한다.
  df_mtcars %>%
    arrange(cyl, -mpg)
  #arrange(cyl, desc(mpg))
  
  #사용끝난 라이브러리 detach
  detach("package:dplyr", unload = TRUE)
  
