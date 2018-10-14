cpi.df <- data.frame(Country = c('New Zealand', 'Denmark', 'Finland', 'Sweden', 'Singapore', 'Norway', 'Netherlands', 'Australia', 'Switzerland', 'Canada', 'Luxembourg', 'Hong Kong', 'Iceland', 'Germany', 'Japan', 'Austria'), 
                     CPI = c(9.5, 9.4, 9.4, 9.3, 9.2, 9.0, 8.9, 8.8, 8.8, 8.7, 8.5, 8.4, 8.3, 8.0, 8.0, 7.8))
cpi.df

#RLecture01.pdf
#1.
sink('filename.txt', split = T) # redirecting TEXT output
# split = T     sends output to both file and console
# split = F     sends output to file only
sink() # closes file

#RLecture02.pdf
#1.
objects()
ls() #display contents of workspace 

#2.
#script commands to save and load workspaces
save.image('DemoWorkspace.RData')
load('DemoWorkspace.RData')

#3.
#remove
rm('') #remove single item
rm(list=ls()) #remove everything

#4.
class('objectname') #reveals object structure
mode('objectname') # reveals data type
summary('objectname') # additional info depending on class of object
str('objectname') # structure of R object
length('objectname') # number of values

#RLecture02.pdf
# 1. exponential
2**3
2^3 #both work

# 2. create series
1:10

# 3. test if X is TRUE
isTRUE(1==1)

#RLecture03.pdf
# 1. accessing vector
nyy.vector = cbind(c('A-Rod', 'D.Jeter', 'R.Cano', 'J.Giambi', 'B.Williams', 'J.Posada', 'M.Hideki', 'A.Judge', 'M.Mussina'), 
                   c('3B', 'SS', '2B', '1B', 'CF', 'C', 'LF', 'RF', 'P'))
nyy.vector
nyy.vector[1,2]
nyy.vector[3,2]
nyy.df = data.frame(nyy.vector)
nyy.df[1,2]

matrix(1:12, nrow = 4, ncol = 4, byrow = T)
matrix(1:12)
matrix(1:12, nrow = 2)
matrix(1:12, ncol = 3)
matrix(1:12, nrow = 3, byrow = T)

mat1 = matrix(1:30, ncol = 3)
mat1

mat1[2,3]
mat1[1:2, 2:3]
mat1[2,]
mat1[,2]
mat1[,-2]

# 2. accessing data frame (4 methods)
nyy.df
# 1) treat a row as a vector
nyy.df[1,]
# 2) treat a column as a vector
nyy.df[,1]

nyy.df$X1

attach(cpi.df) #The following object is maked _by_ .GlobalEnv:
search() #cpi.df가 추가됨
mean(CPI)
detach(cpi.df) 
search()
mean(CPI) #Error in mean(CPI): objecy 'CPI' not found

with(nyy.df, X1)

names(nyy.df)
colnames(nyy.df)
row.names(nyy.df)


#RLecture04.pdf
attach(cpi.df) #The following object is maked _by_ .GlobalEnv:
search() #cpi.df가 추가됨
mean(CPI)
detach(cpi.df) 
search()
mean(CPI) #Error in mean(CPI): objecy 'CPI' not found

dim(nyy.vector) #dimension
dim(nyy.df) # returns size of matrix

mat1 #10행 3열의 매트릭스
rowSums(mat1) #각 행의 합
colSums(mat1) #각 열의 합

rowMeans(mat1) #각 행의 평균
colMeans(mat1) #각 열의 평균

# 1. apply(array, rc, function, ...)
#rc: 1=rows, 2=columns, c(1,2)=all cells
#function: mean, median, sqrt, sum... etc.
mat1
apply(mat1, 1, sum) #mat1의 각 행의 합을 구하여라
apply(mat1, 2, sum) #mat1의 각 열의 합을 구하여라
apply(mat1, c(1,2), sum)

rm(list=ls())
load('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/cpi.RData')
ls()
class(cpi)
mode(cpi)
summary(cpi)
str(cpi)

#Mean CPI per year for all countries
apply(cpi[,2:11], 1, mean, na.rm = T)

#change previous statement to:
#create a new column in the data frame with average CPI for each country
cpi$AvgCPI <- apply(cpi[,2:11],1, mean, na.rm = T)

# sapply lapply
x <- c(97, 89, 77, 20)
a = sapply(x, sqrt) ; a
class(a)
b = lapply(x, sqrt) ; b
class(b) #numeric vector

# summary: 
#1. indexing vectors: myvector[membernumbers] e.g.
cpi[1] # country
cpi$Country[1:5] #country column중 처음 5행 국가들 출력
cpi$Country[c(1,5)] #country column 중 1행과 5행 국가(2개국) 출력
#2. indexing table-like structures: mymatrix[rows, columns]
cpi[,2:11] #행은 전부 열은 2~16번째 열 출력

# mean CPI per year for all countries for years after 2005
apply(cpi[,names(cpi) > 'y2005'], 2, mean, na.rm = T)
#cf) 문자열이어도 대소 비교가 가능 e.g.
'y' < 'z' # true
'y10' < 'y11' #true

# join: combining data frames
capitals

(mcaps <- merge(cpis, capitals)) #교집합
class(mcaps)

(allcaps <- merge(cpis, capitals, all = T)) #합집합



#string (문자열) e.g.
s <- c('apple', 'bee', 'cars', 'danish', 'egg')

# get the number of characters in each string
nchar(s)

# convert all letters to upper case
toupper(s)

# extract substrings in a character vector: substr(s, strat, stop)
substr(s, 1, 3)

# replace substrings in a character vector with the new one
s
substr(s, 1, 2) <- 'BU'; s
s <- c('apple', 'bee', 'cars', 'danish', 'egg'); s

# extract characters from each string
substr(s, 2, 3)
onetwo <- substr(s, 1, 2)

