setwd("c:/r_data") #작업 디렉토리 설정 
getwd()
print(1+2)
data1 = 1
data1 = "1"

class(data1) #type 알려줌

print(1, 2, 3) # 맨 처음 한 개 처리
print('a', 'b', 'c') # 여러개 처리 불가능

cat(1, 2, 3, 4) # 여러개 처리
cat('a', 'b', 'c')

'a' # 바로 출력 

4/2 # 실수몫
5/2

4%%2 #나머지
5%%2

4%/%2 #정수몫
5%/%2

3^2 #제곱
3**2

10
100
1000
10000
100000 
1000000
2e3
3e-1
1+2
1+'2'
1 + as.numeric('2') # 강제 형변환 : as.type()
'1' + '2'
as.numeric('1') + as.numeric('2')

'data2'
# &,|

#NA, NULL
#NA : 잘못된 값이 들어오는 경우
#NULL : 값이 없을 경우

cat(1, NA, 2) # 1, NA, 2
cat(1, NULL, 2) # 1, 2

sum(1, 2, NA, na.rm = T ) # NA, na.rm = T : na를 제외
sum(1, 2, NULL) # 3


#Factor형 : 여러번 중복되어 나오는 데이터들을 각 값으로 모아서 대표값을 출력
txt1 = read.csv("factor_test.txt") # csv : colum 과 colum을 ,로 구분해서 가져오는 것
txt2 = factor(txt1$blood)
txt2

summary(txt2) # 요약

txt3 = factor(txt1$sex)
summary(txt3)

Sys.Date()
date()

class(as.Date("2019-12-16"))
as.Date("26-12-2019",format="%d-%m-%Y") # Y:4글자 y:2글자
as.Date("2019년 12월 26일", format="%Y년 %m월 %d일")
as.Date("26122019", format="%d%m%Y")

as.Date(100, origin="2019-12-26") #100일 후
as.Date(-100, origin="2019-12-26") #100일 전

as.Date("2019-12-26") - as.Date("2019-09-10")
#POSIXlt : 날짜를 년, 월, 일로 표기
#POSIXct : 날짜를 년, 월, 일, 시, 분, 초로 표기

as.Date("2019-12-26 18:20:00") - as.Date("2019-12-26 13:20:00")
as.POSIXct("2019-12-26 18:20:00") - as.POSIXct("2019-12-26 13:20:00")

install.packages("lubridate") #package 설치
library(lubridate) #라이브러리 등록

date = now()
date
year(date)
month(date, label = F)
wday(date, label = T)
date = date+days(10)
date
seq(as.Date("2019-12-26"), as.Date("2020-03-01"), "day")

al = 1, 2, 3, 4, 5, 6
al = 1:10
al = 'a':'f'
al=10; bl=20
al + bl
objects()
rm(list=ls())

#데이터 처리 객체

#동일데이터 타입 : 
#스칼라(단일 데이터 처리)
#벡터(1차원 배열, 스칼라를 여러개 합친 것)
#Matrix(2차원 배열, 벡터를 여러개 합친 것)
#배열(array, 3차원 배열, Matrix를 여러개 쌓아놓은 것)

#다른데이터 타입 :
#list : 벡터와 비슷(키, 값)형태로 저장 
#데이터 프레임 : 엑셀의 표, db의 테이블과 비슷


c(1, 2, 3, 4, 5)
c('a', 'b', 'c')
c(1, 2, 3, 'a') #숫자가 다 문자로 바뀐다.
#1. 벡터 : 1차원 배열
#2. conbine, c() 함수로 작성
#3. 하나의 자료형만 사용
#4. 결측값은 'NA'로 사용
#5. NULL은 어떤 형식도 취하지 않는 특별한 객체

