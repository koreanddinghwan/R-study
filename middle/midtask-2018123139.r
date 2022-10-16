#1.1 ggplot2 패키지 안에 있는 실습데이터 msleep를 df_ms라는 이름의 데이터 프레임 형태로 불러오세요.

#data frame 형태로 저장
#패키지의 namespace로 접근한다.
df_ms <- as.data.frame(ggplot2::msleep)
df_ms

#1.2 msleep의 도움말(매뉴얼)을 살펴보세요. 데이터와 각 변수에 대한 설명을 보고 
    #정리해서 간단히 주석으로 남기도록 하세요.
    #(참고로 ggplot2패키지를 로드하지 않았다는 가정 하에 진행하세요).

?msleep

#표유류의 수면 데이터셋의 확장, 업데이트버전
#표유류별 이름, 육식-초식-잡식인지, 생물 분류시 사용되는 목과
#동물의 보존 상태, 시간단위의 총 수면시간, 렘수면 시간, 수면 사이클과 깨는데 걸리는 시간,
#키로그램 단위의 뇌 용량과 몸무게 등에 대한 정보를 가지고 있다.


#1.3 데이터 파악하기에서 배운 모든 함수를 사용해서 데이터를 파악하세요. 
    #이때 출력된 결과를 보고 파악 한 내용을 간단히 주석으로 남기도록 하세요.
    #특히 데이터 내부구조를 반드시 확인하여 기재하세요.

#get first part of object
#?head
head(df_ms, n = 5)
#데이터셋 상단 5개의 데이터에는 치타부터 소의 데이터가 있는데, 
#Owl monkey의 보존상태는 결측되어있다.
#상위 치타부터 Mountain beaver의 수면사이클 데이터는 결측되어있으며
#치타의 렘수면 시간, 뇌용량 그리고 Mountain beaver의 뇌용량이 결측되어있다.

#get last part of object
#?tail
tail(df_ms, n = 5)
#하위 5개 데이터는 보존상태가 모두 결측되어있다.
#Bottle-nosed dolphin은 램수면, 수면싸이클, 뇌용량 데이터가 결측,
#Genet은 수면사이클 데이터가 결측,
#Arctic fox는 렘수면과 수면사이클 데이터가 결측되어있다.

#get or set dataset names
#?names
names(df_ms)
#dataframe의 column 값을 알려준다.  총 11개의 칼럼값이 있다.

#display dataset internal structure
#?str
#dataframe의 내부 구조를 알려준다. 11개의 변수(column)과 83개의 객체가 있다.
#column별로 어떤 type의 데이터가 있고, 어떤 값이 들어있는지 보여준다.
str(df_ms)

#get dataset data dimension
#?dim
dim(df_ms)
#dataframe을 위한 메서드 중 하나로
#행의 갯수와 열의 개수를 리턴한다.
#83개의 객체가 있으며 각각 11개의 속성을 가진다.

#get object summaries
#?summary
summary(df_ms)
#각 속성별로 요약데이터를 얻을 수 있다.
#몸무게데이터, 뇌용량 데이터의 최소값과 최대값 차이가 크며.
#렘수면, 수면사이클, 뇌용량 데이터의 결측치가 존재하는 것을 알 수 있다.
#특히 수면사이클 결측치가 전체 데이터83개의 절반 이상이다.

#2.1 모든 변수에 대하여 각각 결측치가 있는 변수인지 확인하세요.

#table(is.na(df_ms))
#names(df_ms)
table(is.na(df_ms$name))
table(is.na(df_ms$genus))
table(is.na(df_ms$vore))
table(is.na(df_ms$order))
table(is.na(df_ms$conservation))
table(is.na(df_ms$sleep_total))
table(is.na(df_ms$sleep_rem))
table(is.na(df_ms$sleep_cycle))
table(is.na(df_ms$awake))
table(is.na(df_ms$brainwt))
table(is.na(df_ms$bodywt))

#2.2 변수의 데이터타입이 문자열(chr)로 되어 있는 변수 중에 결측치가 있는
    #변수에 대해서 결측치들을 “Unknown”으로 변환하세요.

#summary(df_ms)
#name, genus, vore, order, conservation

# 칼럼값에 대해 결측치를 Unknown으로 바꾸하는 함수
fnc_na_to_unknown <- function(origin) {
	changed <- ifelse(is.na(origin), "Unknown", origin)
	return(changed)
}

df_ms$name <- fnc_na_to_unknown(df_ms$name)
df_ms$genus <- fnc_na_to_unknown(df_ms$genus)
df_ms$vore <- fnc_na_to_unknown(df_ms$vore)
df_ms$order <- fnc_na_to_unknown(df_ms$order)
df_ms$conservation <- fnc_na_to_unknown(df_ms$conservation)

