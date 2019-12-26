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
label = c('NO', 'NAME', 'PRICE', 'QTY')
fruits4 = read.csv("fruits_4.csv", header = F, col.names = label)
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
