/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * polyder.h
 *
 * Code generation for function 'polyder'
 *
 */

#ifndef POLYDER_H
#define POLYDER_H

/* Include files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "generate_polynomial_trajectory_types.h"

/* Function Declarations */
extern void polyder(const double u_data[], const int u_size[2], double a_data[],
                    int a_size[2]);

#endif

/* End of code generation (polyder.h) */