# replace the first and second characters of each string
substr(s, 1, 2) <- 'BU'; s
substr(s, 7, 9) <- 'BU'; s #danish가 6글자로 최대인데, 글자수를 넘어가는 영역을 설정하면 아무일도 발생하지 않음
substr(s, 1, 2) <- onetwo
s <- c('apple', 'bee', 'cars', 'danish', 'egg'); s

# substitue(replace) strings: sub(pattern, replacement, x), gsub(pattern, replacement, x)
s <- sub('e', '_', s); s #두번째 bee를 보면 sub함수는 첫번째 e만 _로 처리함
s <- gsub('e', '_', s); s #하지만, gsub은 bee의 첫번째 두번째 e 모두 __로 처리함

# find characters in a string: grep, grepl
# grep: return indices or values of strings where matches are found
# grep(pattern, x, ignore.case = FASLE, value = FALSE)

# grepl: (logic) return TRUE or FALSE to indicate where matches are found
# grepl(pattern, x, ignore.case = FALSE)

# search s for instances of 'e'
grep('e', s) # 1 2 5 첫째 둘째 다섯째 벡터에 'e'가 있음을 알려줌
grep('e', s, value = T) #'e'가 있는 첫째 둘째 다섯째 벡터인 'apple' 'bee' 'egg'를 출력

grep('^e', s) # 시작하는 알파벳이 e인 character vector가 몇번째 벡터인지를 알려줌
grep('^e', s, value = T) # 시작하는 알파벳이 e인 character vector만 출력

# return values instead of indices
grep('Z', cpi$Country, value = T)

# return list of TRUE/FALSE instead of indices
grepl('e', s)




#RLecture05.pdf
# examine corruption data
str(cpi)

# display country names containing z
grep('z', cpi$Country)
grep('z', cpi$Country, value = T)

grep('A', cpi$Country, value = T, ignore.case = T)
grep('^A', cpi$Country, value = T, ignore.case = T)
grep('A', cpi$Country)

# create new column of Average CPI for use in later examples
cpi$AvgCPI <- rowMeans(cpi[, grepl('^y', names(cpi))], na.rm = T)
cpi
class(cpi)

cpi$AvgCPI[grep('A', cpi$Country)]
cpi[grep('A', cpi$Country), c(1, 12)]

# reordering values: sort, order
# sort(data frame, decreasing = FALSE )
# order(..., na.last = T, decreasing = FALSE)

# show country names in ascending
cpi$Country
sort(cpi$Country, decreasing = T)

# return index values for decreasing order
order(cpi$Country, decreasing = T)

# use ordered index values with other data
cpi[order(cpi$AvgCPI), c(1, 12)] #AvgCPI의 오름차순(increasing order) 순으로 정렬한 후, 1번 칼럼(나라 이름)과 12번 칼럼(AvgCPI)를 출력
cpi[order(cpi$AvgCPI), 1:12] #AvgCPI의 오름차순(increasing order) 순으로 정렬한 후, 1번~12번 칼럼 출력

# base the order of one vector on the order of another
cpi$Country[order(cpi$AvgCPI)] #AvgCPI순으로 나라를 정렬한 후에, 그 정렬한 순서대로 나라 이름을 보여줌

# use indices to select only the 10 lowest CPI
cpi$Country[order(cpi$AvgCPI)][1:10] #AvgCPI 순으로 나라를 정렬한 후에, 그 정렬한 순서 중 위에서 10개국(i.e., AvgCPI가 가장 낮은 10개국) 나라이름을 보여줌


# functions to concatenate vectors: cat, paste
# cat(..., file = '', sep = '')
# paste(..., sep = '', collapse = NULL)

Capital <- capitals$Capital
Country <- capitals$Country
(Capital <- as.character(capitals$Capital))
(Country <- as.character(capitals$Country))


# tab and new lines
cat('5\t9\n\n')

# cat: Country 캐릭터 벡터와 Capital 캐릭터 벡터를 합치는데, separator(구분)은 ,로 해라
cat(Country, Capital, sep=',')
cat(Country, Capital, sep = ',\n') #,(comma) 다음에 새로운 줄로 나눠줌

# paste:
paste(Country, Capital, sep = ',')
paste(Country, Capital, sep = ',\n')
paste(Country, Capital, sep = ',', collapse = '\n')

# what is Country?
class(cpi$Country)

# get the names back
cat(as.character(cpi$Country), cpi$AvgCPI, sep = ',')

# compare the same code using the paste function
paste(cpi$Country, cpi$AvgCPI, sep = ',')

# assign it to an object
(outlist <- paste(cpi$Country, cpi$AvgCPI, sep = ',', collapse = "\n"))

# what kind of object?
class(outlist) #Character
dim(outlist) #NULL
length(outlist) #1

# use cat function to send to file (Note these could have been nested)
cat(outlist, file = 'avgcpi.csv')


# importing data
# read.csv(file, header = TRUE, sep = ',', quote = '\"', dec = '.')
# 1) header: 첫 행인 filed names(i.e., column names)를 포함할지 안할지
# 2) sep: 구분자를 무엇으로 할 것인지
# 3) quote: set of quoting characters
# 4) dec: character used for decimal points

# example of na.strings to read corruption data
(cpina <- read.csv('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/CorruptionPerceptionIndexNA.csv'))
str(cpina) # ?, *, n/a 같은 garbage data가 그대로 import됨
(cpina <- read.csv('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/CorruptionPerceptionIndexNA.csv', na.strings = c('?', '*', 'n/a')))
str(cpina) # ?, *, n/a 같은 garbage data를 모두 N/A로 처리해버림

# output devices
?Devices
# 1) bitmap devices
png()
jpg()
bmp()
tiff()
# 2) file devices
postscript()
pdf()
# pdf('/Users/taehoonh/downloads/taehoonh_HW05_output.pdf')
# 3) close the device when finished
dev.off()
graphics.off()
# plot(cpi$y2002, cpi$y2011); dev.off()



