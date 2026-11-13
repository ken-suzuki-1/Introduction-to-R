########################################################################################
# UCSC Winter 2023  Econ 114 Lab 1 
#  01/11/2023
#  Author: Ken Suzuki
# The following scripts are based on "Using R for Introductory Econometrics", 
#   Sections 1.2 (skip 1.2.5), 1.3.1, 1.3.2, 1.4.1, 1.4.3, and 1.6.
########################################################################################

# Clear environment.
rm(list = ls())

# Note: # (hash mark) distinguishes comments from codes. 
#  R ignores alphabets and symbols after "#". 
#  Use # to add comments and explanations to your assignments. 

########################### 1.2.1 Basic Calculations and Objects

?abs # If you do not know how to use a command, put ? before the command and run it. RStudio opens Help.

# Basic R functions
abs(-2)  # absolute value of -2
sqrt(4)  # square root of 4
exp(2)   # exponential function (e(=2.71) to the power of 2)
log(1)   # natural log
log(8, 2) # log of 8 to base 2
round(3.14159, 2) # round 3.14159 to 2 digits
choose(4, 2) # Binomial coefficient "4 choose 2"

### Generate objects plug in content
# An object is an empty container to which you input something (scalar, vector, dataset, etc.).

DOB <- 1023 # Create a new object "DOB" that contains my birth day as a scalar. 
LastFourDigits <- 8397 # Similarly, create a scalar object that contains the last four digit of my phone number.
PRODUCT <- DOB * LastFourDigits
PRODUCT
product # R is sensitive to upper and lower cases.  

today <- "Sept 29, 2021" # You can plug strings into an object, too. 
today

########################### 1.2.2 Vectors

a <- c(1, 2, 3) # Generate a 3-dimensional vector a using "c()". 
b <- c(4, 5, 6)
c <- a + b # Vector addition
c
d <- b - a # Vector subtraction
d
e <- a * b # Element-by-element multiplication
e
f <- a %*% b # Inner product of a and b (1*4 + 2*5 + 3*6 = 4 + 10 + 18 = 32)
f

# R functions for vectors
length(a) # Get dimension of vector a
max(a) # Maximum value in vector a
min(a) # Minimum value in vector a
sum(a) # Sum of the elements of vector a (1+2+3=6)
prod(a) # Product of the elements of vector a (1*2*3=6)
zeros <- numeric(5) # Generate a 5-dimensional vector with 5 zeros.
zeros
g <- rep(3, 5) # Generate a 5-dimensional vector with five 3s.
g
h <- seq(10) # Generate a vector of sequence from 1 to 10.
h
i <- seq(11, 20) # Generate a vector of sequence from 11 to 20.
i
j <- seq(11, 20, 2) # Generate a vector of sequence from 11 to 20 in steps 2.
j

########################### 1.2.3 Special Types of Vectors 

# Character Vectors

CA <- c("San Francisco", "San Jose", "Santa Cruz")
CA

# # This does not work. (Without c) 
#  GA <- ("Atlanta", "Athens")


# Logical operators tell you whether a statement is true or false. 
2 == 2  # 2 is equal to 2.
2 <= 2  # 2 is greater than or equal to 2.
2 < 2   # 2 is strictly greater than  2.
2 != 3  # 2 is not equal to 3.

# Logical Vector (Store TRUE/FALSE results of element-wise comparison.)
k <- a < b
k
l <- a < d
l

# Record qualitative information using factor (categorical) variable/vector.
# For instance, each student belongs to either 1) in-state, 2) out-of-state, or 3) international.
# Suppose we have seven students to be classified into 1, 2, and 3. 
# We create a vector recording category number for each student.

student <- c(1,3,2,2,1,3,3) # Want R to recognize and label 1=in-state, 2=out-of-state, 3=international
student
studentlabel <- factor(student, labels = c("in-state", "out-of-state", "international")) # 1=in-state, 2=out-of-state, 3=international
studentlabel

