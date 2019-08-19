/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_generate_polynomial_trajectory_api.h
 *
 * Code generation for function '_coder_generate_polynomial_trajectory_api'
 *
 */

#ifndef _CODER_GENERATE_POLYNOMIAL_TRAJECTORY_API_H
#define _CODER_GENERATE_POLYNOMIAL_TRAJECTORY_API_H

/* Include files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_generate_polynomial_trajectory_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void generate_polynomial_trajectory(real_T initial_constrains[3], real_T
  final_contrains[3], real_T t0, real_T tf, real_T c_p[6], real_T c_v_data[],
  int32_T c_v_size[2], real_T c_a_data[], int32_T c_a_size[2], real_T c_j_data[],
  int32_T c_j_size[2]);
extern void generate_polynomial_trajectory_api(const mxArray * const prhs[4],
  int32_T nlhs, const mxArray *plhs[4]);
extern void generate_polynomial_trajectory_atexit(void);
extern void generate_polynomial_trajectory_initialize(void);
extern void generate_polynomial_trajectory_terminate(void);
extern void generate_polynomial_trajectory_xil_terminate(void);

#endif

/* End of code generation (_coder_generate_polynomial_trajectory_api.h) */
