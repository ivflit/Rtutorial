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