v1 = c(11, 22, 33, 44, 55)
v1
v1[3] #3번째 위치만 출력
v1[-3] #3번째 위치 제외 후 출력
v1[1:4] #1~4번째 출력
v1[-2:-4] #2~4번째 제외 후 출력
v1[2] = 66 # 2번째 수정
v1
v1=c(v1, 7)
v1
v1[9]=9
v1
v1 = append(v1, 10, after=3) #after=[인덱스]
v1 = append(v1, 88, after=5)
v1 = append(v1, c(100, 110), after=5)
v1

c(1, 2, 3) + c(2, 3, 4)
v1 = c('1', '2', '3')
v2 = c(2, 3, 4)
v1 + v2
union(v1, v2) #문자와 숫자, 문자와 문자를 합칠 때 사용 union()

v1=c(1,2,3)
v2=c(2,3,4)
setdiff(v1, v2) #setdiff 차집합
intersect(v1, v2) #intersect 교집합

#벡터에 칼럼이름 지정
fruits = c(10, 20, 30)
fruits
names(fruits) = c('apple', 'banana', 'peach')
fruits

v3 = seq(1, 5) # 1~5 나열
v3
v4 = seq(-1, -10) #-1 ~ -10
v4
v5 = rep(1:3, 2) # 1부터 3까지 2번 반복
v5
v5 = rep(1:3, each=3) #1~3 각각 3번씩 반복
v5

length(v1) #길이 : length, NROW
v1
NROW(v1)

v6 = c(1, 3, 5, 7, 9) #벡터에서 특정문자 검색, %in%
4 %in% v6
3 %in% v6

#행렬 : Matrix
#1. 벡터를 여러개 합친 것
#2. 모든 컬럼과 행은 데이터형이 동일
#3. 기본적으로 열로 생성
#4. 다른 데이터 타입의 데이터를 저장할 경우 데이터 프레임을 사용
m1 = matrix(c(1, 2, 3, 4), nrow = 2, byrow = T) 
# nrow : 열 개수, byrow = T : 행우선 
m1 
m1[ ,1] #모든 행에서 1열 출력
m1[1, ] #1행의 모든 열 출력 
m1[1, 1]

m2 = matrix(c(1,2,3,
              4,5,6,
              7,8,9), nrow = 3, byrow = T)
m2
m2[ ,2]
m2[3, ]

#행 추가 : rbind()
#열 추가 : cbind()
m3 = rbind(m2, c(11,22,33))
m3 = cbind(m3, c(111, 222, 333, 444))
m3 = cbind(m3, c(1111, 2222, 3333)) #입력값이 부족하면 순환호출된다. 
m3

#칼럼명
colnames(m3) = c('1st', '2nd', '3rd', '4th', '5th')
m3

arr1 = array #가로, 세로, 높이

#list : 서로 다른 데이터 유형
l1 = list(name='홍길동',
            addr='서울',
            tel='010-',
            pay=500)
l1
l1$tel
l1[1:3]
l1$birth='2000-01-01'
l1
l1$name=c('김유신','이순신')
l1
l1$name[length(l1$name)+1]= '홍길동'
l1
l1$birth=NULL
l1
l1$name[length(l1$name)-1]= NA 
l1

#데이터 프레임 생성
#1. 벡터로부터 데이터 프레임 생성 : 각 컬럼별로 먼저 생성한 후 data.frame명령어로   모든 컬럼을 합친다.
no = c(1, 2, 3, 4)
name = c('apple', 'banana', 'peach', 'grape')
price = c(500, 200, 100, 50)
qty = c(6, 2, 4, 7)
sales = data.frame(NO=no, NAME=name, PRICE=price, QTY=qty)
sales

#2. 행렬로부터 데이터프레임 생성
sales2=matrix(c(1, 'apple', 500, 5,
                2, 'peach', 200, 2,
                3, 'banana', 100, 4,
                4, 'grape', 50, 7), nrow = 4, byrow = T)
sales2
df1 = data.frame(sales2, stringsAsFactors = F)

names(df1) = c('NO', 'NAME', 'PRICE', 'QTY')
df1

class(sales)
class(df1)
str(sales)
str(df1)

