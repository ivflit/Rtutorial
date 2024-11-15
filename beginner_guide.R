# =====================================================
# Beginner's Guide to R
# =====================================================

# 1. Getting Started with R Basics
# -----------------------------------------------------

# Printing output in R
print("Hello, R World!")

# Basic arithmetic
2 + 3
10 - 2
5 * 4
20 / 5
2^3   # Exponentiation
sqrt(16)   # Square root

# 2. Loading and Viewing Datasets
# -----------------------------------------------------

# R comes with several built-in datasets. We can view them with the `data()` function
data()   # Lists available datasets

# Loading a built-in dataset, for example, `mtcars`
data("mtcars")  # Loads the dataset
head(mtcars)    # Display the first few rows
tail(mtcars)    # Display the last few rows

# Checking dataset structure
str(mtcars)    # Shows the structure of the dataset (columns and data types)
summary(mtcars) # Provides summary statistics for each column

# Load the `dplyr` package for easy data manipulation
# Install `dplyr` if you haven't done so already
install.packages("dplyr")
library(dplyr)


# 3. Viewing the Structure of the Dataset
# -----------------------------------------------------

# Check the structure of `mtcars` and see all available columns
str(mtcars)
names(mtcars)
dim(mtcars)
mtcars$mpg
# 4. Selecting Specific Columns
# -----------------------------------------------------

# Explanation:
# The `%>%` symbol is the **pipe operator** from the `dplyr` package.
# It allows you to pass the output of one function to the next function.
# In this case, `mtcars %>% select(mpg, hp, cyl)` takes `mtcars`,
# and then selects only the columns `mpg`, `hp`, and `cyl`.

# Selecting specific columns using `dplyr`
mtcars_selected <- mtcars %>% select(mpg, hp, cyl)
head(mtcars_selected)

# Alternative way to select columns using Base R
mtcars_selected_base <- mtcars[, c("mpg", "hp", "cyl")]
head(mtcars_selected_base)

# 5. Filtering Cars with High Horsepower
# -----------------------------------------------------

# Filter rows where horsepower (`hp`) is greater than 200
high_hp_cars <- mtcars %>% filter(hp > 200)
high_hp_cars

# Same filter using Base R
high_hp_cars_base <- mtcars[mtcars$hp > 200, ]
high_hp_cars_base


# 6. Finding the Car with the Maximum Horsepower
# -----------------------------------------------------

# Use `filter` and `max` to find the car(s) with the highest horsepower
max_hp_car <- mtcars %>% filter(hp == max(hp))
max_hp_car

# Same operation in Base R
max_hp_car_base <- mtcars[mtcars$hp == max(mtcars$hp), ]
max_hp_car_base

# 7. Sorting Cars by Horsepower in Descending Order
# -----------------------------------------------------

# Sort cars by horsepower in descending order using `arrange`
sorted_by_hp <- mtcars %>% arrange(desc(hp))
head(sorted_by_hp)

# Same sorting operation in Base R
sorted_by_hp_base <- mtcars[order(-mtcars$hp), ]
head(sorted_by_hp_base)

# 8. Filtering for High Horsepower and Specific Cylinder Count
# -----------------------------------------------------

# Example: Cars with `hp > 150` and `cyl == 8`
high_hp_eight_cyl <- mtcars %>% filter(hp > 150, cyl == 8)
high_hp_eight_cyl

# Same filter in Base R
high_hp_eight_cyl_base <- mtcars[mtcars$hp > 150 & mtcars$cyl == 8, ]
high_hp_eight_cyl_base

# 9. Calculating the Average MPG by Cylinder Count
# -----------------------------------------------------

# Group data by cylinder count (`cyl`) and calculate the average MPG
avg_mpg_by_cyl <- mtcars %>%
    group_by(cyl) %>%
    summarize(avg_mpg = mean(mpg))
avg_mpg_by_cyl

# 10. Filtering Cars with Above-Average MPG
# -----------------------------------------------------

# Find cars with MPG above the overall average MPG
avg_mpg <- mean(mtcars$mpg)
high_mpg_cars <- mtcars %>% filter(mpg > avg_mpg)
high_mpg_cars

# Same filter in Base R
high_mpg_cars_base <- mtcars[mtcars$mpg > avg_mpg, ]
high_mpg_cars_base

# 11. Adding a New Column for Power-to-Weight Ratio
# -----------------------------------------------------

# Create a new column `power_to_weight` by dividing `hp` by `wt`
mtcars <- mtcars %>% mutate(power_to_weight = hp / wt)
head(mtcars)

# Same calculation in Base R
mtcars$power_to_weight_base <- mtcars$hp / mtcars$wt
head(mtcars)

desc_ptw_mtccars<- mtcars %>% arrange(desc(power_to_weight))
head(desc_ptw_mtccars)

# 12. Basic Data Structures in R
# -----------------------------------------------------

# R has several basic data structures. Here are the most commonly used ones:

# (a) Vector: A sequence of data elements of the same type
2:10
seq(from=2, to=10)
seq(from=5, to=50, by=5)
my_vector <- c(1, 2, 3, 4, 5)
print(my_vector)

# (b) Matrix: A 2D collection of elements of the same type
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)
print(my_matrix)
my_matrix <- matrix(1:9, nrow = 3, ncol = 3, byrow=TRUE)
print(my_matrix)

