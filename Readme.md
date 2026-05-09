# PRIMA Benchmark with OptiProfiler

Code and results for benchmarking PRIMA under different constraints and floating-point precisions using OptiProfiler.

## Requirements

- MATLAB R2025b, with GCC and GFortran configured for MEX
- [PRIMA](https://github.com/libprima/prima)
- [OptiProfiler](https://github.com/optiprofiler/optiprofiler)
- [S2MPJ](https://github.com/GrattonToint/S2MPJ) problem library

## Setup

### 1. PRIMA

Clone the repository and compile MEX files:

```sh
git clone https://github.com/libprima/prima.git
```

In MATLAB, navigate to the PRIMA directory and run:

```matlab
options.debug = true; options.single = true; options.quadruple = true;
setup(options); testprima
```

#### PRIMA self-check

After installation, run the built-in test suite from the PRIMA root directory:

```
testprima_ex
```

This verifies that PRIMA and its MEX files are working correctly.

### 2. OptiProfiler

Clone the repository and set up the MATLAB path:

```sh
git clone https://github.com/optiprofiler/optiprofiler.git
```

In MATLAB, navigate to the OptiProfiler directory and run:

```matlab
setup
```

### 3. S2MPJ

Clone the S2MPJ problem library:

```sh
git clone https://github.com/GrattonToint/S2MPJ.git
```

In MATLAB, add it to the path so that OptiProfiler can find the problems:

```matlab
addpath('path/to/S2MPJ')
savepath
```

## Experiments

### 1. Rosenbrock function 

The script `codes/prima_test_Rosenbrock/rosenbrock.m` solves a 20-dimensional Rosenbrock problem under four constraint types: unconstrained, bound, linear, and nonlinear.
With PRIMA on the path, execute:

```
run('codes/prima_test_Rosenbrock/rosenbrock.m')
```

Results are saved in `results/prima_test_Rosenbrock/rosenbrock_results.mat`.

### 2. OptiProfiler examples

To confirm that OptiProfiler runs correctly, enter the `optiprofiler/matlab/examples` folder in MATLAB and run the provided examples one by one:

```
example1; example2; example3; example4
```

These examples use toy solvers and the default problem set; they should complete without errors.

Results are saved in `results/opti_example_test/`.

### 3. Precision comparison benchmarks

The shell script `codes/opti_prima_test/run_all_tests.sh` runs four OptiProfiler benchmarks sequentially. The wrapper solver functions are in `codes/opti_prima_test/`:

| Script | Benchmark configuration |
|---|---|
| `primatest_1.m` | double vs. single, plain |
| `primatest_2.m` | double vs. quadruple, noisy |
| `primatest_3.m` | double vs. quadruple, plain |
| `primatest_4.m` | double vs. single, noisy |

The problem set is `ubln` with dimensions 2-10.

To launch all four:

```sh
cd codes/opti_prima_test
./run_all_tests.sh
```

Each benchmark generates scores and profiles saved in `results/opti_prima_test/`.

## Results

- `results/opti_prima_test/` -- precision benchmark output (profiles, logs, data)
- `results/opti_example_test/` -- OptiProfiler example output
- `results/prima_test_Rosenbrock/rosenbrock_results.mat` -- Rosenbrock constrained test results
- `figures/` -- figures used in the report
- `Evaluating_PRIMA_through_OptiProfiler.pdf` -- full experimental report
- `Evaluating_PRIMA_through_OptiProfiler.tex` -- LaTeX source of the report
- `ref.bib` -- bibliography

## References

1. Z. Zhang. "PRIMA: Reference Implementation for Powell's Methods with Modernization and Amelioration", 2023. DOI: [10.5281/zenodo.8052654](https://doi.org/10.5281/zenodo.8052654). Available at [https://www.libprima.net](https://www.libprima.net).

2. C. Huang, T. M. Ragonneau, and Z. Zhang. "OptiProfiler: a platform for benchmarking optimization solvers", 2026.

3. S2MPJ problem library. [https://github.com/GrattonToint/S2MPJ](https://github.com/GrattonToint/S2MPJ).
