a = 87
b = 'str'
a
b

c = 'test'
c
# + - / * ^ %/%(몫) %%(나머지)
d = 1
a + d


a ^ 2
a > b
a < b
a == b
a != b

b > 0

(a > 0 & d > 0)

 
x1 <- c(1, 2, 3)
x1
class(x1)
x2 <- c("a", "b", "c")
class(x2)
x3 <- c(1, "2", 3, 4)
class(x3)
x4 <- c(T, F, F)
class(x4)
f1 = factor(x2)
class(f1)

x5 <- factor(c(1, 2, 3))
x5

v1 <- c(1,2,3,4,5)
v1
class(v1)

v2 <- c(1, 'a')
v2
class(v2)

v3 <- c("seoul", "daejeon")
v3
class(v3)

v4 <- c(1:3)
v4

v5 <- seq(1, -10, -1)
v5

v6 <- rep(v5, 20)
v6
v6[14]

f2 <- c(1:3)
f2
f3 <- rep(f2, times = 2)
f3
f4 <- rep(f2, each = 2)
f4




g1 <- c("aaa", "seoul", 80)
g1
g2 <- list("aaa", "seoul", 80)
g2
class(g1)
class(g2)
str(g1)
str(g2)


g3 <- list(name = "aaa", region = "seoul", region = c(80, 95, 90))
g3

g3["name"]
g3["region"]
g3[1]
g3[2]
g3[3]

g3[["name"]]
g3[[1]]
g3[[2]]
g3$name
g3$region


## dataframe

# 1. 각 칼럼을 벡터로

name <- c("aaa", "bbb", "ccc")

major <- c("경영학과", "물리", "영문")

grade <- c(4,3,2)
score <- c(4.2, 3.7, 3.5)
student <- data.frame(name, major, grade, score)
student

write.csv(student, file = "student.csv")
df <- read.csv("student.csv")
df