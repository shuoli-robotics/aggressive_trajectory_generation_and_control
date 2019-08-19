/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_generate_polynomial_trajectory_mex.c
 *
 * Code generation for function '_coder_generate_polynomial_trajectory_mex'
 *
 */

/* Include files */
#include "_coder_generate_polynomial_trajectory_api.h"
#include "_coder_generate_polynomial_trajectory_mex.h"

/* Function Declarations */
static void c_generate_polynomial_trajector(int32_T nlhs, mxArray *plhs[4],
  int32_T nrhs, const mxArray *prhs[4]);

/* Function Definitions */
static void c_generate_polynomial_trajector(int32_T nlhs, mxArray *plhs[4],
  int32_T nrhs, const mxArray *prhs[4])
{
  const mxArray *outputs[4];
  int32_T b_nlhs;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        30, "generate_polynomial_trajectory");
  }

  if (nlhs > 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 30,
                        "generate_polynomial_trajectory");
  }

  /* Call the function. */
  generate_polynomial_trajectory_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(generate_polynomial_trajectory_atexit);

  /* Module initialization. */
  generate_polynomial_trajectory_initialize();

  /* Dispatch the entry-point. */
  c_generate_polynomial_trajector(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  generate_polynomial_trajectory_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_generate_polynomial_trajectory_mex.c) */
