# CTSA: Constrained Tree-Seed Algorithm using Deb’s Rules

This repository provides the official MATLAB implementation of the **Constrained Tree-Seed Algorithm (CTSA)**, a modified version of the original Tree-Seed Algorithm (TSA) designed to solve constrained optimization problems using **Deb’s rules**.

> Ahmet Babalik, Ahmet Cevahir Cinar, Mustafa Servet Kiran,  
> *A modification of tree-seed algorithm using Deb’s rules for constrained optimization*,  
> Applied Soft Computing, Volume 63, 2018, Pages 289–305.  
> DOI: [https://doi.org/10.1016/j.asoc.2017.10.013](https://doi.org/10.1016/j.asoc.2017.10.013)

## 🌲 Algorithm Overview

The CTSA modifies the basic population-based TSA, originally developed for unconstrained problems, by incorporating Deb’s rules for constraint handling. These rules consider both objective value and constraint violations to determine the survival of trees and seeds across iterations.

Key features:
- Based on tree-seed metaphor with survival selection by Deb’s feasibility rules
- Solves constrained optimization without penalty functions
- Tested on **13 benchmark functions** including real-world engineering design problems
- Compared with: PSO, ABC, GA, DE, and state-of-the-art methods

## 📁 Contents

- `run_DebTSA.m`: Main script for executing CTSA
- `output/`: Final results, convergence plots, violation summaries

## 🛠 Requirements

- MATLAB R2015b or later
- No external toolboxes required

## 📌 Citation

Please cite the following paper if you use this code:

```bibtex
@article{babalik2018ctsa,
  title = {A modification of tree-seed algorithm using Deb’s rules for constrained optimization},
  author = {Babalik, Ahmet and Cinar, Ahmet Cevahir and Kiran, Mustafa Servet},
  journal = {Applied Soft Computing},
  volume = {63},
  pages = {289--305},
  year = {2018},
  issn = {1568-4946},
  doi = {10.1016/j.asoc.2017.10.013},
  url = {https://www.sciencedirect.com/science/article/pii/S156849461730618X}
}
```

## 🤝 Contact & Collaboration

For academic or industrial collaboration:

📧 Email: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
