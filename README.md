# 🔬 Fuzzy C-means Based Biclustering for Gene Expression Data

This repository provides an implementation of **Fuzzy C-means based biclustering** using **subspace clustering** on gene expression datasets.

The main function is:

```matlab
[lambda, gamma, center, U, W, dist, obj_fcn] = Subspace(data, Nc, Nr, options)

📦 Function Overview
Subspace
Performs biclustering using fuzzy membership matrices for genes (rows) and conditions (columns), and simultaneously learns subspace cluster centers.

Inputs:

data → (matrix) Gene expression matrix (genes × samples)

Nc → (int) Number of row clusters (samples)

Nr → (int) Number of column clusters (genes)

options (optional) → vector of parameters:

expo: Exponent for the partition matrix U (default = 2)

max_iter: Max iterations (default = 100)

min_impro: Minimum improvement threshold (default = 1e-5)

display: Whether to show iteration progress (default = 1)

Outputs:

lambda: Row-specific scaling factor

gamma: Column-specific scaling factor

center: Cluster centers (Nr × Nc)

U: Fuzzy membership matrix for rows

W: Fuzzy membership matrix for columns

dist: Distance matrix

obj_fcn: Objective function value at each iteration

🚀 Example Usag

data = rand(100, 20);    % Simulated gene expression data (100 genes × 20 samples)
Nc = 3;                  % Number of sample clusters
Nr = 4;                  % Number of gene clusters

[lambda, gamma, center, U, W, dist, obj_fcn] = Subspace(data, Nc, Nr);

🧠 How It Works
This method jointly:

Learns row and column fuzzy clusters

Updates subspace centers

Minimizes an objective function iteratively using distance-based fuzzy logic

It builds on:

Fuzzy k-means clustering

Subspace learning for biclustering

Gene expression matrix structure

📁 File Structure
File	Description
Subspace.m	Main function for biclustering
Step_Subspace.m	One iteration step of subspace update
initfkmu.m	Initializes fuzzy membership for rows
initfkmw.m	Initializes fuzzy membership for columns

📄 License
MIT License — feel free to use and modify with attribution.

👤 Author
Vikas Singh
📧 vikkysingh07@gmail.com
🌐 GitHub Profile

🧬 Citation
If you use this code in your research, please consider citing it or mentioning the repository in your methods section.

