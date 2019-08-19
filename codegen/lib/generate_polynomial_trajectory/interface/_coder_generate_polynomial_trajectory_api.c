/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_generate_polynomial_trajectory_api.c
 *
 * Code generation for function '_coder_generate_polynomial_trajectory_api'
 *
 */

/* Include files */
#include "tmwtypes.h"
#include "_coder_generate_polynomial_trajectory_api.h"
#include "_coder_generate_polynomial_trajectory_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;
emlrtContext emlrtContextGlobal = { true,/* bFirstTime */
  false,                               /* bInitialized */
  131467U,                             /* fVersionInfo */
  NULL,                                /* fErrorFunction */
  "generate_polynomial_trajectory",    /* fFunctionName */
  NULL,                                /* fRTCallStack */
  false,                               /* bDebugMode */
  { 2045744189U, 2170104910U, 2743257031U, 4284093946U },/* fSigWrd */
  NULL                                 /* fSigMem */
};

/* Function Declarations */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[3];
static const mxArray *b_emlrt_marshallOut(const real_T u_data[], const int32_T
  u_size[2]);
static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *t0, const
  char_T *identifier);
static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[3];
static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *initial_constrains, const char_T *identifier))[3];
static const mxArray *emlrt_marshallOut(const real_T u[6]);
static real_T f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId);

/* Function Definitions */
static real_T (*b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[3]
{
  real_T (*y)[3];
  y = e_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
  static const mxArray *b_emlrt_marshallOut(const real_T u_data[], const int32_T
  u_size[2])
{
  const mxArray *y;
  const mxArray *m1;
  static const int32_T iv2[2] = { 0, 0 };

  y = NULL;
  m1 = emlrtCreateNumericArray(2, iv2, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m1, (void *)&u_data[0]);
  emlrtSetDimensions((mxArray *)m1, u_size, 2);
  emlrtAssign(&y, m1);
  return y;
}

static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *t0, const
  char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(t0), &thisId);
  emlrtDestroyArray(&t0);
  return y;
}

static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = f_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[3]
{
  real_T (*ret)[3];
  static const int32_T dims[2] = { 1, 3 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[3])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static real_T (*emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *initial_constrains, const char_T *identifier))[3]
{
  real_T (*y)[3];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(initial_constrains), &thisId);
  emlrtDestroyArray(&initial_constrains);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[6])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv0[1] = { 0 };

  static const int32_T iv1[1] = { 6 };

  y = NULL;
  m0 = emlrtCreateNumericArray(1, iv0, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m0, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m0, iv1, 1);
  emlrtAssign(&y, m0);
  return y;
}

static real_T f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 0U, &dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void generate_polynomial_trajectory_api(const mxArray * const prhs[4], int32_T
  nlhs, const mxArray *plhs[4])
{
  real_T (*c_p)[6];
  real_T (*c_v_data)[5];
  real_T (*c_a_data)[4];
  real_T (*c_j_data)[4];
  real_T (*initial_constrains)[3];
  real_T (*final_contrains)[3];
  real_T t0;
  real_T tf;
  int32_T c_v_size[2];
  int32_T c_a_size[2];
  int32_T c_j_size[2];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  c_p = (real_T (*)[6])mxMalloc(sizeof(real_T [6]));
  c_v_data = (real_T (*)[5])mxMalloc(sizeof(real_T [5]));
  c_a_data = (real_T (*)[4])mxMalloc(sizeof(real_T [4]));
  c_j_data = (real_T (*)[4])mxMalloc(sizeof(real_T [4]));

  /* Marshall function inputs */
  initial_constrains = emlrt_marshallIn(&st, emlrtAlias(prhs[0]),
    "initial_constrains");
  final_contrains = emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "final_contrains");
  t0 = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "t0");
  tf = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "tf");

  /* Invoke the target function */
  generate_polynomial_trajectory(*initial_constrains, *final_contrains, t0, tf, *
    c_p, *c_v_data, c_v_size, *c_a_data, c_a_size, *c_j_data, c_j_size);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*c_p);
  if (nlhs > 1) {
    plhs[1] = b_emlrt_marshallOut(*c_v_data, c_v_size);
  }

  if (nlhs > 2) {
    plhs[2] = b_emlrt_marshallOut(*c_a_data, c_a_size);
  }

  if (nlhs > 3) {
    plhs[3] = b_emlrt_marshallOut(*c_j_data, c_j_size);
  }
}

void generate_polynomial_trajectory_atexit(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  generate_polynomial_trajectory_xil_terminate();
}

void generate_polynomial_trajectory_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

void generate_polynomial_trajectory_terminate(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (_coder_generate_polynomial_trajectory_api.c) */
