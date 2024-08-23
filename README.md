# RNA-seq Analysis of Melanoma

This repository contains an R script designed to analyze RNA-seq data and categorize melanoma samples into different developmental stages, specifically focusing on Benign Melanocytic Nevi and Primary Melanoma.

### Overview

The script processes RNA-seq normalized counts (in a `.txt` file) and classifies samples into distinct groups. The analysis encompasses a comprehensive RNA-Seq study of laser-microdissected melanocytic nevi (n=23) and primary melanoma samples (n=57), totaling 80 samples[1]. These samples are further characterized into four developmental stages:

- **Nevi1**
- **Nevi2**
- **Mel1**
- **Mel2**

This study utilizes data from the work of M. Kunz et al., as detailed in their paper: *"RNA-seq analysis identifies different transcriptomic types and developmental trajectories of primary melanomas,"* published by Springer Nature in July 2018.

### Key Features

#### Data Classification

- Categorizes RNA-seq data into specific melanoma developmental stages.

#### Outputs

The script generates two types of outputs:

1. **Grouped Text Files:**

   - Four separate text files corresponding to the developmental stages:
     - **`Nevi1.txt`**
     - **`Nevi2.txt`**
     - **`Mel1.txt`**
     - **`Mel2.txt`**

   - Each file contains the RNA-seq normalized counts for samples in the respective stage.

2. **Individual Sample Files:**

   - A total of 80 text files, each named according to the gene ID and the associated group.
   - Each file contains RNA-seq counts for an individual sample and is labeled to indicate its developmental stage.

### How to Use

1. **Prepare Your Data:**

   - Ensure your RNA-seq data is in a normalized counts text file format.

2. **Adjust the Script:**

   - **Adjust Group Count:** Modify the script to reflect the number of developmental stages or groups in your dataset. Find the section in the script where groups are defined and add or remove stages as needed.
   - **Replace Gene IDs:** Update the gene ID mappings in the script if your dataset uses different identifiers. This may involve changing file paths or column names.

3. **Install Required R Packages:**

   - The script requires the following R packages:
     - `dplyr`
     - `tidyr`
     - `magrittr`
   
   - Install these packages if you haven’t already:
     ```r
     install.packages(c("dplyr", "tidyr", "magrittr"))
     ```

4. **Run the Script:**

   - Execute the R script to perform the classification.

5. **Check the Outputs:**

   - The script will produce separate text files for each group or stage defined in your script:
     - **`Group1.txt`**
     - **`Group2.txt`**
     - **`...`**
     - **`GroupN.txt`**

6. **Review the Results:**

   - Each output file contains RNA-seq counts categorized by the respective group or stage.

---

### Notes

- Ensure all necessary R packages are installed and up-to-date before running the script.
- For more detailed instructions on modifying the script, refer to the comments within the R script itself.

---

### References

- [1]Kunz, M., et al. (2018). *RNA-seq analysis identifies different transcriptomic types and developmental trajectories of primary melanomas.* Springer Nature.

---

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Contributing

Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request.