#RLecture06.pdf
# 1. Generic X-Y Plotting: plot(x, y, ...) <- general form
# x: vector of horizontal values or object with plot method
# y: vector of vertical values (optional depending on x)
# ...: arguments such as graphical parameters
# example:
plot(cpi$y2002, cpi$y2011)

# 1) example of na.strings to read corruption data
(cpina <- read.csv('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/CorruptionPerceptionIndexNA.csv', na.strings = c('?', '*', 'n/a')))

# 2) show a basic plot of y2002 by y2011
plot(cpina$y2002, cpina$y2011)

# 3) Where do the other parameters (defaults) come from?
par()

# 2. Graphic parameters
# example: plot(x, y, type = 'p', pch = 1, col = 'black')
# type: how to plot (not a global parameter) >>> p: points, l: line, b: both
# pch: vector of numbers defining the plot symbol
# ?points: help page that provides a definition of all the available plot characters
# color: vector of any of three kinds of R color specs (그래프 색깔을 선택하는 세가지 방법: colors(), #rrggbb, palette()[i] 여기서 i는 positive integer)
   # - a color name i.e. 'maroon': use colors() to get a list of avilable color names
   # - hexadecimal string of the form '#rrggbb'
   # - a positive integer i meaning palette()[i]

# 1) demo of graphics parameters
plot(cpina$y2002, cpina$y2011, type = 'l')
plot(2002:2011, cpina[2, 11:2], type = 'l')

# 2) show colors
colors()
palette()

# 3) change the plot chacracter and colors
plot(2002:2011, cpina[2,11:2], type = 'b', pch = 7, col = 4)
# 여기에서 col = 4라고 하면 colors() 함수에서 index number 4를 불러오는 것이 아니라, palette() 함수에서 index number 4인 blue를 불러옴

# 4) load file of real estate data
(bcs <- read.csv('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/bcs.csv'))
plot(bcs$Sqft, bcs$Price)

# 5) make columns available in search path
attach(bcs)

# 6) create a vector of plot characters: pchv=plot character vector
Location == 'College Station, TX' # 15 falses and 15 trues = 15 zeros and 15 ones
(pchv <- (Location == 'College Station, TX') + 1) # 여기에다가 각각 1씩을 더하니까 15 ones and 15 twos

# 7) create an empty vector in which to put color names
(colv <- rep(NA, length(Sqft))) #30 NAs값을 가지고 있는 colv를 생성함 (빈 벡터 colv를 만들지 않고 다음 red값을 할당하면, 에러가 발생함)
# rep(): repeat function >>> rep(반복할 개체, 몇 번 반복할지)
# example: rep(NA, 30) >>> NA값을 30번 반복하는 벡터를 생성

# 8) put red in College Station positions
(colv[Location == 'College Station, TX'] <- "red") # 위치가 College Station, TX이면 빨간값을 줌

# 9) put blue in Bryan positions
colv[Location == 'Bryan, TX'] <- 'blue'; colv #위치가 Bryan, TX이면 파랑값을 줌

# 10) plot home prices by square ft.
plot(Sqft, Price, pch = pchv, col = colv) # 위에서 만든 pchv(plot character vector)와 colv(color vector)를 조건으로 넣어줌

# 3. Higher Level Graphics
# 1) for categorical variables: bar plot, pie chart
# 2) for continuous variables: histogram, boxplot

# 4. bar plot
# general form: barplot(hegiht, width = 1, space = NULL, names.arg = NULL, beside = FALSE, horiz = FALSE)
# height: vector or matrix describing the bars
# width: width of bars
# space: amount of spcae between bars
# names.arg: vector of names below bars
# beside: controls bar stacking
# horiz: orientation of bars

# 1) function for bar height: uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels (frequency distribution table)
# general form: table(...)
# ...: one or more objects which can be interpreted as factors
# example:
barplot(sort(table(Baths), decreasing = T))

# 2) produce a bar plot of the number of baths
table(Baths)
sort(table(Baths), decreasing = T)
barplot(sort(table(Baths), decreasing = T)) #x축을 기준으로 하는 bar plot을 생성
barplot(sort(table(Baths), decreasing = T), horiz = T) #y축을 기준으로 하는 bar plot을 생성

# 3) enhance barplot to show both locations
(barmat <- table(Baths, Location))
class(barmat) #table
barplot(barmat, beside = F)
barplot(barmat, beside = T) # beside: 병치할건지 말지를 결정

# 5. pie chart
# general form: pie(x, labels = names(x), clockwise = F, init.angle = if(clockwise) 90 else 0)
# x: vector of non-negative numercial quantities
# labels: names for slics
# clockwise: specifies order slices are drawn
# init.angle: specifies starting angle for slices
# (pie charts are not an ideal method of displaying information.)

# 1) show the same data as first bar in a pie chart
pie(sort(table(Baths), decreasing = T))
pie(sort(table(Baths), decreasing = T), clockwise = 90) # 왜 각도를 돌릴까? 글씨 같은거 그래프에 표기할 때 좀 도움이 되기도 하므로

# 6. Histogram
# general form: hist(x, breaks = 'Sturges", freq = NULL)
# x: vector of values for which histogram is desired
# breaks:
   # - a vector giving the breakpoints between histogram cells (only way to force) <<<사람들이 많이 틀리는 부분
   # - a single number giving the number of cells for the histogram
   # - a character string naming an algorithm to compute the number of cells (Sturges, Scott, Freedman-Diaconis/FD)
   # - a function to compute the number of cells
# freq: choose counts or probability densities for y

# 1) create a histogram of home square footage: plot histograms
hist(Sqft, freq = F) # default breaks

# 2) establish a vector of break values
brv <- seq(1000, 5000, 400) # seq() 함수: 1000부터 5000까지, 400 단위로 벡터 생성
seq(1000, 5000, 400)

