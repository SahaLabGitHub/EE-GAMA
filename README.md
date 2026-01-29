This repository contains all input files for neutral water clusters and protonated (charged) water clusters, along with Perl scripts for performing EE-GAMA calculations (script_EE-GAMA.pl) and non-embedded GAMA calculations (script_GAMA.pl).

For EE-GAMA calculations, two embedding schemes are implemented:
(i) Geometry-Dependent (GD) embedding and
(ii) Geometry-Independent (GI) embedding,
together with three charge population models: Hirshfeld, Mulliken, and CM5.

Below, we provide a representative example illustrating how to run the code for a single isomer of a 25-water cluster. Before execution, please ensure that all required Perl modules are installed, as the entire workflow is implemented in Perl.

Workflow Example: 25-Water Cluster Isomer
Step 1: Generation of Background Charges

For GD embedding, perform a full-system HF/6-311G(d,p) calculation using the desired charge population scheme (e.g., Mulliken) to obtain background charges.
For GI embedding, perform a calculation on a single isolated water molecule, extract the charges, and apply them uniformly across the entire cluster.

Step 2: Fragment Generation

Store the background charge information in a separate file and specify its filename within script_EE-GAMA.pl.
Run the fragmentation code as:

perl script_EE-GAMA.pl 25_1_gama.com


After execution, an output file named 25_1_gama_B2_R5.log ( we provided that file also) is generated, where the box size B = 2 Å and cutoff radius R = 5 Å. This file contains detailed information on the fragmentation procedure, including the complete workflow, all final fragments, and their corresponding coefficients.

Here, 25_1_gama.com is the GAMA fragmentation input file for a specific 25-water cluster isomer.

Step 3: Fragment Calculations and Energy Evaluation

The code generates fragment input files in the format gama_high_i.gjf (i = 1–187). For the 25-water cluster, the parameters B = 2 Å and R = 5 Å are used and are consistently applied to all clusters considered in this study.

Fragment calculations are performed using the provided HPC submission script (g16_array.sbatch) to run multiple Gaussian jobs simultaneously. The total HF and MP2 energies are obtained by summing the energies from all fragment log files (gama_high_1.log to gama_high_187.log) using their corresponding coefficients, followed by careful subtraction of the total self-interaction energy. This procedure yields accurate EE-GAMA energies at both levels of theory.

For a detailed description of the mathematical formulation of GAMA1, GAMA2, EE-GAMA1, and EE-GAMA2, readers are referred to our published work.

Further implementation details are not disclosed at this stage, as the EE-GAMA algorithm is currently under active development.