table(is.na(df_ms$name))
table(is.na(df_ms$genus))
table(is.na(df_ms$vore))
table(is.na(df_ms$order))
table(is.na(df_ms$conservation))


#2.3 극단치가 있는지 확인이 필요한 모든 변수에 대해 각각 극단치를 확인하세요.

#sleep_total, sleep_rem, sleep_cycle, awake, brainwt, bodywt
#위 변수들은 numeric이므로 극단치 확인
#boxplot으로 극단치 확인

library(ggplot2)
boxplot(df_ms$sleep_total)#x
boxplot(df_ms$sleep_rem)#존재
boxplot(df_ms$sleep_cycle)#존재
boxplot(df_ms$awake)#x
boxplot(df_ms$brainwt)#존재
boxplot(df_ms$bodywt)#존재

#2.4 극단치가 있는 변수 중 무게(wt)와 관련된 변수는 이 결측치 작업을 할 필요가 없습니다.
    #나머지 극단치가 있는 변수에 대해서 결측치 처리를 한 뒤, 결측치의 수를 확인하세요.

#sleep_cycle, sleep_rem
#결측치 처리 함수 정의
#boxplot->stats 사용
convert_extreme_na <- function(variable){
	list_boxplot_stats <- boxplot(variable)$stats
	value_min <- list_boxplot_stats[1, ]
	value_max <- list_boxplot_stats[5, ]
	variable <- ifelse(
				 variable < value_min | variable > value_max,
				 NA, variable)
	return(variable)
}

df_ms$sleep_cycle <- convert_extreme_na(df_ms$sleep_cycle)
table(is.na(df_ms$sleep_cycle))

df_ms$sleep_rem <- convert_extreme_na(df_ms$sleep_rem)
table(is.na(df_ms$sleep_rem))


#3.1 총수면량에서 렘(rem)수면량을 제외한 비렘수면량(sleep_nonrem)을 파생변수로 만들어 보세요.

#sleep_total은 결측치 없으므로, ifelse로 sleep_rem에만 결측치인지 확인.
#table(is.na(df_ms$sleep_total))
#table(is.na(df_ms$sleep_rem))

library(dplyr)

#mutate사용해 파생변수 생성
df_ms <- df_ms %>%
	mutate(sleep_nonrem = ifelse(
			is.na(df_ms$sleep_rem),
			NA,
			df_ms$sleep_total - df_ms$sleep_rem)
	)

#df_ms

#3.2 총수면량과 렘(rem)수면량, 비렘수면량에 대해서 분 단위(in hours to minutes)로
    #계산된 파생변수를 각각 만들어 보세요.(기존 변수명 뒤에 '_min'을 붙이세요).
    #시간 단위로 되어 있는 변수를 분 단 위 변수로 변경할 때 수식에 유의하도록 하세요

#sleep_rem_min 
#table(is.na(df_ms$sleep_total))
#table(is.na(df_ms$sleep_rem))
#table(is.na(df_ms$sleep_nonrem))
#시간 -> 분단위 변환 = 시간 * 60

df_ms <- df_ms %>% 
	mutate(sleep_total_min = ifelse(
			is.na(df_ms$sleep_total),
			NA,
			df_ms$sleep_total * 60)
	) %>% 
	mutate(sleep_rem_min = ifelse(
			is.na(df_ms$sleep_rem),
			NA,
			df_ms$sleep_rem * 60)
	) %>%
	mutate(sleep_nonrem_min = ifelse(
			is.na(df_ms$sleep_nonrem),
			NA,
			df_ms$sleep_nonrem * 60)
	)

df_ms

#4.1 식성 구분(육/잡/초/충/모름)이 들어 있는 변수의 각 식성별 빈도수를 빈도표로 확인해보세요.

#table함수는 빈도표생성
table(df_ms$vore)

#4.2 잡식동물(omni)의 총수면량(분 단위), 렘수면량(분 단위), 비렘수면량(분 단위)을 
	#내장함수를 사용하는 방법과 dplyr 패키지 방식을 각각 사용하여 추출해보세요

df_ms[df_ms$vore == "omni",][c("sleep_total_min",
							   "sleep_rem_min",
							   "sleep_nonrem_min")]

df_ms %>%
	filter(vore == "omni") %>%
	select(sleep_total_min, sleep_rem_min, sleep_nonrem_min)

#4.3 식성 구분(육/잡/초/충/모름)별로 총수면량(시간 단위)의 평균을 
    #내장함수를 사용하는 방법과 dplyr 패키지 방식을 각각 사용하여 구해보세요.

#sleep_total 결측치 없음.
#mean 함수를 통해 평균값 계산