hist(Sqft, freq = F, breaks = brv) #fixed breaks (1000부터 5000까지, 400 단위로)
hist(Sqft, freq = F, breaks = 16) #single number of breaks (정확하게 16개의 bar가 안나올 수도 있음, close to 16 bars가 정확한 정답, 여기에서는 18개의 bar가 나옴)
hist(Sqft, freq = F, breaks = 5) #diffrent number of breaks (여기서도 5개를 지정햇으나, 8개의 bar가 나옴)
hist(Sqft, freq = F, breaks = 'FD') #break algorithm (FD알고리즘을 쓰면 자동으로 breaking point를 알고리즘에 따라 적절하게 지정해줌)

# 7. Boxplot: 5개의 parameters로 distribution 요약 가능: max, 3rd Quartile, median, 1st Quartile, min (+ outlier)
# general form1: boxplot(formula, range = 1.5, notch = F)
# general form2: boxplot(x, ...)
# formula: such as y ~ grp (y as a function of grp)
# x: vector or list of vectors(like data frame columns)
# range: position of whiskers
   # - positive value n: limit to n times interquartile range(i.e., 3rd Quartile - 1st Quartile)
   # - 0: include all variables
# notch: draw notch on each side of boxes
# example:
boxplot(Price ~ Location, range = 0) # 여기에 0을 집어 넣었기 때문에 모든 value를 포함
boxplot(Price ~ Location, range = 1.5) # 1.5 times of IQR을 range로 삼음

# 1) create a boxplot of home prices by location
boxplot(Price ~ Location)

# 2) extend max to include outliers
boxplot(Price ~ Location, range = 0)

# 3) add notches
boxplot(Price ~ Location, range = 0, notch = T)

# 8. More Graphics Parameters
# some can only be set with par()
# mfrow, mfcol: multiple plots per image
# par(mfrow = c(nr, nc))
# mfrow vs. mfcol controls the order graphs appear (한 화면에 그래프나 차트를 여러개 그려야 할 때 이 함수를 사용함, mfrow는 진행방향이 가로로 진행 후 그 다음줄로 넘어가고, mfcol은 진행방향이 세로로 진행한 후 그 다음 열로 넘어감)
# mar, oma, mai, omi: margin controls
par(type = c(bottom, left, top, right)) # bottom, left, top, right: number of lines or inches (bottom을 시작으로 clockwise 방향으로)
# type:
  # mar/mai: margins for the specific plot area
  # oma/omi: overall (page) margins
    # - parameters ending with i use inches as units
    # - parameters not ending with in i use lines as units
  # bottom, left, top, right: number of lines or inches 

# 1) rerun graphics functions to be all in one image
par(mfrow = c(2, 2))
barplot(sort(table(Baths), decreasing = T))
pie(sort(table(Baths), decreasing = T))
hist(Sqft, freq = F) #default breaks
boxplot(Price ~ Location)
mtext("This is the first group")

# 2) do it again by columns (down then across)
par(mfcol = c(2, 2))
barplot(sort(table(Baths), decreasing = T))
pie(sort(table(Baths), decreasing = T))
hist(Sqft, freq = F) #default breaks
boxplot(Price ~ Location)
mtext("This is the second group")

par(mfcol = c(2, 2)) # 전체 화면을 2X2로 나눔, 진행방향은 횡으로 >>>
par(adj = 0) #첫번째 그래프의 제목을 왼쪽 정렬함(adj = 0)
barplot(sort(table(Baths), decreasing = T), main = '#1 - Bar', ylim = c(10,0)) # 1,1에 barplot을 삽입
par(adj = 0) #두번째 그래프의 제목을 왼쪽 정렬함
pie(sort(table(Baths), decreasing = T), main = '#2 - Pie') # 1,2에 Pie chart 삽입
par(adj = .5) #세번째 그래프의 제목을 가운데 정렬함 (adj = 0.5)
hist(Sqft, freq = F, main = '#3 - Histogram', xlab = 'Square Footage') # 2,1에 Histogram을 삽입
par(adj = 1) #네번째 그래프의 제목을 오른쪽 정렬함 (adj = 1)
boxplot(Price ~ Location, main = '#4 - Boxplot', names = c('Bryan', 'Coll. Sta.')) # 2,2에 boxplot을 삽입

# 3) reset graphics area to 1X1 (2X2에서 다시 1X1로 돌아감)
par(mfcol = c(1, 1))

# 9. Enhancing Graphs: optional parameters
# 1) add a TITLE to the graph: 
# example1:
main = 'Real Estate Prices'
# example2:
main = paste('Histogram of', xname)

# 2) scale ranges of x or y axes (축 조정): 
# example1: xlim =, ylim = (numeric vectors of length 2)
# example2: ylim = c(0, 10)

# 3) change the axis labels(축 레이블 조정):
# xlab =, ylab =
# example: ylab = 'Square Footage'

# 4) specify a vector of character strings under plotted groups
# names = 
# example: names = c('Bryan', 'Coll.Sta.")

# 5) control alignment of text (그래프 안에서 글씨정렬, 0=왼쪽정렬 0.5=가운데정렬-기본값 1=오른쪽정렬)
# adj = 
# 0 left justifies
# default of 0.5 centers text
# 1 right justifies
adj = 0



#RLecture07.pdf
# 1. Adding Objects to Existing Graphs: same general form as plot() function
# 1) add more points: just like plot(x, y, type = 'p')
plot(2002:2011, cpina[2, 11:2], type = 'l')
points(2002:2011, cpina[2, 11:2], col = 'blue')

# 2) add more points connected by lines: just like plot(x, y, type = 'l')
plot(cpina$y2002, cpina$y2011, type = 'p')
lines(cpina$y2002, cpina$y2011, col = 'blue')

