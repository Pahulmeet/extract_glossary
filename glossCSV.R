#==================================================================
# Reading one CSV file only and converting it to a tidyverse dataframe
#==================================================================

# Load the tidyverse package
library(tidyverse)

# Read the CSV file (replace "glossary.csv" with the actual file path if different)
glossary_df <- read_csv("C:\\Users\\Pahul\\Downloads\\Coding\\R\\glossary.csv")

# View the structure of the dataframe
glimpse(glossary_df)

# Optionally, print the dataframe
print(glossary_df)

#==================================================================
# Reading multiple csv files and storing them in one big dataframe alongwith their source
#==================================================================

# Define a vector of file names
files <- c("glossary1.csv", "glossary2.csv", "glossary3.csv")

# Define a corresponding vector of source names
source_names <- c("wash_data_pdf_1", "wash_data_pdf_2", "wash_data_pdf_3")

# Read each CSV file, add a "source" column, and store the resulting dataframes in a list
list_of_dfs <- map2(files, source_names, ~ {
  read_csv(.x) %>% 
    mutate(source = .y)
})

# Combine all dataframes into one big dataframe
big_df <- bind_rows(list_of_dfs)

# View the structure of the final dataframe
glimpse(big_df)

# Optionally, print the concatenated dataframe
print(big_df)