df1$QTY = as.numeric(df1$QTY)

sales$NAME
sales[,3]
sales[c(1,2), ]
sales[, c(1:3)]

subset(df1, QTY > 5)

#데이터 프레임 합치기 : rbind(), cbind(), merge()
no = c(1,2,3)
name = c('apple', 'banana', 'peach')
price = c(100, 200, 300)
df1 = data.frame(NO=no, NAME=name, PRICE=price)
df1
no = c(10, 20, 30)
name = c('train', 'car', 'ship')
price = c(1000, 2000, 3000)
df2 = data.frame(NO=no, NAME=name, PRICE=price)
df2
df3 = cbind(df1, df2)
df3
df4 = rbind(df1, df2)
df4

df1 = data.frame(name=c('apple', 'banna', 'peach'), price=c(300, 200, 100))
df2 = data.frame(name=c('apple', 'cherry', 'berry'), qty=c(10, 20, 30))
df1
df2

merge(df1, df2) #같은 것만 출력
merge(df1, df2, all = T) #모두 출력

df1
new = data.frame(name='mango', price=400)
df2 = rbind(df1,new)
df1
df2

df3 = rbind(df2, data.frame(name='berry', price=500))
df3

df4 = cbind(df3, data.frame(QTY=c(10,20,30,40,60)))
df4

# 데이터프레임에 특정 컬럼만 골라내서 새로운 형태 만들기
no = c(1,2,3,4,5)
name = c('홍길동', '이순신', '유관순', '김유신', '윤동주')
addr = c('서울', '경기', '부산', '광주', '제주')
tel = c(1111, 2222, 3333, 4444, 5555)
hobby = c('놀기', '먹기', '자기', '놀먹', '자먹')
member = data.frame(NO = no, NAME = name, ADDR = addr, TEL = tel, HOBBY = hobby)
member

mem1 = subset(member, select = c(NO, NAME, ADDR)) 
#select (NO, NAME, ADDR) 3개만 출력
mem1

mem2 = subset(member, select = c(-TEL)) # TEL 빼고 출력
mem2

colnames(mem2) = c('번호', '이름', '주소', '취미')
mem2

# nrow, ncol, names, rownames() == row.names(), colnames() = col.names()

install.packages("dplyr")
library(dplyr)

df1 = data.frame(var1 = c(1, 2, 3), var2 = c(2, 3, 2))
df1
df2 = df1
df2 = rename(df1, v2=var1)
df2

#파생 변수 
df3 = data.frame(var1 = c(4, 3, 8), var2 = c(2, 6, 1))
df3
df3$sum = df3$var1 + df3$var2
df3
df3$mean = df3$sum / 2
df3

install.packages("ggplot2")
library(ggplot2)
mpg
mpg1 = mpg
mpg1 = rename(mpg1, cityway=cty)
mpg1 = rename(mpg1, highway=hwy)
mpg1

head(mpg1, 10) #기본 6개
tail(mpg1)

list.files(recursive = T) # 리스트 목록
list.files(all.files = T) # 숨겨진 파일 포함

sc1 = scan("scan_1.txt") # 텍스트 파일을 읽어서 배열에 저장한다.
sc1

sc2 = scan("scan_2.txt", what="") #제대로 출력
sc2

sc3 = scan("scan_3.txt", what="")
sc3

sc4 = scan()
sc4

sc5 = scan(what = "")
sc5

#readline() : 한 줄 읽어들이기
in1 = readline()
in1

in2 = readline("R u ok?")
in2 

#readLines() : 파일을 배열에 저장
in3 = readLines("scan_4.txt")
in3

fruits = read.table("fruits_2.txt", header = T, skip=4)
# read.table을 통해 불러들여 데이터 프레임에 넣는다.
# haader = T,F : haeder 유무
fruits

fruits4=read.csv("fruits_4.csv",header = F)
fruits4