# 3) add more points and lines: use lines(x, y, type = 'b')
plot(2002:2011, cpina[2,11:2], type = 'b', pch = 7, col = 1)

# 2. Add the normal distribution line to the histogram of Real Estate Square Footage
# 1) Normal Distribution: 68%(1 stdv) / 95%(2 stdv) / 99%(3 stdv)
# 2) ND Functions: 
  # - dnorm(x, mean = 0, sd = 1): densities for the normal distribution
    # x: vector of quantiles
    # mean: vector of means
    # sd: vector of standard deviations
  # - rnorm(n, mean = 0, sd = 1): pseudo-random generation
    # n: number of observations
# example:
x <- seq(-3, 3, 0.01)
y <- dnorm(x)
plot(x, y, type = 'l') #use lines to add to the existing histogram

# 1) plot the histogram again
hist(Sqft, freq = F) #freq = F는 절대 빼먹으면 안됨 매년 많은 학생들이 이를 빼먹는 실수를 함

# 2) add the normal distribution
# - create a vector of 'x' values
Xd <- seq(1000, 5000, 1)
# - create vector of densities for our data
Yd <- dnorm(Xd, mean = mean(Sqft), sd = sd(Sqft))
# - plot the distribution (항상 기존의 그래프, 차트, 히스토그램에 덧붙일 때에는 lines()나 points()를 사용함)
lines(Xd, Yd)

# 3. Adding Objects to Existing Graphs: fill a polygon defined by the X and Y values
# 1) plots line of x and y coordinates
# 2) draws line from last x, y point back to first x, y point
# 3) fills in enclosed shape (if color is specified)
# general form: polygon(x, y, ...)
# x: vector of horizontal values
# y: vector of vertical values
# ...: arguments such as graphical parameters
# example:
x <- seq(-3, 3, 0.01)
y <- dnorm(x)
polygon(x, y, col = 'blue')

# 1) replace the distribution with a polygon
polygon(Xd, Yd)
polygon(Xd, Yd, col = 'blue')

# 4. Adding Straight Lines (4 methods)
# general form:
# 1) slope/intercept line as in y = b(x) + a                : abline(a, b)
# 2) a horizontal line at the value y                       : abline (h = y)
# 3) a vertical line at the value x                         : abline (v = x)
# 4) fit line from linear model of control x and response y : abline(lm(y ~ x))

# 5. Linear Models
# general form: lm(formula, data, na.action)
# formula: symbolic description of model like response ~ control
# data: optional data frame or environment containing variables
# na.action: function indicating how to handle NAs (default is na.omit)
# example:
# - assign a model object of pricy by sqft + show a summary of the model results
tm <- lm(Price ~ Sqft, bcs); summary(tm)

# 4. 5. 동시에 한 번에 예를 다룸
# 1) recreate scatter plot of home prices by square ft.
# - create a vector of plot characters
(pchv <- (Location == 'College Station, TX') + 1)
# - create an empty vector in which to put color names
(colv <- rep(NA, length(Sqft)))
# - put red in College Station, TX positions
(colv[Location == 'College Station, TX'] <- 'red')
# - put blue in Bryan, TX positions
(colv[Location == 'Bryan, TX'] <- 'blue') ; colv
# - plot
plot(Sqft, Price, pch = pchv, col = colv)
# - draw a fit line
abline(lm(Price ~ Sqft))
tm <- lm(Price ~ Sqft) ; summary(tm)

str(tm)
class(tm) #lm: linear model
mode(tm) #list

# 6. Adding Legends to Graphs
# general form: legend(xy.coords, legend, pch, col)
# xy.coords: a) specify x, y coordinates of upper left corner or 2) use locator(1) function to click on position
# legend: vector with legend text
# pch: plotting characters
# col: colors of plot objects
# example:
legend(locator(1), c('treatment', 'control'), pch = c(1, 1), col = c(2, 4))

# 1) put a legend on the graph
plot(Sqft, Price, pch = pchv, col = colv)
abline(lm(Price ~ Sqft))
tm <- lm(Price ~ Sqft) ; summary(tm)
legend(2000, 2000, c('Bryan', 'College Station'), pch = c(1, 2), col = c('blue', 'red'))
legend(locator(1), c('Bryan', 'College Station'), pch = c(1, 2), col = c('blue', 'red')) #code 실행 후 plot영역에서 legend를 배치하고 싶은 위치를 클릭하면 legend가 표시됨

# 7. Adding Text to Graphs: text(), mtext()
# text(x, y, text, cex = NA, adj = NA): puts text inside plot
# mtext(text, side = 3, cex = NA, adj = NA): write text into the margin of the plot
# x, y: coordinates for text(centered by default)
# side: 1 = bottom, 2 = left, 3 = top, 4 = right side of plot (bottom부터 시계 방향으로)
# cex: optional font size override
# adj: 0 = left or bottom, 1 = right or top alignment

# 1) put text inside the plot
text(1550, 2400, 'This is the upper left corner', adj = 0)
text(locator(1), 'This is the upper left corner', adj = 0)

# 8. Mathematical Annotation in R
# 1) plotmath: not a function but a collection of features / imbed inside text functions and options
# example:
?plotmath
demo(plotmath)
example(plotmath)

# 2) expression(...): no variables get evaluated / add plain text inside expression with paste() function
# example:
text(4, 7, expression(bar(x) == sum(frac(x[i], n), i == 1, n)))
xlab = expression(paste("Phase Angle", phi))

# 3) bquote(expression1.(expression2))
# expression1: plotmath expression - no evaluation
# .(expression2): variables inside .() are evaluated
# Note: use .() as often as you like inside bquote
# example:
MU <- 8.25
ylab = bquote(mu == .(MU))

# 1) assign a mean value to mu
MU <- 8.25

