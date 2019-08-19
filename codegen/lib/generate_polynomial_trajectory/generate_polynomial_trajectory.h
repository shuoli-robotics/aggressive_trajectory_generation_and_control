/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_polynomial_trajectory.h
 *
 * Code generation for function 'generate_polynomial_trajectory'
 *
 */

#ifndef GENERATE_POLYNOMIAL_TRAJECTORY_H
#define GENERATE_POLYNOMIAL_TRAJECTORY_H

/* Include files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "generate_polynomial_trajectory_types.h"

/* Function Declarations */
extern void generate_polynomial_trajectory(const double initial_constrains[3],
  const double final_contrains[3], double t0, double tf, double c_p[6], double
  c_v_data[], int c_v_size[2], double c_a_data[], int c_a_size[2], double
  c_j_data[], int c_j_size[2]);

#endif

/* End of code generation (generate_polynomial_trajectory.h) */