# (c) Data Frame: A table-like structure where columns can have different types
my_data <- data.frame(
    Name = c("Alice", "Bob", "Charlie"),
    Age = c(25, 30, 35),
    Score = c(90, 85, 88)
)
print(my_data)

# (d) List: A flexible data structure that can contain different types of elements
my_list <- list(
    Number = 42,
    Text = "Hello",
    Vector = c(1, 2, 3)
)
print(my_list)

ls()
test <- 123
ls()
rm(test)
ls()
typeof(3342L)
# 13. Creating Functions in R
# -----------------------------------------------------

# Functions in R are created using the function() keyword

# Example: A function to calculate the square of a number
square <- function(x) {
    return(x^2)
}

# Using the function
square(4)    # Output will be 16

# Example: A function to add two numbers
add_numbers <- function(a, b) {
    result <- a + b
    return(result)
}

# Using the function
add_numbers(10, 15)   # Output will be 25

# 5. Basic Plotting in R
# -----------------------------------------------------

# R provides powerful plotting functions for visualizing data.
# We'll use the `plot()` function for simple plots.

# Simple Scatter Plot
plot(mtcars$hp, mtcars$mpg,  # X-axis: hp, Y-axis: mpg
     main = "Horsepower vs. MPG",
     xlab = "Horsepower",
     ylab = "Miles Per Gallon",
     col = "blue", pch = 19)   # Customize color and point type

# Histogram
hist(mtcars$mpg,
     main = "Histogram of Miles Per Gallon",
     xlab = "Miles Per Gallon",
     col = "lightblue",
     border = "black")

# Box Plot
boxplot(mtcars$mpg ~ mtcars$cyl,
        main = "MPG by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        col = c("lightblue", "lightgreen", "lightpink"))

# Line Plot
x <- 1:10
y <- x^2   # y is the square of x
plot(x, y, type = "o",
     main = "Line Plot of y = x^2",
     xlab = "x",
     ylab = "y")

# 14. Reading and Loading Data from a CSV File
# -----------------------------------------------------

# You can load data from a CSV file using the `read.csv()` function.
# Ensure the file path is correct. Here's how to read a CSV file:

# Example: Reading a CSV file from your local directory
my_data_csv <- read.csv("sample_data.csv")

# View the first few rows of the dataset
head(my_data_csv)

# You can also specify the separator if your file uses something other than commas
# Example: Reading a CSV with a semicolon delimiter
my_data_csv_semicolon <- read.csv("sample_data.csv", sep = ";")
head(my_data_csv_semicolon)

# To ensure the data is read correctly, you can check the structure and summary
str(my_data_csv)
summary(my_data_csv)

# Create a sample data frame
my_data <- data.frame(
    Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
    Age = c(25, 30, 35, 40, 22),
    Score = c(90, 85, 88, 92, 87)
)

# Write the data frame to a CSV file
write.csv(my_data, "my_data.csv", row.names = FALSE)

# Let's say you've filtered data from mtcars and want to save it to a new CSV file
high_hp_cars <- mtcars[mtcars$hp > 150, ]
(high_hp_cars)
high_hp_cars_with_filter <- mtcars %>% filter(hp > 150)
(high_hp_cars_with_filter)
# Now write the filtered data to a CSV file
write.csv(high_hp_cars, "high_hp_cars.csv", row.names = FALSE)

# In this case, "path/to/your/directory" should be the desired location on your system.
# row.names = FALSE ensures that row numbers are not included in the CSV file.

# You can also handle CSV files with larger datasets by using `fread` from the `data.table` package, 
# which is faster for large files:
# install.packages("data.table")
# library(data.table)
# my_data_csv_fast <- fread("sample_data.csv")
# head(my_data_csv_fast)


# 15. Connecting to a Database and Loading Data
# -----------------------------------------------------

# To connect to a database and load data into R, you typically use the `DBI` package,
# which provides a unified interface for connecting to various databases such as MySQL, SQLite, PostgreSQL, etc.

# Install and load the necessary packages (DBI and RMySQL for MySQL, or RSQLite for SQLite)
# install.packages("DBI")
# install.packages("RMySQL")  # For MySQL databases
# install.packages("RSQLite") # For SQLite databases
library(DBI)

# Example: Connecting to an SQLite database
con <- dbConnect(RSQLite::SQLite(), "path/to/your/database.sqlite")

# Example: Connecting to a MySQL database
# con <- dbConnect(RMySQL::MySQL(), dbname = "your_dbname", host = "your_host", 
#                  user = "your_user", password = "your_password")

# Once connected, you can query the database and load data into a data frame
query <- "SELECT * FROM your_table_name"
my_data_db <- dbGetQuery(con, query)

# View the first few rows of the data
head(my_data_db)

# Check the structure of the database data
str(my_data_db)

# After you're done, don't forget to disconnect from the database
dbDisconnect(con)

# Example for working with a PostgreSQL database (additional installation needed):
# install.packages("RPostgreSQL")
# library(RPostgreSQL)
# con <- dbConnect(RPostgreSQL::PostgreSQL(), dbname = "your_dbname", 
#                  host = "your_host", user = "your_user", password = "your_password")
# dbGetQuery(con, "SELECT * FROM your_table_name")
# dbDisconnect(con)