# 2) plot a couplee of points to give us a working space
plot(c(1, 10), c(10, 1), xlab = expression(paste("Phase Angle ", phi)), col.lab = 'blue', ylab = expression(MU == MU)) # Why don't we get a number here?

# 3) add text in top margin evaluating mu
mtext(bquote(mu == .(MU)))

# 4) put a formula inside our plot
text(6, 6, expression(bar(x) == sum(frac(x[i], n), i == 1, n)), col = '#FF00EE')

# 9. Conditional Data Assignment
# write a single statement that specifies blue for Bryan and red for College Station
# use "ifelse" to process multiple elements
# returns object of same shape as conditional expression
# Note: combined conditions use && and || (if문 안에서 and 나 or을 표현하고 싶은 경우, &나 |하나가 아니라 &&나 || 두개로 표현해야 함)
# general form: ifelse(cond, Texpr, Fexpr)
# cond: expression that produces TRUE / FALSE value(s)
# Texpr: value expression when condition is TRUE
# Fexpr: value expression when condition is FALSE
# example:
colv <- ifelse(Location == 'Bryan, TX', 'blue', 'red')

# 1) put blue in Bryan, TX positions, red in other positions
rm(colv)
colv <- ifelse(Location == 'Bryan, TX', 'blue', 'red') ; colv
col3 <- ifelse(Location == 'Bryan, TX', 'blue', ifelse(Location == 'Waco, TX', 'green', 'red')) ; col3

# 10. Conditional Code Execution
# business scenario: execute a section of code based on a person's credit score threshold
# basic control-flow constructs:
  # - if(cond){...}
  # - if(cond){...}else{...}
  # - for(i in seq){...}
  # - while(cond){...}
# ??control
# general form: if (cond){Texpr}else{Fexpr}
# cond: expression that produces TRUE/FALSE value
# Texpr: action when condition is TRUE
# else: optional reserved word preceding Fexpr
# Fexpr: action when condition is FALSE
# {} optional for simple statement on one line
# must evaluate to a length-one logical vector *** (TRUE or FALSE)
# Note: Combined conditions use && and ||
# example:
i <- 6
if(i > 6){
  cat('i is bigger than 6.\n')
} else{
  cat('i is 6 or less.\n')
}

# 1) assign a small odd number
V <- 6
if(V%%2 == 1 && V <= 5) {
  cat(V, 'is a small, odd number.\n')
} else {
  cat(V, 'is either large and/or even.\n')}

# 11. ifelse vs. if
# same basic principle but different
# vector or matrix를 처리하는 경우에는 ifelse를, scalar같은 one value를 처리할 때는 if를!
# NOT fully interchangeable
# ifelse: multiple values like vector or matrix
# if: ONLY one value like a scalar

# 12. Repetitive Code Execution (Loops): for, while
# 1) 'For' loop: repeat process for specified iterations
# general form: for(i in seq){...}
# R loops are evaluated at the start of the loop
# i: name of variable to store loop position
# seq: any vector of values to control repetitions
# {...}: R expression to be repeated
# example:
y <- 1:10
for(i in y){
  if(i > 6){
    cat('i is bigger than 6.\n')
  } else {
    cat('i is 6 or less.\n')
    }
}
i
# cf) does i live outside the loop? A: No
i #10 값이 나올 것, 이는 workspace에 존재한다는 의미임

# 2) 'While' loop
# general form: while(cond){...}
# cond: expression that produces TRUE/FALSE value
# {...} R expression to be repeated (must contain code to manage repetitions)
# example:
i <- 1
while(i <= 10){
  if(i > 6){
    cat('i is bigger than 6.\n')
  } else{
    cat('i is 6 or less.\n')
  }
  i <- i+1 #crucial to prevent infinite loop
}

# 1) change this to 11 and compare results
i <- 11
while(i <= 10){
  if(i > 6) {
    cat('i=', i, 'and is bigger than 6.\n')
  }else{
    cat('i=', i, 'and is 6 or less.\n')
  }
  i <- i + 1
  cat('At the bottom of the loop i is now =', i, '\n')
}
i
# 아무것도 나오지 않는 이유는 i가 11이기 때문이다. 따라서, 절대 우리의 while loop은 실행되지 않는다. i를 1로 바꾸면 결과값이 나오게 된다.

# cf) why final value of while loop and for loop is different
# for에서는 마지막 i value가 10, while에서는 마지막 i value가 11임

# 2) using loop and IF to solve graphics question
# x points where repeating values are not repeated.
x <- c(1, 2, 3, NA, NA, 4, NA, NA, 5, NA) ; x
# y is random values
y <- rnorm(length(X))
# plot
boxplot (y ~ x)
# fix missing values and replot
for(i in 1: length(x)){
  if(is.na(x[i])) x[i] <- x[i-1] #missing values들을 previous values로 채워줌
  }
x
boxplot(y ~ x)



# RLecture08.pdf
# 1. Advanced Loop Example
# an autoregressive(AR) process is defined by 'Xn+1 = pi*Xn + e' where e is random noise.
# generate 1000 values from an AR proess with 'pi' equal to 0.9 and random noise(e) with a standard normal distribution.
# plot the last 500 values as positions 1 to 500 with connected lines

# how do we generate 'random noise' with a standard normal distribution? A: rnorm(n) where n is the number of values to generate
# Using a seed guarantees same set of random numbers every time
# general form: set.seed(seed)     seed = a large positive integer

# how do we manage the X vector for 'Xn+1 = pi*Xn + e'
# where do we start?
# how many iterations do we need?
# how many values will we end up with?
# how do we plot the last 500 values as positions 1 to 500 with connected lines?

# 1) observe the generation of random numbers
(rnorm(3)) # execute this twice

# 2) set a seed so we will get the same random numbers every time
set.seed(9182012) ; (rnorm(3)) #execute this twice, too and compare with above
# Takeaway: 1)과 2)의 차이점은 1)은 계속 값이 바뀌는 반면, 2는 생성 후에 값이 고정됨

