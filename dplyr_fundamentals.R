# dplyr_fundamentals.R

# Load necessary library
library(dplyr)

# Create an example data frame
df <- tibble(
    ID = 1:6,
    Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank"),
    Age = c(25, 30, 35, 40, 45, 50),
    Salary = c(50000, 55000, 60000, 65000, 70000, 75000),
    Department = c("HR", "IT", "IT", "HR", "Finance", "Finance")
)

# View the initial data frame
print("Initial Data Frame:")
print(df)

# Step 1: Select specific columns
df_selected <- df %>%
    select(ID, Name, Salary)

print("Selected columns (ID, Name, Salary):")
print(df_selected)

# Step 2: Mutate - Create a new column (e.g., Salary in thousands)
df_mutated <- df %>%
    mutate(Salary_K = Salary / 1000)

print("Data after mutating to create 'Salary_K':")
print(df_mutated)

# Step 3: Nested `select` and `mutate` (Mutate before selecting)
df_selected_mutated <- df %>%
    mutate(Salary_K = Salary / 1000) %>%
    select(ID, Name, Salary_K)

print("Data after nested mutate and select:")
print(df_selected_mutated)

# Step 4: Grouping data and summarizing (by Department)
(df)
dep_group <- df %>% group_by(Department) %>% arrange(Department)
(dep_group)
df_grouped_summary <- df %>%
    group_by(Department) %>%
    summarize(Average_Age = mean(Age), 
              Total_Salary = sum(Salary),
              Count = n())

print("Summary by Department:")
print(df_grouped_summary)

# Step 5: Use arrange to sort data (e.g., by Age in descending order)
df_arranged <- df %>%
    arrange(desc(Age))

print("Data arranged by Age (Descending):")
print(df_arranged)

# Step 6: Combining multiple operations (Select, Mutate, Group By, and Summarize)
df_combined <- df %>%
    select(ID, Name, Age, Salary, Department) %>%
    mutate(Salary_K = Salary / 1000) %>%
    group_by(Department) %>%
    summarize(Average_Age = mean(Age), 
              Average_Salary_K = mean(Salary_K)) %>%
    arrange(Average_Age)

print("Combined operations (Select, Mutate, Group By, Summarize, Arrange):")
print(df_combined)

# Step 7: Use filter to subset data (e.g., Age > 30)
df_filtered <- df %>%
    filter(Age > 30)

print("Data filtered (Age > 30):")
print(df_filtered)

# Step 8: Combine filter with other operations
df_filtered_mutated <- df %>%
    filter(Age > 30) %>%
    mutate(Salary_K = Salary / 1000) %>%
    select(ID, Name, Age, Salary_K)

print("Filtered and mutated data (Age > 30):")
print(df_filtered_mutated)

# Step 9: Chaining multiple operations
df_final <- df %>%
    filter(Salary > 60000) %>%
    mutate(Salary_K = Salary / 1000) %>%
    select(ID, Name, Salary_K) %>%
    arrange(Salary_K)

print("Chained operations (Filter, Mutate, Select, Arrange):")
print(df_final)

# Step 10: Using `ifelse()` inside mutate for conditional operations
df_conditional <- df %>%
    mutate(Salary_Grade = ifelse(Salary > 60000, "High", "Low"))

print("Conditional mutate (Salary > 60000):")
print(df_conditional)


