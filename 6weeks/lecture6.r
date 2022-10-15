data("WorldPhones")
?WorldPhones
class(WorldPhones)

wwp <- as.data.frame(WorldPhones)
View(wwp)

library(ggplot2)
View(mpg)

View(mtcars)


# 행이름 핸들링

# 1번째 칼럼 단순 칼럼으로
wwp2 <- read.csv("wwp.csv")
wwp2

# 1번째 칼럼 행이름으로.
wwp2 <- read.csv("wwp.csv", row.names = 1)
wwp2

library(dplyr)

# 행이름이 달라서 이상함.
wwp_all <- bind_rows(wwp, wwp2)
View(wwp_all)

# 행이름 컨트롤
library(tibble)
# 행이름 있나?
has_rownames(wwp)
has_rownames(mpg)


# 행이름 제거
wwp_new <- wwp
wwp_new
wwp_new <- remove_rownames(wwp_new)
wwp_new

wwp_new <- rownames_to_column(wwp, var = "year")
wwp_new

wwp2 <- rownames_to_column(wwp2, var = "year")
wwp2

wwp_all <- bind_rows(wwp_new, wwp2)
wwp_all

# 칼럼을 행이름으로
wwp_all  <- column_to_rownames(wwp_all, var = "year")
View(wwp_all)


mpg
# 행 숫자를 칼럼으로
rowid_to_column(mpg)


pie(
 c(30, 55, 40)
)

df <- c(30, 55, 40)

pie(
 df,
 labels = c("A", "B", "C"),
 col = c("red", "blue", "green"),
 main = "회사별 판매량",
 clockwise = TRUE,
 init.angle = 90
)


data("Titanic")
class(Titanic)

tt  <- as.data.frame(Titanic)
tt
library(dplyr)
df_sur <- tt %>%
 filter(Survived == "Yes") %>%
 group_by(Class) %>%
 summarise(total = sum(Freq))

pie(
df_sur$total,
labels = df_sur$Class,
main = "Titanic survivor",
col = c("blue", "green", "yellow", "red"),
init.angle = 90,
clockwise = TRUE)

df  <- data.frame(
  var1 = c("A","B","C"),
  var2 = c(4,6,5)
)

df

library(ggplot2)

ggplot(
 data = df,
 aes(x = reorder(var1, -var2), y = var2)) + geom_col()


df_sur

ggplot(
	   data = df_sur,
	   aes(x = Class, y = total)) + geom_col()
)

ggplot(
	   data = df_sur,
	   aes(x = reorder(Class, -total), y = total)) + geom_col()
)

?xlim
df <- data.frame(
	var1 = c(1,1,1,2,2,3,3,3,3),
	var2 = c(4,4,5,5,5,5,2,2,2)
)

ggplot(data = df, aes(x = var1)) + geom_bar()
ggplot(data = df, aes(x = var2)) + geom_bar()

View(diamonds)

ggplot(data = diamonds, aes(x = cut)) + geom_bar()

ggplot(data = diamonds, aes(x = carat)) + geom_histogram() + xlim(0, 3)
ggplot(data = diamonds, aes(x = carat)) + geom_histogram()

hist(diamonds$carat)

df <- data.frame(var1 = c(1,2,3,4,5,6), var2=c(10,5,8,6,7,9))
ggplot(data = df, aes(x = var1, y = var2)) + geom_line()

df_cnt <- diamonds %>%
	group_by(carat) %>%
	summarise(cnt = n())

ggplot(data = df_cnt, aes(x = carat, y = cnt)) + geom_line() + xlim(0,4)


df <- data.frame(
 var1 = c(1,1,4,2,2,3,1,2),
 var2 = c(5,6,8,7,5,7,8,5)
)

ggplot(data = df, aes(x = var1, y = var2))  + geom_point()

data("iris")
str(iris)
ggplot(
	   data = iris, 
	   aes(x = Sepal.Length, 
		   y = Sepal.Width, 
		   color = Species)
	   ) + geom_point()

ggplot(data = iris, aes(x = Species, y = Sepal.Width, color = Species)) + geom_boxplot()


# 1. ggplot diamonds 가져올때는 data("diamonds") | 

# df_dia <- as.data.frame(ggplot2::diamonds)
