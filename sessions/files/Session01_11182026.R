
a <- 1

rm(list = ls())

abs(-2)  # absolute value of -2

sqrt(4)

round(3.14159, 2) # round 3.14159 to 2 digits

f1 <- function(x, y) {
  
  z <- x + y
  return(z)
  
} 

f1(x = 5, y = 6)

# Define a function that calculates 2 times x

h1 <- function(x) {
  
  f <- 2*x
  return(f)
  
}

h1(x = 5)

a <- c(1, 2, 3) # Generate a 3-dimensional vector a using "c()". 
b <- c(4, 5, 6)

a + b

b - a

a * b 

a %*% b 


length(a) # Get dimension of vector a

prod(b)

zeros <- numeric(5)
zeros
g <- rep(3, 5) 
g
h <- seq(10)
h

# A vector of string values
CA <- c("San Francisco", "San Jose", "Santa Cruz")
CA

2 * CA


2 == 2
2 > 3
4 > 3

c(2 == 2, 2 > 3, 4 > 3)

student <- c(1,3,2,2,1,3,3) 
studentlabel <- factor(student, labels = c("Tokyo", "Kanagawa", "Chiba")) # 1=Tokyo, 2=Kanagawa, 3=Chiba
studentlabel

student
studentlabel

studentlabel[7]

# Consider that there are 8 students.
# 1, 3, 5 Kanagawa [2]
# 2, 4    Tokyo [1]
# 6, 7, 8 Chiba [3]
# Create a vector of students' home towns using factor

ss <- c(2,1,2,1,2,3,3,3)
ss_label <- factor(ss, labels = c("Tokyo", "Kanagawa", "Chiba"))
ss_label

# Generate a vector with student names.
student_name <- c("Julian", "Ken", "Amy")
# Generate a vector with SAT scores.
SAT <- c(1100, 1030, 1080)
# Generate a vector with high school GPA.
highschoolGPA <- c(3.8, 3.5, 4.0)
# Generate a vector with college GPA.
collegeGPA <- c(3.9, 3.7, 3.8)


# Generate a vector with student names.
student_name <- c("Julian", "Ken", "Amy")
# Generate a vector with SAT scores.
SAT <- c(1100, 1030, 1080)
# Generate a vector with high school GPA.
highschoolGPA <- c(3.8, 3.5, 4.0)
# Generate a vector with college GPA.
collegeGPA <- c(3.9, 3.7, 3.8)

academic <- cbind(student_name, SAT, highschoolGPA, collegeGPA)
academic
academic_data <- as.data.frame(academic)
academic_data

academic_data2 <- data.frame(
  student_name = c("Julian", "Ken", "Amy"),
  SAT = c(1100, 1030, 1080),
  highschoolGPA = c(3.8, 3.5, 4.0),
  collegeGPA = c(3.9, 3.7, 3.8)
)

academic_data2
plot(academic_data2$highschoolGPA, academic_data2$collegeGPA)
# Create a data frame of county population
c("Los Angeles", "San Diego", "Orange")
c(10014009, 3298634, 3186989)

county_pop <- data.frame(
  county = c("Los Angeles", "San Diego", "Orange"),
  population = c(10014009, 3298634, 3186989)   
)
county_pop[2,2]
county_pop[3,2]

rm(list = ls())
install.packages("tidyverse")
install.packages(c("ggthemes", "data.table", 
                   "haven", "here", "tictoc", "janitor", "fixest", "fs")) 


