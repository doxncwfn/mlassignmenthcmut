## ML Assignment — Student Success Classification

### Overview

This project explores preprocessing and modeling for a multi-class classification task (Target: Graduate / Enrolled / Dropout) using a tabular dataset (`data.csv`). It includes EDA visuals, feature engineering, model training with class imbalance handling, hyperparameter tuning, and threshold tuning.

### Project Structure

- `data.csv` — raw dataset (semicolon `;` separated)
- `main.ipynb` — EDA, preprocessing, model training, tuning, and threshold optimization
- `preprocess.ipynb` — alternate EDA and preprocessing exploration
- `images/` — exported plots (auto-saved by notebooks)
- `requirements.txt` — Python dependencies (install as below)

### Environment Setup

```bash
# Python 3.9+ recommended
python3 -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# Or, if populated:
pip install -r requirements.txt
```

### Data

- Columns are renamed to cleaner labels and stray tab characters are stripped.
- Target label is in column `Target` (three classes).

### How to Run

```bash
# In this directory
jupyter notebook
```

Open `main.ipynb` and run all cells (Runtime → Run All). Figures are saved automatically under `images/`.

### Key Preprocessing (as implemented in notebooks)

- Column cleanup and renaming.
- Drop low-signal or leakage-prone columns: `['Debtor','Special Needs','Unemployment rate','Inflation rate','GDP','1st - no evaluations','2nd - no evaluations']`.
- Domain grouping of high-cardinality IDs into compact categorical buckets, e.g. `Application mode`, `Course`, parental qualifications/occupations, `Nationality`, `Marial Status`.
- Recommended: create informative ratios (if not already):
  - `approved/enrolled` and `evaluations/enrolled` for 1st/2nd semester.
- Train/test split before fitting any transformers; fit transforms on train only.

### Encoding & Scaling Guidance

- Categorical features: one-hot encode (avoid ordinal meaning in integer codes).
- Numeric features: scale for linear/KNN models. Prefer `RobustScaler` (outlier-resistant) or `StandardScaler`.
- Tree-based models (RandomForest, HistGradientBoosting) do not require scaling, but one-hot encoding is still fine.

Minimal leak-safe preprocessing + model example:

```python
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder, RobustScaler
from sklearn.pipeline import Pipeline
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

# X = df_[num_cols + cat_cols]; y = df_['Target']
X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, test_size=0.2, random_state=42)
preprocess = ColumnTransformer([
  ('num', RobustScaler(), num_cols),
  ('cat', OneHotEncoder(handle_unknown='ignore', sparse_output=False), cat_cols),
])
clf = Pipeline([
  ('prep', preprocess),
  ('model', LogisticRegression(max_iter=2000, class_weight='balanced', multi_class='ovr')),
])
clf.fit(X_train, y_train)
```

### Modeling

- Baselines: Logistic Regression, RandomForest, GradientBoosting, KNN.
- Class imbalance: `class_weight='balanced'` (or `balanced_subsample` for RF) and stratified CV.
- Hyperparameter tuning: `RandomizedSearchCV` on RF and HistGradientBoosting with `f1_macro` scoring.
- Post-hoc decision threshold tuning (one-vs-rest) to improve macro-F1 on the test set.

### Reproducing Figures

- Run `main.ipynb` to regenerate:
  - `images/target_distribution.png`
  - `images/numeric_histograms.png`
  - `images/correlation_heatmap.png`
  - `images/categorical_distributions*.png`
  - `images/target_by_* .png`
  - `images/tuned_confusion_matrices.png`
  - `images/threshold_tuned_confusion.png`

### Notes

- Scaling is necessary for Logistic Regression and KNN; optional for tree ensembles.
- One-hot encoding is recommended for all transformed categorical features.
- Keep the preprocessing consistent between train and test using a `Pipeline`.

### Acknowledgments

- Dataset and task context per HCMUT ML assignment (see `ML Assignment 251.pdf`).