label = 
fruits4 = read.csv("fruits_4.csv", header = F, col.names = label) #colname 설정
fruits4

install.packages("googleVis")
library(googleVis)

install.packages("sqldf")
library(sqldf)

Fruits
write.csv(Fruits, "Fruits_sql.csv", quote = F, row.names = F) #파일을 다른 형태로 저장 
f2 = read.csv.sql("Fruits_sql.csv" , sql="select * from file where Year=2008") 
# 원하는 정보만 출력
f2

txt1 = readLines("write_test.txt")
txt1
write(txt1, "write_text2.txt")

txt1 = read.table("table_test.txt", header = T)
txt1
write.table(txt1, "table_test2.txt")

#aggregate(): 다양한 함수를 사용하여 계산결과를 출력 
#apply()
#cor() : 상관함수
#cumsum() : 누적합
#cumprom() : 누적곱
#diff() : 차이나는 부분을 찾아냄
#length() : 길이
#max() : 최대
#min() : 최소
#mean() : 평균
#median() : 중간값
#order() :
#prod() : 누적곱(범위)
#range() : 범위값 
#rank() : 순위
#rev() : 요소, 역순
#sd() : 표준편차
#sort() : 정렬
#sum() :총합
#summary() : 요약, 통계
#sweep() : 일괄차, 일괄적으로 주어진 데이터를 빼기
#tapply() : 벡터에서 주어진 함수 연산
#var() : 분산

v1 = c(1,2,3,4,5)
v2 = c('a', 'b', 'c', 'd', 'e')
max(v2)
mean(v1)
mean(v2)
sum(v2)

#agrregate() : 데이터프레임 상대로 주어진 함수값 구한다.
#agrregate(계산될 컬럼 ~ 기준될 컬럼, 데이터, 함수)
library(googleVis)
Fruits
#과일별로 판매된 수량을 sum한 결과
aggregate(Sales~Fruit, Fruits, sum)
aggregate(Sales~Fruit, Fruits, max)
#과일별 최대 판매량에 년도를 추가해서 과일별 연도별 최대 판매량 : +
aggregate(Sales~Fruit+Year, Fruits, max)

#apply() : matrix에서 유용하게 사용(행, 열을 대상으로 작업)
#apply(대상, 행/열, 적용함수)
m1 = matrix(c(1,2,3,
              4,5,6), nrow= 2, byrow = T)
m1
apply(m1, 1, sum)
apply(m1, 2, max)
apply(m1[,c(2,3)],2,sum)

#lapply(), sapply() : list처리
#lapply/sapply(대상, 적용함수)
l1 = list(Fruits$Sales)
l1
l2 = list(Fruits$Profit)
l2
lapply(c(l1, l2), max)
sapply(c(l1, l2), max)
lapply(Fruits[,c(4, 5)], max)
sapply(Fruits[,c(4, 5)], max)

#tapply()/mapply() : 데이터셋의 특정요소(factor)를 처리
#tapply(출력값, 기준컬럼, 적용함수)
#mapply(함수, 벡터1, 벡터2,...) : 벡터나 리스트를 데이터 프레임처럼 처리
Fruits
tapply(Sales, Fruit, sum)
#attach : 변수를 직접 사용하기 위한 함수
attach(Fruits)
tapply(Sales, Fruit, sum)
tapply(Sales, Year, sum)
#mapply() : 만약 데이터프레임이 아닌 벡터나 리스트형태로 데이터들이 있을 때 마치 데이터프레임처럼 연산을 해주는 함수
#단, 벡터들의 요소 개수가 동일해야한다.

v1 = c(1,2,3,4,5)
v2 = c(10,20,30,40,50)
v3 = c(100,200,300,400,500)
mapply(sum, v1, v2, v3)

#sweep() : 한꺼번에 차이 구하기 => 여러 데이터들에게 일괄적으로 기준을 적용
#벡터, 매트릭스, 배열, 데이터프레임으로 구성된 여러 데이터들에 동일한 기준 적용시켜 
#차이나는 부분을 일목요연하게 보여주는 함수