########################### 1.2.4 Naming and Indexing Vectors
# Generate a vector with population size for 3 counties.
population <- c(10014009, 3298634, 3186989)
population
# Create a vector storing county names
counties <- c("Los Angeles", "San Diego", "Orange")

# Name each element of "population" vector.
names(population) <- counties
population

# To select the n th element of a vector, add [n] after vector name.
population[2]

# To select the n th to the m th contiguous elements, use [n:m]
population[2:3]

# You can select an element of a vector by writing a condition in [ ]
population[ population > 10000000]
population["San Diego"] # You can use a unique element name as a condition. Don't forget ""

########################### 1.2.5 Matrices (We will not cover this subsection.)

########################### 1.2.6 Lists
# All the elements in a vector need to be the same time. 
#  -You cannot mix numeric and string elements in a single vector.
#   If you do, R considers all the elements as string elements.
bad <- c(2, "stone", 3)

# "list" command allows you to bundle different types of elements together.
mixed <- list(a, CA, pi) # Bundle a numeric vector "a", a string vector "CA", and a scalar "pi".
mixed # Display the content in each element of mixed.
names(mixed) <- c("a", "CA", "pi") # Name each element of "mixed"
mixed$a # Display vector "a" [This command works only after you name the elements like above.]
mixed[[1]]# Alternatively, display the first element of "mixed" 

########################## 1.3. Data Frames and Data Files

# A data frame (or data set) is an object that collects vectors (or variables) of an equal length.
#  For example, for each student, we may have SAT scores, high school GPA, and college GPA.
# A data file can include multiple data sets and other objects in R. 

########################### 1.3.1 Data Frames 
# In a data frame, the rows represent the observational units (like students), 
# and the columns represent variables (SAT scores, high school GPA, and college GPA, etc.) 

# Typically, you import a data set stored in some data format (~~.csv, ~~.xls, etc.) from an external source.
# Here, we construct a data frame by hand from scratch.
# Suppose we have 3 students and their SAT scores, high school GPA, and college GPA.

# Generate a vector with student names.
student_name <- c("Julian", "Ken", "Amy")
# Generate a vector with SAT scores.
SAT <- c(1100, 1030, 1080)
# Generate a vector with high school GPA.
highschoolGPA <- c(3.8, 3.5, 4.0)
# Generate a vector with college GPA.
collegeGPA <- c(3.9, 3.7, 3.8)

# Bundle the 3 column vectors together.
academic <- cbind(SAT, highschoolGPA, collegeGPA)
academic

# Name each row using "student_name" vector.
rownames(academic) <- student_name
academic

# Transform this matrix into a data frame.
academic_data <- as.data.frame(academic)
academic_data

# A variable (column) of a data set can be specified by writing $variable_name after dataset name.
academic_data$SAT
# Alternatively, you can "attach" data frames. After executing attach command, you only need to type variable name.
attach(academic_data)

SAT
highschoolGPA
collegeGPA

detach(academic_data)

# Generate a new variable containing average GPA for each student.
academic_data$averageGPA <- (highschoolGPA + collegeGPA) / 2
academic_data$averageGPA

######### 1.3.2 Subsets of Data
# We can extract a subset of a data frame.
# Our full data frame is 
academic_data

academic_data2 <- subset(academic_data, averageGPA > 3.7)
academic_data2

########################### 1.3.3 R Data files
# You can save all the objects you have generated by the following command.
# name.RData is stored in the folder whose pass is specified at the beginnning.   
setwd("C:/Users/kensu/OneDrive - ucsc.edu/Desktop/UCSC_2023_Winter/Econ 114 (TA)/Lab/Lab 1/")
save(list=ls(), file = "section 1.RData")

############################################# Let me clear the objeects I have generated until now.
rm(list = ls())

########################### 1.4. Base Graphics
########################### 1.4.1. Basic Graphs

