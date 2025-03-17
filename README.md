---

## Proposed Solution for Glossary Extraction

Hello,  
I would like to propose the following solution to extract and structure glossary data from PDFs. I believe this approach can address the challenges of misaligned definitions and irregular formatting while providing **results in seconds**.
- get_glossary.ipynb file will help you to extract the required data from the PDFs and provide you with a CSV file
- glossCSV.R file simply converts the generated CSV files into tidyverse dataframes for further processing

---

### Context and Motivation

Traditional OCR methods often return raw text that loses the context and structure of the original document. This leads to:

- **Loss of Context & Structure:** Traditional methods may extract text as disjointed lines, making it difficult to reliably locate and extract glossary items using regular expressions or language models.
- **Inconsistent Layouts:** Some PDFs, particularly complex ones, may have glossary terms defined on different pages or sections, complicating the extraction process.

To overcome these challenges, I evaluated advanced OCR models that preserve document structure. After testing models from Mistral AI and Landing AI, I chose the Mistral AI OCR model (released on March 6, 2025) due to its robust performance.

---

### Approach

1. **Data Extraction:**
   - For simple PDFs (e.g., the glossary on page 9), I used both **pdftools** in **RStudio** and the Mistral AI OCR model. While **pdftools** package works well on simple layouts, it struggles with complex PDFs.
   - The Mistral AI OCR model converts the PDF to Markdown, preserving much of the original context, including text, images, and tabular data.

2. **Processing Markdown:**
   - The Markdown format is well suited for passing the text to language models (LLMs) for further extraction.
   - I then create one AI Agent(Glossary Extractor) or use an LLM to extract glossary items (terms and definitions) and output them as a CSV file, which is easily imported into R as a tidy dataframe.

3. **Handling Complex PDFs:**
   - In complex PDFs, such as one where the glossary appears on page 170, the OCR conversion method performs very well. It lists all glossary items and definitions from pages 170–175.
   - Notably, if the PDF marks sections (i.e., where some terms are defined in one section and others are only referenced), my approach also captures those section indicators.
   - I have an additional solution for cases where definitions are placed elsewhere; however, it has not been fully tested yet.

4. **Inconsistency Detection:**
   - To identify misaligned definitions or irregularities for the same term, we can use the **stringdist** package in R. This method computes fuzzy distances between definitions to quantify differences.
   - Alternatively, an AI agent with proper prompting can be leveraged to resolve inconsistencies.
   - In my current workflow, the approach produces word-for-word definitions in tidyverse dataframes, which can then be manually or algorithmically refined.

5. **Reliability and Verification:**
   - I enjoy working with AI agents and LLMs; however, I always double-check their outputs as they can make mistakes even with the best prompting.
   - For this particular task of extracting glossary data, my approach has consistently delivered high-quality, accurate results in seconds.

---

### Summary of Results

- **Simple PDF (Page 9):**  
  The method is flawless and accurately lists all terms and definitions.
- **Complex PDF (Pages 170–175):**  
  The approach performs very well, capturing in-place definitions. However, after the glossary items, it also captures definitions that were not directly mentioned in Glossary but somewhere else in the PDF. It can be both be a very good feature and a problem depending on what we are trying to achieve. It can be easily fixed for only extracting terms mentioned **only in Glossary**.
- **Inconsistency Resolution:**  
  Handling misaligned definitions and irregularities for the same usage of terms. Options include using the **stringdist** package in **R** for fuzzy matching or employing an AI agent with additional prompting.
- **Performance:**  
  The entire extraction process completes in seconds, demonstrating both efficiency and robustness.

---

I appreciate your consideration of this solution and would be happy to discuss further improvements or refinements. Thank you for the opportunity to contribute!

---