mean(df_ms[df_ms$vore == "carni", "sleep_total"])
mean(df_ms[df_ms$vore == "omni", "sleep_total"])
mean(df_ms[df_ms$vore == "herbi", "sleep_total"])
mean(df_ms[df_ms$vore == "insecti", "sleep_total"])
mean(df_ms[df_ms$vore == "Unknown", "sleep_total"])

#dplyr::summarise함수를 통해 계산
df_ms %>%
	group_by(vore) %>%
	summarise(mean_sleep_total = mean(sleep_total))

#4.4 식성 구분(육/잡/초/충/모름)별 총수면량(분 단위)을 막대그래프로 나타내보세요. 
    #이때 막대그래프는 평균이 높은 순으로 보여지게 하세요.

ggplot(
	data = df_ms %>%
		group_by(vore) %>%
		summarise(mean_sleep_total_min = mean(sleep_total_min)),
	aes(x = reorder(vore, -mean_sleep_total_min),
		y = mean_sleep_total_min)
	) + geom_col()


#5.1 아래의 표는 멸종 위협에 대해서 High와 Low, Non으로 구분한 표입니다.
    #red_list라는 이름의 데 이터 프레임으로 만들어보세요.

red_list <- data.frame(
					conservation = c("en", "vu", "nt", "cd", "lc", "domesticated"),
					risk = c("high", "high", "low", "low", "low", "non")
)

#red_list
#class(red_list)

#5.2 red_list 데이터 프레임을 활용하여 df_ms 데이터에 risk 라는 변수가 오른쪽에 파생변수로 추가 되도록 하세요.

#df_ms 데이터 사라지지않게 left_join사용
df_ms <- left_join(df_ms, red_list, by = "conservation")
df_ms

#5.3 멸종 위기 수준(high/low/non)에 따라 깨어있는 시간의 평균, 중앙값, 최소값, 최대값, 빈도를 구해보세요.

#결측치확인
#table(is.na(df_ms$awake))

df_ms %>%
	filter(!is.na(risk)) %>%
	group_by(risk) %>%
	summarise(mean_awake = mean(awake),
			  median_awake = median(awake), 
			  min_awake = min(awake), 
			  max_awake = max(awake), 
			  cnt = n(),
	)

#5.4 멸종 위기 수준(high/low/non)에 따라 렘수면(분 단위)의 평균, 중앙값, 최소값, 최대값, 빈도를 구해보세요.

#결측치확인
#table(is.na(df_ms$sleep_rem_min))

#결측치 존재하므로, na.rm = TRUE로 통계
df_ms %>%
	filter(!is.na(risk)) %>%
	group_by(risk) %>%
	summarise(mean_rem_min = mean(sleep_rem_min, na.rm = TRUE),
			  median_rem_min = median(sleep_rem_min, na.rm = TRUE),
			  min_rem_min = min(sleep_rem_min, na.rm = TRUE),
			  max_rem_min = max(sleep_rem_min, na.rm = TRUE),
			  cnt = n(),
	)

#6.1 가축(domesticated)만 추출해서 몸무게(x축)와 뇌 무게(y축)를 산점도로 나타내보세요.

#filter by conservation == "domesticated"
#select only bodywt, brainwt

#using geom_point, x = bodywt, y = brainwt
ggplot(data = df_ms %>%
	filter(conservation == "domesticated") %>%
	select (bodywt, brainwt), 
	aes(x = bodywt, y = brainwt)
	) + geom_point()


#6.2 몸무게 중 뇌 무게의 백분율을 나타내는 brain_ratio 라는 파생변수를 만들어보세요.
    #백분율에 유 의하세요. 이때, 소수점 아래 두자리까지 표시되도록 반올림하세요.

#define function to get brain ratio
get_brain_ratio <- function(brainwt, bodywt) {
	return (round((brainwt / bodywt) * 100, digit = 2))
}

df_ms <- df_ms %>%
	mutate(brain_ratio = get_brain_ratio(brainwt, bodywt))

#7.1 제공된 mammal_theria CSV파일을 불러오세요. 
    #(변수명 일부가 깨져서 나온다면 fileEncoding="UTF-8-BOM" 파라미터를 설정하세요.)

df_mth <- read.csv("mammal_theria.csv", header = TRUE)

#7.2 df_ms 데이터에 두 분류 칼럼 theria_main와 theria_sub이 오른쪽에 파생변수로 추가되도록 하세요.

#table(is.na(df_ms$order))
#결측치 없으므로, order를 key값으로 join
df_ms <- left_join(df_ms, df_mth, by = "order")