# 3)-1 set graph area for side by side comparison
par(mfrow = c(1, 3))
# 3)-2 plot rnorm
r <- rnorm(200)
hist(r)

# 4) increase the sample size
r <- rnorm(2000)
hist(r)

for(i in 1:2000){
  r[i] <- rnorm(1)
}
hist(r)

## Additional Demo
# 1) set graph area for two rows of graphs
plot.new()
par(mfrow = c(2, 1))

# 2) create a vector of X values. Add an extra for n+1
X <- rep(0, 1001)

# 3) use a loop to generate AR process values
for(i in 1:1000){
  X[i+1] <- (0.9 * X[i]) + rnorm(1)
}
X # starting from 0 and random noise (여기서는 -0.44)
# Takeaway: R is not generally efficient for 'loop'.

# 4) setup to observe random number
set.seed(90210)
for(i in 1:1000){
  e <- rnorm(1)
  cat(e)
}

# 5) alternate method that creates a vector of random numbers first.
set.seed(90210)
(r <- rnorm(1000))

for(i in 1:1000){
  X[i+1] <- (0.9 * X[i]) + r[i]
}
X

# 6) plot all values except first 0
par(mfrow = c(1, 2))
plot(1:1000, X[2:1001], type = 'l')

# 7) plot only the last 500
plot(1:500, X[502:1001], type = 'l')

# 2. Functions: The anatomy of a Function
# purpose: reusable code
# ?'function' for documentation
# components: name / inputs (e.g., arguments or parameters) / code that does something / output (i.e.,return)

# 3. Function Example
mysum <- function(a, b, c = 0) a + b + c
# mysum: the name of my new function
# function(a, b, c = 0): defines the structure
# a, b: positional parameters
# c: optional parameter with default value
# a + b + c: code that returns sum of three inputs (class of returned value depends on inputs 반환되는 값의 자료구조는 input이 뭔지에 따라에 달라짐)
  # parameters & created objects are local to the function

# 4. Creating a Function (순서)
# 1) test code outside a function first
# 2) put the code in a function and test
# 3) replace hard coded values with parameters and test again
# 4) use parenthesis liberally
# 5) only include in the function what can be repeated

# 1) create and test a simple function
mysum <- function(a, b, c = 0) {
  if(is.numeric(a) && is.numeric(b) && is.numeric(c)) {
    a + b + c
  } else {
      cat('All arguments to function must be numeric.\n')
  }
}

ls() #workspace에 추가 되었는지 확인
summary(mysum) #Error in object[[i]] : object of type 'closure' is not subsettable
class(mysum) #"function"
mode(mysum) #"function"

# 2) what do we get when we call the function?
mysum(3, 5, 'c')
ls() #workspace에 그 어떠한 것도 추가되지 않았음 local임

# 3) put an assignment inside the function
mysum <- function(a, b, c = 0) {
  a + b + c -> d ##Note: this assignment is turned around just because we can
}

# 4) call again & observe differences
mysum(3, 5) #cosnole에 어떠한 값도 나오지 않는다 >>> 나오게 하려면 return() 을 사용해야 함
ls() #there is no 'd' everything in the function is local, not global

# 5) add return code to the function
mysum <- function(a, b, c = 0) {
  a + b + c -> d
  return(d)
}

# 6) call agin & observe differences
mysum(3, 5)
ls() # console에서 return값을 볼 수 있지만 그 값이 workspace에 저장되지는 않는다.

# 7) use the function for assignment
d <- mysum(3, 5, c = 5) ; d
ls()

# 8) what if we supply character inputs?
mysum(A, B)
mysum('A', 'B')
mysum('A', 'B', 'C')

# 9) what if A and B are vectors?
A <- 1:6
B <- 7:12
mysum(A, B) # [1]  8 10 12 14 16 18

# 10) what is the class & mode of the output now?
d <- mysum(A, B, 3) ; d
class(d)
mode(d)

# 11) what is the class & mode of the output now?
d <- mysum(A, B, 3) ; d
class(d)
mode(d)

# 5. Distribution and Sampling
# other distributions: uniform distribution, gamma distribution
# 1) Uniform Distribution: runif()
# ?runif: R documentation
# runif: generates uniformly distributed random numbers
# general form: runif(n, min = 0, max = 1)
# n: number of observations to generate
# min, max: lower and upper limits of the distribution
# example:
runif(50, -4, 4)

# 1) create and examine a uniform distribution
par(mfrow = c(1, 1))
set.seed(100)
ubt <- runif(500, -4, 4)
hist(ubt)
mean(ubt)
sd(ubt)

# 2) Gamma Distribution: dgamma(), rgamma()
# dgamma: density generation of distribution
# general form: dgamma(x, shape, rate = 1, scale = 1 / rate)
# x: vector of quantiles
# shape, scale: parameters > 0
# rate: alternative way to specify scale
# example:
x <- seq(0, 20, .1)
dgamma(x, 1, scale = 2)
dgamma(x, 5, scale = 1)

# rgamma: random generation of distribution
# general form: rgamma(n, shape, rate = 1, scale = 1 / rate)
# n: number of observations to generate
# example:
rbt <- rgamma(50, 0.9) #scale defaults to 1
hist(rbt)

# 1) plot various gamma distributions for illustration

x <- seq(0, 20, .1) # vector of quantiles
g1 <- dgamma(x, 1, scale = 2)
plot(x, g1, type = 'l', col = 'red')

g2 <- dgamma(x, 2, scale = 2)
lines(x, g2, col = 'orange') # 이미 그려진 그래프 위에다가 더 그래프를 그리고 싶을 때에는 lines() points() 등의 함수를 사용

g3 <- dgamma(x, 3, scale = 2)
lines(x, g3, col = 'gold')

g4 <- dgamma(x, 5, scale = 1)
lines(x, g4, col = 'green')