m1
a=c(2,1,1)
sweep(m1, 2, a)

#ceiling() : 버림함수, 가우스, 올림함수
v1 = c(1.2, 1.9, 2.1)
ceiling(v1)

#choose
choose(5, 3) #5*4*3 / 3*2*1

#floor : 내림함수, 주어진 수보다 작은 수 중 가장 큰 정수
floor(-3.7)

#trunc : 0과 주어진 수 사이의 가장 큰 정수
trunc(-3.7)

#사용자 정의 함수 
#함수명 = function(인수 또는 입력값){
#계산식1
#계산식2
#return(계산 결과 반환값)
#}

f1 = function(a,b){
  b = a^2  
  return(b)
}
f1 #함수 형태
f1() # 함수 호출

f1(3,2)
s1 = Fruits$Sales
s1 
sort(s1)#!오름차 
sort(s1, decreasing = T) #내림차

#plyr() : 원본데이터를 분석하기 쉬운 형태로 나누어서 다시 새로운 형태로 만들어주는 패키지
#ply() : 앞에 2글자 : 첫글자  => 입력될 데이터 유형, 두번째글자 => 출력될 데이터 유형
#d : dataframe, a: array(matrix포함), l:list
#ddply(), alply()
#ddply(데이터, 기준컬럼, 함수 또는 결과물), alply()
setwd("c:/r_data")
install.packages("plyr")
library(plyr)
fruits=read.csv("fruits_10.csv", header = T)
fruits

#summarise : 기준컬럼의 데이터끼리 모은 후 함수를 적용해서 출력(group by)
ddply(fruits, 'name', summarise, sum_qty=sum(qty), sum_price=sum(price))
ddply(fruits, 'name', summarise, max_qty=max(qty), min_price=min(price))
ddply(fruits, c('year', 'name'), summarise, max_qty=max(qty), max_price=max(price))

#transform : 동일한 값의 합계가 아닌 각 행 별로 연산을 수행해서 해당 값을 함께 출력
ddply(fruits, 'name', transform, sum_qty=sum(qty), pct_qty=round(qty/sum(qty)*100,2))

#dplyr() 패키지
#특징 :
#1. filter : 조건을 주어서 필터링한다.
#2. select : 여러 컬럼이 있는 데이터셋에서 특정 컬럼만 선택해서 사용한다
#3. arrange : 데이터들을 오름차순, 내림차순으로 정렬
#4. mutate : 기존의 변수를 활용해서 새로운 변수 생성
#5. summarise : 주어진 데이터를 집계(min, max, mean, count)
library(dplyr)
data1 = read.csv("2013년_프로야구선수_성적.csv")
data1

data2 = filter(data1, 경기 >= 120 & 득점 >= 80)
data2

data3 = filter(data1, 포지션 %in% c('1루수', '3루수'))
data3

select(data1, 팀, 선수명, 포지션)
select(data1, 순위:타수) #연속적인 데이터
select(data1, -홈런, -타점)

#여러 문장을 조합해서 사용하는 명령어 %>%

data1 %>% select(선수명, 팀, 경기, 타수) %>% filter(타수>=400)
data1 %>% select(선수명, 팀, 경기, 타수) %>% filter(타수>=400) %>% arrange(desc(타수))
data1 %>% select(선수명, 팀, 경기, 타수) %>% mutate(경기X타수=경기*타수) %>% arrange(경기X타수)
data1 %>% select(선수명, 팀, 안타, 타수) %>% mutate(안타율=round(안타/타수,3)) %>% arrange(안타율)
data1 %>% group_by(팀) %>% summarise(avarage=mean(경기), na.rm = T)

data1 %>% group_by(팀) %>% summarise_each(list(mean=mean), 경기, 타수)
data1 %>% group_by(팀) %>% summarise_each(funs(mean=mean), 경기, 타수)