#7.3 로라시아상목(Laurasiatheria)과 영장상목(Euarchontoglires)만 추출하여 
    #가장 많은 분류명(order) 을 5개 출력하세요. 
    #이때 상위 5위부터 상위 1위까지 순서로 보여지도록 하세요.

#filter로 조건에 맞는 행 추출, order로 groupby이후, n()으로 groupby함수로 묶인 항목별 갯수 생성, -cnt로 오름차순 정렬 후, 하위5위부터 1위까지 출력 
df_ms %>%
	filter(theria_sub == "Laurasiatheria" |
		   theria_sub == "Euarchontoglires") %>%
	group_by(order) %>%
	summarise(cnt = n()) %>%
	arrange(cnt) %>%
	tail(n = 5)

#8.1 총수면량(시간 단위)을 아래와 같이 구분하는 sleep_grade 변수를 추가하세요. 
    #각각 몇 동물씩 있는지 빈도표를 확인해보세요.

df_ms <- df_ms %>%
	mutate(sleep_grade = ifelse(df_ms$sleep_total >= 15, "A",
							ifelse(df_ms$sleep_total >= 10, "B", 
								ifelse(df_ms$sleep_total >= 5, "C",
									"D")
								)
							)
	)

#table함수로 빈도표 확인
table(df_ms$sleep_grade)

#8.2 총수면량 중 비렘수면의 백분율을 나타내는 nonrem_ratio 라는 파생변수를 
    #dplyr 사용하여 만들어보세요.

#table(is.na(df_ms$sleep_nonrem))
#table(is.na(df_ms$sleep_total))

get_nonrem_ratio <- function(sleep_total, sleep_nonrem) {
	return((sleep_nonrem / sleep_total) * 100)
}

#sleep_nonrem 결측치 존재하므로, ifelse사용
df_ms <- df_ms %>%
	mutate(nonrem_ratio = ifelse(is.na(df_ms$sleep_nonrem),
								 NA,
								 get_nonrem_ratio(df_ms$sleep_total, df_ms$sleep_nonrem)))

View(df_ms)
#8.3 수면량 등급별 비렘수면 백분율을 막대그래프로 나타내보세요. 
    #이때 막대그래프는 평균이 낮은 순으로 보여지게 하세요.

#?geom_col()
#table(is.na(df_ms$nonrem_ratio))
#group_by sleep_grade해서 nonrem_ration를 mean_nonrem으로 구한다.
ggplot(
	data = df_ms %>%
		group_by(sleep_grade) %>%
		summarise(mean_nonrem = mean(nonrem_ratio, na.rm = TRUE)),
	aes(x = reorder(sleep_grade, mean_nonrem),
		y = mean_nonrem)) + geom_col()

#8.4 식성 구분(육/잡/초/충/모름)별 비렘수면 백분율을 막대그래프로 나타내보세요. 
    #이때 막대그래프 는 평균이 낮은 순으로 보여지게 하세요.
#names(df_ms)

ggplot(
	data = df_ms %>%
		group_by(vore) %>%
		summarise(mean_nonrem = mean(nonrem_ratio, na.rm = TRUE)),
	aes(x = reorder(vore, mean_nonrem),
		y = mean_nonrem)) + geom_col()

#9.1 사람(Human)의 뇌무게 백분율을 확인하여 human_brainwt 이라는 변수에 할당하세요. 
    #이때 숫자를 직접입력하는 방식을 사용하지 말고 해당하는 값이 할당되도록 하세요.

#names(df_ms)
human_brainwt <- c(df_ms[df_ms$name == "Human",]["brain_ratio"])
human_brainwt

#9.2 human_brainwt보다 뇌무게 백분율이 높은 그룹을 "High", 낮은 그룹을 "Low", 
#기준이되는 사람과 같은 값은 "Human" 이라고 판별한 brain_grade 라는 변수를 만들어서
#해당 변수별로 총수면량(시 간 단위)의 최소값, 중앙값, 평균, 최대값, 빈도를 출력하세요.

df_ms <- df_ms %>%
	mutate(brain_grade =
					ifelse(is.na(df_ms$brain_ratio), NA,
						ifelse(df_ms$brain_ratio > human_brainwt, "High",
							ifelse(df_ms$brain_ratio == human_brainwt, "Human",
								"Low")))
)

df_ms %>%
	filter(!is.na(brain_grade)) %>%
	group_by(brain_grade) %>%
	select(sleep_total) %>%
	summarise(
			min_sleep_total = min(sleep_total),
			median_sleep_total = median(sleep_total),
			mean_sleep_total = mean(sleep_total),
			max_sleep_total = max(sleep_total),
			cnt = n())

detach("package:ggplot2", unload = TRUE)
detach("package:dplyr", unload = TRUE)