# To draw a graph for f(x)=x^3, -3 <= x <= 3,
curve(x^3, -3, 3)

# Now generate simple data and plot them in various types of graph
x <- c(1,3,4,7,8,9)
y <- c(0,3,6,9,7,8)

x
y

xy_mat <- cbind(x,y)
xy_mat
xy_data <- as.data.frame(xy_mat)

xy_data$x

attach(xy_data)
x

plot(x,y)  # Scatter plot
plot(x,y, type="l") # line graph
plot(x,y, type="b") # line graph with marker
plot(x,y, type = "s") # step function
plot(x,y, type = "h")

########################### 1.4.3. Overlaying Several Plots
# We can plot multiple graphs on the same x-y plane
# For example, let's plot probability density functions (pdfs) of normal distribution with mean = 0 and sd = 1 or 2 or 3.

curve(dnorm(x,0,1), -10, 10, lwd = 1, lty = 1) # Plot a pdf for N(0,1), for x from -10 to 10. lwd and lty are options for line width and line type.
curve(dnorm(x,0,2), add = TRUE, lwd = 2, lty = 2) # Now we add a pdf for N(0,2) on the previous graph.
curve(dnorm(x,0,3), add = TRUE, lwd = 3, lty = 3) # Add one more. Draw a pdf for N(0,3).

abline(v = 0) # abline(v=value(s)) command adds a vertical line. Here we add a vertical line at x=0, which is mean of N(0,1), N(0,2), and N(o,3).
abline(h = 0.23) #Similary, you can add a horizontal line at y=0.23.
slope <- 0.23/5
abline(a=0.23, b=slope) # Here, you can add a linear function with intercept a=0.23 and slope b=0.046 (=0.23/5).
text(1, 0.3, "N(0,1)") #Now we add N(0,1) as a text. (1,0.3) specifies a (x,y) coordinate to which we add the text. 
text(2,0.13, "N(0,2)")
text(3,0.09, "N(0,3)")

arrows(5,0.3,1,0.3) # You can add an arrow. Here This arrow is from (5,0.3) to (1,0.3).
text(8,0.3, "This is pdf for N(0,1)")

points(-7, 0.3) # This allows you to add a point at (x,y)=(-7, 0.3).

# Another example: When you have multiple y variables (sales of different products) against a common x variable (year),
# matplot might be a useful command.

year <-c(2008, 2009, 2010, 2011, 2012, 2013)
product1 <- c(0,3,6,9,7,8)
product2 <- c(1,2,3,5,9,6)
product3 <- c(2,4,4,2,3,2)
sales <- cbind(product1, product2, product3)
matplot(year, sales, type = "b", lwd = c(1,2,3), col="black")



############################################# Let me clear the objects I have generated until now.
rm(list = ls())

########################## 1.6. Descriptive Statistics
########################### 1.6.1 Discrete Distributions: Frequencies and Contingency Tables

# The textbook has a support package which includes example data sets used in it.  
# Here we install the textbook package into our own computer.
install.packages("wooldridge")
library(wooldridge) # Load the package into R.

data("affairs")
attach(affairs)

# Click "affairs" in the environment window and check how the data set looks like.
# Notice there are qualitative variables.
# "kids" variable is a binary (dummy) variable.
# "ratemarr" respondents' rating of own marriage (1= very unhappy,..., 5= very happy). 

# From the "affairs" data set, extract two facor variables and label category values.
# First, create "haskids" object and plug "kids" variable into it with 0 labeled "no" and 1 labeled "yes"
kids[1:10]
haskids <- factor(kids, labels = c("no", "yes"))
haskids[1:10]
affairs$haskids <- factor(kids, labels = c("no", "yes"))

# Next, create "marriage" from "ratemarr" variable with category values properly labeled. 
ratemarr[1:10]