g5 <- dgamma(x, 9, scale = .5)
lines(x, g5, col = 'blue')

# 2) create 50 random value with gamma distribution
set.seed(90210)
(rbt <- rgamma(50, .9))
summary(rbt)
hist(rbt, col = 'gray', breaks = 12)

# 3) double the number of values and compare
set.seed(90210)
rbt <- rgamma(100, 0.9)
summary(rbt)
hist(rbt, col = 'gray', breaks = 12)

# 6. Sampling
# general form: sample(x, size, replace = F)
# x: vector of elements or positive integer to sample from 1:x
# size: number of items to choose, if the size is not specified, then the size = length(x)
# replace: return chosen item back into the source for resampling
# example:
sample(10) # permutation(reordering) of 1:10
sample(rbt) # permutation(reordering) of rbt
sample(rbt, 5) # subset of 5 items from vector rbt
sample(rbt, replace = T) # bootstrap sample(resampling) of rbt

sample(10) # 1부터 10사이 중에서 10개 뽑기 (i.e., 1~10숫자를 재배열 하는 것과 같음) 비복원추출
sample(10, replace = T) # 1부터 10사이 중에서 10개 뽑기 but 복원추출(하나 뽑은 후 다시 집어넣고 다시 뽑음, 같은 숫자가 나올 수 있음)
sample(10, 5) # 1부터 10사이 중에서 5개 숫자 뽑기 (비복원추출, 같은 숫자가 안나옴)
sample(10, 5, replace = T) # 1부터 10사이 중에서 5개 숫자 뽑기 (복원 추출, 같은 숫자가 나올 수 있음)

# 1) can we sample a character vector?
(cpi <- read.csv('/Users/taehoonh/Downloads/[TAMU] Intro to R:SAS/data/CorruptionPerceptionIndexNA.csv'))
dim(cpi) # 184 11
names(cpi)
with(cpi, sample(Country, 10))

# 2) will i get the same results if I sample again? A: No
with(cpi, sample(Country, 10))

# 3) how can we get a repetable sample?
set.seed(924)
with(cpi, sample(Country, 10))
with(cpi, sample(Country, 10))

set.seed(924)
with(cpi, sample(Country, 10))

# 4) how does this work?
set.seed(924)
# random sample of numbers between 1 and length of cpi(184)
set.seed(924) #still using the numbers but using numbers as our index numbers
sample(184, 10)

set.seed(924)
samp.cntry <- sample(length(cpi$Country), 10) ; samp.cntry # result is the same.
# use those numbers as row indices
cpi[samp.cntry, 1]

# 7. Bootstrap Experiment
# 일단 “bootstrapping”이란 용어는 통계학에서 사용된다. 
# 이는 가설 검증(test)을 하거나 메트릭(metric)을 계산하기 전에 random sampling을 적용하는 방법을 일컫는다. (이 때에 random samling은 중복을 허용해야 한다.)
# 예를 들자면, 어떤 집단에서 값을 측정했을 때, 그 중에서 임의로 100개를 뽑아서 평균(sample mean)을 구하는 것이다.
# 이게 무슨 의미가 있을까? 딱 하나의 단일 통계치를 얻고자 하면 전체의 평균을 구하면 된다.
# 그런데 만약 평균의 confidence interval을 구하고 싶다면?
# 데이터를 수집했던 확률변수의 정확한 분포를 모르는 경우, 측정된 통계치의 신뢰도를 가늠할 방법이 없다.
# 이 때, bootstrapping을 사용한다. 
# 측정된 n개의 데이터 중에서 중복을 허용하여 m개를 뽑고, 그들의 평균을 구하기를 여러 번 반복한다.
# 그럼 평균의 분포를 구할 수 있게 되고, 이로부터 95% 확률로 sample mean이 (a, b) 사이의 구간에 위치한다든가 하는 것을 언급할 수 있다.
# 이렇게 원래의 분포를 모르는 경우 외에도, 측정된 샘플이 부족한 경우에도 사용할 수 있다고 한다.
# source: https://learningcarrot.wordpress.com/2015/11/12/%EB%B6%80%ED%8A%B8%EC%8A%A4%ED%8A%B8%EB%9E%A9%EC%97%90-%EB%8C%80%ED%95%98%EC%97%AC-bootstrapping/

# 1) create a matrix to hold samples
# 2) populate each row with a bootstrap sample
# 3) create a histogram of the sample means (rowmenas)
# 4) turn this into a function so we can run it agin with a different n (i.e., number of values in our population)

# 1) we are going to use rbt as our population
rbt <- rgamma(100, 0.9) ; hist(rbt)
summary(rbt)
length(rbt)

B <- 5 #number of samples
n <- length(rbt) # number of values in our population
smat <- matrix(0, nrow = B, ncol = n) # empty matrix of proper size
for(i in 1:B) smat[i, 1:n] <- sample(rbt, replace = T) # bootstrap samples
hist(rowMeans(smat), col = 'gray', xlab = paste(B, 'Samples'))

Bfx <- function(V, B = 5) {
  # copy code from above except line that assign B & replace rbt with V
  n <- length(V) # number of values in our population
  smat <- matrix(0, nrow = B, ncol = n) # empty matrix of proper size
  for(i in 1:B) smat[i, 1:n] <- sample(V, replace = T) # bootstrap samples
  hist(rowMeans(smat), col = 'gray', xlab = paste(B, 'Samples'))
}

# set up 4 plot in graphics window
par(mfrow = c(2, 2))
# plot histogram of rbt
hist(rbt, col = 'light blue')
# call function 3 times with different sample sizes
Bfx(rbt) #default of 5
plot.new()
par(mfrow = c(2, 2))
Bfx(rbt, 10)
Bfx(rbt, 20)
Bfx(rbt, 30)
Bfx(rbt, 40)

##### This is the end of RLecture. #####