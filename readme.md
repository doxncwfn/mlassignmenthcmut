## Project Overview

This repository contains a machine learning assignment for Ho Chi Minh University of Technology (HCMUT) focused on **predicting student dropout and academic success**. The project involves a complete ML pipeline from exploratory data analysis to model training and hyperparameter optimization.

**Primary Language:** Python (Jupyter Notebooks)
**Domain:** Educational Data Mining / Student Success Prediction
**Target Classes:** Graduate, Enrolled, Dropout

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
    ├── visualize.ipynb         # Notebook for visualization and statistical working on raw dataset
    ├── preprocess.ipynb        # Notebook for data preprocessing and feature engineering experiments
    ├── train.ipynb             # Notebook for training and evaluating ML models
    └── main.ipynb              # Main notebook for EDA, preprocessing, and overall workflow
```

### Environment Setup

```bash
# Install dependencies
pip install -r requirements.txt

# Start Jupyter environment
jupyter notebook
# or
jupyter lab
```

### Notebook Execution Order

The notebooks should be run in this sequence for proper workflow:

1. `src/visualize.ipynb` - Data visualization and initial exploration
2. `src/preprocess.ipynb` - Data cleaning and feature engineering
3. `src/train.ipynb` - Model training and evaluation
4. `src/hypertuning.ipynb` - Hyperparameter optimization

### Data Workflow

```bash
# Raw data location
data/data.csv

# Processed data with engineered features
data/engineered_features.csv
```

### Report Generation

```bash
# Compile LaTeX report (requires LaTeX distribution)
cd docs/
pdflatex main.tex
# or
latexmk -pdf main.tex
```

## Code Architecture

### Data Pipeline Architecture

- **Raw Data**: Student academic and demographic data with 37 features
- **Feature Engineering**: Creates additional features like approval rates, grade deltas, and age groups
- **Target Encoding**: Maps categorical targets (Graduate, Enrolled, Dropout) to numerical values (0, 1, 2)

### ML Pipeline Structure

1. **Data Preprocessing Pipeline**:

   - Numerical features: Scaled using `RobustScaler`
   - Categorical features: One-hot encoded with unknown value handling
   - Feature selection combines both numerical and categorical transformations

2. **Model Architecture**:

   - Primary models: Random Forest and Gradient Boosting classifiers
   - Cross-validation: Stratified 5-fold CV for imbalanced data handling
   - Evaluation: Multi-class classification with macro-averaged F1 score

3. **Hyperparameter Optimization**:
   - Uses `RandomizedSearchCV` for efficient parameter space exploration
   - Handles class imbalance through balanced sampling and custom scoring
   - Separate parameter grids for each model type

### Key Feature Engineering

The preprocessing pipeline creates derived features that significantly impact model performance:

- **Approval Rates**: `1st_approval_rate`, `2nd_approval_rate` (semester-wise success rates)
- **Grade Averages**: `1st_avg_grade`, `2nd_avg_grade` (academic performance metrics)
- **Performance Deltas**: `delta_approval_rate`, `delta_avg_grade` (performance changes between semesters)
- **Age Grouping**: Categorical age groups for demographic analysis

### Model Configuration

The hyperparameter tuning uses these parameter spaces:

- **Random Forest**: 300-500 trees, depth 20-30, balanced class weights
- **Gradient Boosting**: 100-300 estimators, learning rates 0.01-0.15, depth 3-9

## Data Structure

### Input Features (37 columns)

- **Demographic**: Marital status, nationality, age, gender
- **Academic Background**: Previous qualifications, admission grades
- **Parental**: Mother's/Father's qualification and occupation
- **Financial**: Scholarship status, tuition payment status
- **Academic Performance**: Semester-wise enrolled/approved/grade metrics
- **Economic**: Unemployment rate, inflation rate, GDP

### Engineered Features (10 additional)

- Approval rate calculations for each semester
- Average grade computations
- Performance change metrics (deltas)
- Age group categorization (0: 18-20, 1: 21-25, 2: 26-35, 3: 36+)

### Target Variable

- **Graduate** (0): Successfully completed the program
- **Enrolled** (1): Currently active in the program
- **Dropout** (2): Left the program without completion

## Report System

The project uses a custom LaTeX class (`hcmut-report.cls`) for academic report formatting:

- University branding and formatting standards
- Code highlighting for Python, SQL, JavaScript, and TypeScript
- Professional academic document structure
- Automated figure and table management

### LaTeX Structure

- Custom document class with HCMUT styling
- Multi-language code highlighting support
- Professional table and figure formatting
- Automated page numbering and cross-references

## Important Files

- `data/data.csv`: Original dataset with student information
- `data/engineered_features.csv`: Processed dataset with additional features
- `src/preprocess.ipynb`: Core feature engineering logic
- `src/hypertuning.ipynb`: Model optimization with best parameters
- `docs/hcmut-report.cls`: University-specific LaTeX formatting
- `requirements.txt`: Exact dependency versions for reproducibility

## Development Notes

### Class Imbalance Handling

The dataset has imbalanced target classes, addressed through:

- Stratified sampling in train/test splits
- Balanced class weights in Random Forest
- Macro-averaged scoring metrics
- Custom sample weight computation

### Model Performance Context

Current best performance metrics from hyperparameter tuning:

- Random Forest: ~77.25% accuracy with balanced_subsample weighting
- Gradient Boosting: ~77.11% accuracy with optimized parameters

### Data Quality Considerations

- Some features have missing values that need handling
- Categorical variables are encoded numerically in raw data
- Economic indicators (GDP, inflation) provide temporal context
- Academic performance metrics span two semesters for trend analysis