#결측치
#누락된 값, 비어있는 값
#함수 적용 불가, 분석 결과 왜곡
#제거 후 분석 심사
df = data.frame(sex = c('M', 'F', NA, 'M', 'F'),
                score = c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df$sex))

mean(df$sex)

df1 = df %>% filter(!is.na(score) & !is.na(sex))
df %>% filter(!is.na(sex))
mean(df1$score)
df1
df1 = df %>% filter(!is.na(score) & !is.na(sex))
df2 = na.omit(df)
df2

mean(df$score, na.rm = T)

exam = read.csv("csv_exam.csv")
exam[c(3, 8, 15), 'math']=NA
exam

exam %>% summarise(mean_math=mean(math, na.rm = T),
                   sum_math=sum(math, na.rm = T),
                   median_math=median(math, na.rm = T),)
#결측치 대체
#다른값으로 채워넣기
#대체법 : 대표값(평균, 최빈값)으로 일괄 대체
#적용 : 통계 분석 기법, 예측 값 추정
mean(exam$math, na.rm=T)
exam$math=ifelse(is.na(exam$math), 55, exam$math)
exam
table(is.na(exam$math))

#이상치 : 정상범주에서 크게 벗어난 값
#이상치 포함시 분석결과 왜곡
#결측처리 후 제외하고 분석
df = data.frame(sex=c(1, 2, 1, 3, 2, 1), 
                score=c(5, 4, 3, 4, 2, 6))
df
table(df$sex)
table(df$score)
boxplot(df$sex)

df1 = df$sex = ifelse(df$sex==3, NA, df$sex)
df1 = df$score = ifelse(df$score>5, NA, df$score)
df 
df %>% filter(!is.na(sex)&!is.na(score)) %>% group_by(sex) %>% summarise(mean_score=mean(score))
df %>% filter(!is.na(sex)&!is.na(score)) %>% group_by(sex) %>% summarise_each(funs(mean),score)

library(ggplot2)
boxplot(df$sex)


#데이터 분석
#1. 패키지 준비
#2. 데이터 준비
#3. 데이터 검토
#4. 변수명 바꾸기 
#5. 데이터 분석
# 1단계 : 변수검토 및 전처리
# 2단계 : 변수간 관계분석
#6. 시각화

install.packages("foreign")
library(foreign)
install.packages("readxl")
library(readxl)

