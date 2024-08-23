setwd("/Users/hsinyuwu/Desktop/")
library("dplyr")
library("tidyr")
library("magrittr")

df = read.table('GSE112509_DESeq2_normalized_counts.txt')

### create a new row for the identification of N1, N2, M1, M2 ###
row_to_duplicate = df[1,]
# insert the new row by the index position
data_before = df[1:1,]
data_after = df[2:nrow(df),]
new_df = bind_rows(data_before, row_to_duplicate, data_after)


# change header to geneid name
colnames(new_df) = new_df[1, ]

# replace column names from "-" to "." 
colnames(new_df) = gsub("-", ".", colnames(new_df))


# Replace variables in the specified row with N1, N2, M1, M2 from the specified columns
n1 = c("LE.063.SP.064_N", "LE.117.RB.118_N", "FKH.021.022_N", "LE.081.TR.082_N", "BO.001.SH.002_N",
            "LE.047.LF.048_N", "LE.061.TM.062_N", "LE.037.RG.038_N", "LE.019.WP.020_N", "LE.029.SE.030_N",
            "018_N", "LE.021.TH.022_N", "FKH.027.028_N")
new_df[2, n1] = "Naevi1"

m1 = c("PS_M", "LE.129.NG_M", "RH_M", "LE.117.RB_M", "LE.037.RG_M", "KO.679_M", "BO.003.AW_M", "BO.011.WK_M", 
       "LE.039.BE_M", "SMI_M", "SM0_M", "SMIII_M", "SMII_M", "BO.009.BS_M", "SMIV_M", "KO.1031_M", "KO.1248_M",
       "KO.1347_M", "LE.025.BI_M", "KO.971_M", "BO.005.SA_M", "MA.001.SH_M", "LE.049.SDI_M", "LE.049.SDII_M", 
       "KO.1039_M", "LE.049.SDIII_M")
new_df[2, m1] = "Mel1"

n2 = c("BO.017.BU.018_N", "BO.005.SA.006_N", "1397_N", "LE.105.TF.106_N", "FKH.008.010_N", "010_N", "BO.015.BW.016_N",
       "031_N", "BO.013.NK.014_N", "LE.041.RL.042_N")
new_df[2, n2] = "Naevi2"

col_to_exclude = c(n1, m1, n2) 
# Find columns to modify (those not in the exclusion list)
columns_to_modify = setdiff(names(new_df), col_to_exclude)
# Iterate over columns and replace values in the second row
for (col in columns_to_modify) {
  new_df[2, col] = "Mel2"}

print(new_df)


### Separate the samples as N1, N2, M1 and M2 ###
# change the row's name
new_df[2,1] = c("Identify")
colnames(new_df) = new_df[2, ]

# Separate samples into each group
n1 = new_df[, colnames(new_df) %in% c("Identify", "Naevi1")]
n2 = new_df[, colnames(new_df) %in% c("Identify", "Naevi2")]
m1 = new_df[, colnames(new_df) %in% c("Identify", "Mel1")]
m2 = new_df[, colnames(new_df) %in% c("Identify", "Mel2")]

# Define a list of data frames and file names
df_groups = list(n1, n2, m1, m2)
file_names = c("n1.txt", "n2.txt", "m1.txt", "m2.txt")

# Specify the common directory (file path)
directory = "/Users/hsinyuwu/Desktop/"

# Use a for loop to write each data frame to its respective file (generate four text files: n1, n2, m1, m2 )
for (i in 1:length(df_groups)) {
  # Remove the specified row
  df_groups[[i]] = df_groups[[i]][-2, ]
  write.table(df_groups[[i]], paste0(directory, file_names[i]), sep=" ", row.names = FALSE, quote = FALSE)
}


### Write data frame into text files to generate different files for each group ###
## Generate 80 files according to the gene ID and the associated group
# Create a list of data frames, each representing a group
groups = list(n1, n2, m1, m2)

# Specify the file path
directory = "/Users/hsinyuwu/Desktop/"

# Loop through four groups
for (group_idx in 1:length(groups)){
  each_group = groups[[group_idx]]
  
  # Remove the second row from the data frame
  each_group = each_group[-c(1,2), ]
  
  # Loop through columns and write each column, including the first column, to a separate file
  for (col_idx in 1:ncol(each_group)) {
    # Create a new data frame with the current column and the first column
    col_df = each_group[, c(1, col_idx)]
    
    # Specify the file name based on the column name
    # Retrieve the column name from colnames(n1) using col_index to generate the file name
    col_name = colnames(each_group)[col_idx]
    file_name = paste0(col_name, ".txt")
    
    # Write the column data to the file
    file_path = file.path(directory, file_name)
    write.table(col_df, file_path, sep = " ", row.names = FALSE, quote = FALSE, col.names = FALSE)
  }
}

