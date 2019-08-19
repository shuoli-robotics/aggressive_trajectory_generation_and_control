/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_polynomial_trajectory.c
 *
 * Code generation for function 'generate_polynomial_trajectory'
 *
 */

/* Include files */
#include <math.h>
#include "rt_nonfinite.h"
#include <string.h>
#include "generate_polynomial_trajectory.h"
#include "polyder.h"

/* Function Declarations */
static double rt_powd_snf(double u0, double u1);

/* Function Definitions */
static double rt_powd_snf(double u0, double u1)
{
  double y;
  double d1;
  double d2;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = rtNaN;
  } else {
    d1 = fabs(u0);
    d2 = fabs(u1);
    if (rtIsInf(u1)) {
      if (d1 == 1.0) {
        y = 1.0;
      } else if (d1 > 1.0) {
        if (u1 > 0.0) {
          y = rtInf;
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = rtInf;
      }
    } else if (d2 == 0.0) {
      y = 1.0;
    } else if (d2 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = rtNaN;
    } else {
      y = pow(u0, u1);
    }
  }

  return y;
}

void generate_polynomial_trajectory(const double initial_constrains[3], const
  double final_contrains[3], double t0, double tf, double c_p[6], double
  c_v_data[], int c_v_size[2], double c_a_data[], int c_a_size[2], double
  c_j_data[], int c_j_size[2])
{
  double y[36];
  double x[36];
  double smax;
  double s;
  double x_tmp;
  double b_x_tmp;
  double c_x_tmp;
  double d_x_tmp;
  int i0;
  int j;
  signed char ipiv[6];
  int jA;
  int jj;
  int k;
  signed char p[6];
  int jp1j;
  int n;
  int iy;
  int ix;
  double b_initial_constrains[6];
  int i;
  memset(&y[0], 0, 36U * sizeof(double));
  x[0] = rt_powd_snf(t0, 5.0);
  smax = rt_powd_snf(t0, 4.0);
  x[6] = smax;
  s = rt_powd_snf(t0, 3.0);
  x[12] = s;
  x_tmp = t0 * t0;
  x[18] = x_tmp;
  x[24] = t0;
  x[30] = 1.0;
  x[1] = rt_powd_snf(tf, 5.0);
  b_x_tmp = rt_powd_snf(tf, 4.0);
  x[7] = b_x_tmp;
  c_x_tmp = rt_powd_snf(tf, 3.0);
  x[13] = c_x_tmp;
  d_x_tmp = tf * tf;
  x[19] = d_x_tmp;
  x[25] = tf;
  x[31] = 1.0;
  x[2] = 5.0 * smax;
  x[8] = 4.0 * s;
  x[14] = 3.0 * x_tmp;
  x[20] = 2.0 * t0;
  x[26] = 1.0;
  x[32] = 0.0;
  x[3] = 5.0 * b_x_tmp;
  x[9] = 4.0 * c_x_tmp;
  x[15] = 3.0 * d_x_tmp;
  x[21] = 2.0 * tf;
  x[27] = 1.0;
  x[33] = 0.0;
  x[4] = 20.0 * s;
  x[10] = 12.0 * x_tmp;
  x[16] = 6.0 * t0;
  x[22] = 2.0;
  x[28] = 0.0;
  x[34] = 0.0;
  x[5] = 20.0 * c_x_tmp;
  x[11] = 12.0 * d_x_tmp;
  x[17] = 6.0 * tf;
  x[23] = 2.0;
  x[29] = 0.0;
  x[35] = 0.0;
  for (i0 = 0; i0 < 6; i0++) {
    ipiv[i0] = (signed char)(1 + i0);
  }

  for (j = 0; j < 5; j++) {
    jA = j * 7;
    jj = j * 7;
    jp1j = jA + 2;
    n = 6 - j;
    iy = 0;
    ix = jA;
    smax = fabs(x[jA]);
    for (k = 2; k <= n; k++) {
      ix++;
      s = fabs(x[ix]);
      if (s > smax) {
        iy = k - 1;
        smax = s;
      }
    }

    if (x[jj + iy] != 0.0) {
      if (iy != 0) {
        iy += j;
        ipiv[j] = (signed char)(iy + 1);
        ix = j;
        for (k = 0; k < 6; k++) {
          smax = x[ix];
          x[ix] = x[iy];
          x[iy] = smax;
          ix += 6;
          iy += 6;
        }
      }

      i0 = (jj - j) + 6;
      for (i = jp1j; i <= i0; i++) {
        x[i - 1] /= x[jj];
      }
    }

    n = 4 - j;
    iy = jA + 6;
    jA = jj;
    for (jp1j = 0; jp1j <= n; jp1j++) {
      smax = x[iy];
      if (x[iy] != 0.0) {
        ix = jj;
        i0 = jA + 8;
        i = (jA - j) + 12;
        for (k = i0; k <= i; k++) {
          x[k - 1] += x[ix + 1] * -smax;
          ix++;
        }
      }

      iy += 6;
      jA += 6;
    }
  }

  for (i0 = 0; i0 < 6; i0++) {
    p[i0] = (signed char)(1 + i0);
  }

  for (k = 0; k < 5; k++) {
    if (ipiv[k] > 1 + k) {
      jA = ipiv[k] - 1;
      iy = p[jA];
      p[jA] = p[k];
      p[k] = (signed char)iy;
    }
  }

  for (k = 0; k < 6; k++) {
    iy = p[k] - 1;
    y[k + 6 * iy] = 1.0;
    for (j = k + 1; j < 7; j++) {
      if (y[(j + 6 * iy) - 1] != 0.0) {
        i0 = j + 1;
        for (i = i0; i < 7; i++) {
          jp1j = (i + 6 * iy) - 1;
          y[jp1j] -= y[(j + 6 * iy) - 1] * x[(i + 6 * (j - 1)) - 1];
        }
      }
    }
  }

  for (j = 0; j < 6; j++) {
    jA = 6 * j;
    for (k = 5; k >= 0; k--) {
      iy = 6 * k;
      i0 = k + jA;
      if (y[i0] != 0.0) {
        y[i0] /= x[k + iy];
        for (i = 0; i < k; i++) {
          jp1j = i + jA;
          y[jp1j] -= y[i0] * x[i + iy];
        }
      }
    }
  }

  b_initial_constrains[0] = initial_constrains[0];
  b_initial_constrains[1] = final_contrains[0];
  b_initial_constrains[2] = initial_constrains[1];
  b_initial_constrains[3] = final_contrains[1];
  b_initial_constrains[4] = initial_constrains[2];
  b_initial_constrains[5] = final_contrains[2];
  for (i0 = 0; i0 < 6; i0++) {
    c_p[i0] = 0.0;
    smax = 0.0;
    for (i = 0; i < 6; i++) {
      smax += y[i0 + 6 * i] * b_initial_constrains[i];
    }

    c_p[i0] = smax;
  }

  /* c_v = [5*c_p(1)   4*c_p(2)   3*c_p(3)  2*c_p(4)  c_p(5)];  */
  iy = 0;
  k = 0;
  while ((k < 4) && (c_p[k] == 0.0)) {
    iy++;
    k++;
  }

  jA = 4 - iy;
  c_v_size[0] = 1;
  c_v_size[1] = 5 - iy;
  for (k = 0; k <= jA; k++) {
    c_v_data[k] = c_p[k + iy];
  }

  i0 = 5 - iy;
  for (k = 0; k <= i0 - 2; k++) {
    c_v_data[k] *= (double)(4 - (iy + k)) + 1.0;
  }

  if (rtIsInf(c_p[5]) || rtIsNaN(c_p[5])) {
    c_v_data[4 - iy] = rtNaN;
  }

  /* c_a = [20*c_p(1) 12*c_p(2)  6*c_p(3)  2*c_p(4)];  */
  polyder(c_v_data, c_v_size, c_a_data, c_a_size);
  polyder(c_a_data, c_a_size, c_j_data, c_j_size);
}

/* End of code generation (generate_polynomial_trajectory.c) */