wf = read.spss(file="Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
wf1 = wf
wf1
head(wf1)
View(wf1)
dim(wf1)
str(wf1)
summary(wf1)
wf1 = rename(wf1, 
             sex=h10_g3,
             birth=h10_g4,
             marriage=h10_g10,
             religion=h10_g11,
             income=p1002_8aq1,
             code_job=h10_eco9,
             code_region=h10_reg7)
class(wf1$sex)
table(wf1$sex)
table(is.na(wf1$sex))

wf1$sex=ifelse(wf1$sex==9, NA, wf1$sex)
table(is.na(wf1$sex))
wf1$sex = ifelse(wf1$sex==1, 'male', 'female')
table(wf1$sex)
qplot(wf1$sex)

class(wf1$income)
summary(wf1$income)
hist(wf1$income)
qplot(wf1$income) + xlim(0,1000)

wf1$income = ifelse(wf1$income %in% c(0, 9999), NA, wf1$income)
table(is.na(wf1$income))
sex_in = wf1 %>% filter(!is.na(income)) %>% group_by(sex) %>% summarise(mean_income=mean(income))
sex_in
ggplot(data=sex_in, aes(x=sex, y=mean_income))

class(wf1$birth)
summary(wf1$birth)
qplot(wf1$birth)
table(is.na(wf1$birth))
wf1$birth=ifelse(wf1$birth==9999, NA, wf1$birth)
table(is.na(wf1$birth))
wf1$age = 2019-wf1$birth+1 
summary(wf1$age)
qplot(wf1$age)

#나이에 따른 월급 통계표
age_in = wf1 %>% filter(!is.na(income)) %>% group_by(age) %>% summarise(mean_income=mean(income))
age_in
head(age_in, 20)
ggplot(data=age_in, aes(x=age, y=mean_income)) + geom_line()


install.packages("reshape2")
library(reshape2)

melt(fruits, id=c("year", "name")) # melt : wide를 long형태로 변경
melt(fruits, id=c("year", 'name'), variable.name = 'var_name', value.name = 'val_name')

mtest = melt(fruits, id=c('year', 'name'), variable.name = 'var_name', value.name = 'val_name')
mtest

dcast(mtest, year+name~var_name)
dcast(mtest, year~var_name)

#string() 패키지 : 작업할 대상 데이터가 문자일 경우
install.packages("stringr")
library(stringr)

#str_detect() : 탐색
fruits = c('apple', 'Apple', 'banana', 'pineapple')
str_detect(fruits, 'A')
str_detect(fruits, '^a') #첫문자 a
str_detect(fruits, 'e$') #끝문자 e
str_detect(fruits, '^[aA]') #첫문자 a, A
str_detect(fruits, '[aA]') # a, A 포함

#ignore.case()
str_detect(fruits, ignore.case('a'))
aa = 'a'
str_detect(fruits, fixed(aa, ignore_case = T))

p = 'a.b'
s=c('abb', 'a.b')
str_detect(s, p)
str_detect(s, fixed(p))
str_detect(s, coll(p))

fruits
str_count(fruits, fixed('A', ignore_case = T))
str_count(fruits, 'a')
str_c('apple', 'pen')
str_c('FRUIT : ', fruits)
str_c(fruits, " name is ", fruits)
str_c(fruits, collapse = ",")

str_dup(fruits, 3) #duplication 반복

str_length('apple')
str_length(fruits)

str_locate('apple', 'a')
str_locate(fruits, 'a')

str_replace('apple', 'p', '*') #첫 변경
str_replace_all('apple', 'p', '*') #전체 변경

str_split('apple', 'l') # 구간 나누기

fruits=str_c('apple', '/', 'banana', '/', 'cherry')
str_split(fruits, '/')

str_sub(fruits, start = -6) #자르기 

str_trim('            apple        banana        cherry           ') #앞 뒤 공백제거, 가운데 (x)

library(sqldf)
library(googleVis)
Fruits
sqldf('select * from Fruits where Fruit = "Apples"')
sqldf('select * from Fruits limit 5')

f1 = function(x) {
  if(x<0){
    return (-x)
  }
  else if(x==0){
    x = 0
    return (x)
  }
  else {
    x = x*2
    return (x)
  }
}

f1(-2)
f1(2)
f1(0)

no = scan()
ifelse(no%%2==0, "짝수", "홀수")

no = 0
while(no<5){
  no = no +1
  if(no==3){
    next
  }
  print(no)
  }

f2 = function(x) {
  i = 0
  for (j in 1:x){
    i = i+j
    print(i)
  }
}
f2(100)

f3=function(x, y) {
  if((x>1)&&(y>1)){
    z = x*y
    return(z)}
  else{
    z = x+y
    return(z)
  }
}

f3(2,4)
f3(-1, 3)

c1 = c('apple', 'Apple', 'APPLE', 'banana', 'grape')
c2 = c('apple', 'Appele2', 'orange', 'cherry')
grep(c2, c1)
grep(paste(c2, collapse = '|'), c1, value = T)
grep('pp', c1, value = T) # pp포함
grep('^A', c1, value = T) # 첫 A
grep('e$', c1, value = T) # 끝 e
grep('[[:upper:]]', c1, value = T) #대문자 포함 
nchar(c1) #문자열의 길이
nchar('홍길동')
paste('a','"', 'b', 'c', sep='/')
substr('abc123', 3, 5) #3번째-5번째 출력
strsplit("2019/12/27", split = '/')
regexpr('-', '010-1111-1111')