mlab <- c("very unhappy", "unhappy", "average", "happy", "very happy")
marriage <- factor(ratemarr, labels = mlab)
marriage[1:10]

# One way to analyze the basic tendency of the data is to create a frequency table.
table(haskids) # count number of observations for each category
prop.table(table(haskids))
prop.table(table(marriage)) # count the share of observations in each category to the entire observations. 


# A contingency table cross-tabulates two categorical variables.
countstab <- table(marriage, haskids)
countstab

# Prob(haskids|marriage) : For each category of marriage rating, what fraction has kids?
prop.table(table(marriage, haskids), margin = 1)

# Prob(marriage|haskids) : What fraction of individuals with/without kids are very happy,..., very unhappy with own marriage?
prop.table(table(marriage, haskids), margin = 2)

# Visualize the distribution of marriage
pie(table(marriage), col = gray(seq(0.2,1,0.2))) # Pie chart
barplot(table(marriage), horiz = TRUE, las=1, main="Distribution of Happiness") # Horizontal bar chart
barplot(table(haskids, marriage), horiz=TRUE, las=1, legend = TRUE, args.legend = c(x="bottomright"), main = "Happiness by Kids" )
barplot(table(haskids, marriage), beside = TRUE, las=2, legend = TRUE, args.legend = c(x="top"), main = "Happiness by Kids" )


#################################### Let me clear the objeects I have generated until now.
rm(list = ls())

########################### 1.6.2 Continuous Distributions: Histogram and Density
# For continuous variables, every observation has a distinct value. Examples: height, weight, test scores, salary,...
# When a variable is continuous, the values can be grouped into bins (intervals).
# Test scores might be grouped into [1,10], [11,20],...,[91,100]. If your score is 95, it belongs to [91,100].
# Histogram counts the number of observations that fall into each bin and show it as a chart.
# You specify a proper bin width (in the above example, bin width = 10), or R automatically chooses it.

# Here we analyze CEO compensation
data("ceosal1")
attach(ceosal1)
ROE <- roe

# Create a histogram
hist(ROE) # Bin width is selected by R.

# Instead, specify the break points by a vector. (Bins are not necessarily equally spaced.) 
hist(ROE, breaks = c(0,5,10,20,30,60)) # Now the histogram is based on the fraction of observations in each bin. 

# While a bit advanced topic, kernel density is another way to describe the distribution of a variable.
# A kernel function locally evaluates density of a variable at an arbitrary point x and its neighborhood.
# A kernel density plot is made by repeating this evaluation at many different x's and connect them smoothly. 

plot(density(ROE))

hist(ROE, freq = FALSE, ylim = c(0,0.07))
lines(density(ROE), lwd=3)


########################### 1.6.3 Empirical Cumulative Distribution Function (ECDF)
# A CDF is a function defined as F(x)=Prob(X<=x).
# In English, a CDF tells probability that a random variable X takes values less than a particular value x (small x).
# An ECDF is a sample counterpart of F(x) or a kind of an estimated F(x).

plot(ecdf(ROE))

median(ROE)
abline(v=15.5)
abline(h=0.5)

########################### 1.6.4 Fundamental Statistics
# Here we compute sample statistics of CEO salary.
mean(salary) # sample average
median(salary) # sample median
var(salary) # sample variance
sd(salary) # sample standard deviation

summary(salary) # Instead, you can find mean, min, max, and quartiles by summary command.

cor(salary, roe) # sample correlation coefficient

# A box plot displays the median, the 1st and 3rd quartile, and extreme points. (p.65)
# The box is usually drawn from Q1 (25th percentile) to Q3 (75th percentile) values.
# There are different choices for whiskers (lines below and above the box). One choice is
#  The lower bound =  max{Q1 - 1.5*(Q3-Q1), min(data)}
#  The upper bound =  min{Q3 + 1.5*(Q3-Q1), max(data)}

boxplot(ROE, horizontal = TRUE)





