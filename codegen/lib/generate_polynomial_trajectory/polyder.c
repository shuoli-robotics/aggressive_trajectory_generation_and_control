/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * polyder.c
 *
 * Code generation for function 'polyder'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "generate_polynomial_trajectory.h"
#include "polyder.h"

/* Function Definitions */
void polyder(const double u_data[], const int u_size[2], double a_data[], int
             a_size[2])
{
  int nymax;
  int nlead0;
  int k;
  double d0;
  if (u_size[1] < 2) {
    nymax = -1;
  } else {
    nymax = u_size[1] - 3;
  }

  a_size[0] = 1;
  a_size[1] = nymax + 2;
  if ((u_size[1] == 0) || (u_size[1] == 1)) {
    a_data[0] = 0.0;
  } else {
    nlead0 = -2;
    k = 0;
    while ((k <= nymax) && (u_data[k] == 0.0)) {
      nlead0++;
      k++;
    }

    nymax -= nlead0;
    a_size[0] = 1;
    a_size[1] = nymax;
    for (k = 0; k < nymax; k++) {
      a_data[k] = u_data[(k + nlead0) + 2];
    }
  }

  nymax = a_size[1];
  for (k = 0; k <= nymax - 2; k++) {
    a_data[k] *= (double)((a_size[1] - k) - 1) + 1.0;
  }

  if (u_size[1] != 0) {
    d0 = u_data[u_size[1] - 1];
    if (rtIsInf(d0) || rtIsNaN(d0)) {
      a_data[a_size[1] - 1] = rtNaN;
    }
  }
}

/* End of code generation (polyder.c) */
