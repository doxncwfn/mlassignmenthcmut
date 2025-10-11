# ML Assignment HCMUT

This repository contains code, notebooks, and report files for a machine learning assignment focused on predicting student dropout and academic success.

- **Repository:** [doxncwfn/mlassignmenthcmut](https://github.com/doxncwfn/mlassignmenthcmut)
- **Primary Language:** Jupyter Notebook, Python, LaTeX

## Repository Structure

```
mlassignmenthcmut/
├── .gitignore                  # Git ignore file for excluding temporary and build files
├── ML Assignment 251.pdf       # PDF document outlining the machine learning assignment requirements
├── readme.md                   # This README file providing project overview and instructions
├── requirements.txt            # List of Python dependencies required to run the project
├── data/
│   ├── data.csv                # Raw dataset for the student success classification task
│   └── engineered_features.csv # Dataset with engineered features for model training
├── docs/
│   ├── hcmut-logo.png          # Logo image for HCMUT (Ho Chi Minh University of Technology)
│   ├── hcmut-report.cls        # Custom LaTeX class for formatting HCMUT reports
│   ├── main.pdf                # Compiled PDF report for the assignment
│   ├── main.tex                # Main LaTeX source for the assignment report
│   └── images/                 # Directory for storing report-related images
└── src/
    ├── hypertuning.ipynb       # Notebook for hyperparameter tuning and model optimization
    ├── main.ipynb              # Main notebook for EDA, preprocessing, and overall workflow
    ├── preprocess.ipynb        # Notebook for data preprocessing and feature engineering experiments
    └── train.ipynb             # Notebook for training and evaluating ML models
```

### Key Files and Their Functions

#### docs/

- [`main.tex`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/docs/main.tex)  
  The main LaTeX file for the assignment report. It contains the structure, formatting, and content for the final document submitted for the assignment.

- [`hcmut-report.cls`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/docs/hcmut-report.cls)  
  Custom LaTeX class file designed for HCMUT assignments. Provides tailored formatting, university branding, and macros for report consistency.

#### src/

- [`visualize.ipynb`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/src/visualize.ipynb)  
  Jupyter Notebook for visualizing the raw student data. Provides exploratory plots and summary statistics to understand the dataset before preprocessing and modeling.
- [`preprocess.ipynb`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/src/preprocess.ipynb)  
  Jupyter Notebook for data preprocessing. Responsible for cleaning, transforming, and preparing the raw student data before training and analysis.

- [`train.ipynb`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/src/train.ipynb)  
  Jupyter Notebook that loads the processed student dataset, performs exploratory data analysis, feature engineering, and trains machine learning models to predict student outcomes.

- [`hypertuning.ipynb`](https://github.com/doxncwfn/mlassignmenthcmut/blob/main/src/hypertuning.ipynb)  
  Notebook for conducting hyperparameter tuning. Includes code to split data, select features, encode categorical and numerical variables, and optimize model parameters for best performance.

_(Other files may be present. To see all files, browse the repo: [GitHub source tree](https://github.com/doxncwfn/mlassignmenthcmut/tree/main))_

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/doxncwfn/mlassignmenthcmut.git
   ```
2. **Navigate to the folder:**
   ```bash
   cd mlassignmenthcmut
   ```
3. **Open notebooks:**
   Use Jupyter Notebook or JupyterLab to open `.ipynb` files in `src/`.

## Requirements

- Python 3.8+ recommended
- Jupyter Notebook or JupyterLab
- ML libraries: numpy, pandas, scikit-learn, matplotlib, etc.
- LaTeX distribution (for compiling `docs/main.tex`)

Install Python dependencies:

```bash
# Install Dependencies
pip install -r requirements.txt
```

## Usage

- **Development:** Use notebooks in `src/` to run experiments, train models, and tune hyperparameters.
- **Documentation:** Edit or compile `docs/main.tex` for the final report. Use `hcmut-report.cls` for consistent formatting.

## Contributing

Contributions are welcome! Fork the repo and submit a pull request.

## License

No license specified. Please contact the repository owner for usage permissions.

## Contact

For questions or support, contact [doxncwfn](https://github.com/doxncwfn).

---

_Last updated: 2025-10-11_
