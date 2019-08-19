/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * main.c
 *
 * Code generation for function 'main'
 *
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include files */
#include "rt_nonfinite.h"
#include "generate_polynomial_trajectory.h"
#include "main.h"
#include "generate_polynomial_trajectory_terminate.h"
#include "generate_polynomial_trajectory_initialize.h"

/* Function Declarations */
static void argInit_1x3_real_T(double result[3]);
static double argInit_real_T(void);
static void main_generate_polynomial_trajectory(void);

/* Function Definitions */
static void argInit_1x3_real_T(double result[3])
{
  double result_tmp;

  /* Loop over the array to initialize each element. */
  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result_tmp = argInit_real_T();
  result[0] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[1] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[2] = argInit_real_T();
}

static double argInit_real_T(void)
{
  return 0.0;
}

static void main_generate_polynomial_trajectory(void)
{
  double initial_constrains_tmp[3];
  double c_p[6];
  double c_v_data[5];
  int c_v_size[2];
  double c_a_data[4];
  int c_a_size[2];
  double c_j_data[4];
  int c_j_size[2];

  /* Initialize function 'generate_polynomial_trajectory' input arguments. */
  /* Initialize function input argument 'initial_constrains'. */
  argInit_1x3_real_T(initial_constrains_tmp);

  /* Initialize function input argument 'final_contrains'. */
  /* Call the entry-point 'generate_polynomial_trajectory'. */
  generate_polynomial_trajectory(initial_constrains_tmp, initial_constrains_tmp,
    argInit_real_T(), argInit_real_T(), c_p, c_v_data, c_v_size, c_a_data,
    c_a_size, c_j_data, c_j_size);
}

int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* Initialize the application.
     You do not need to do this more than one time. */
  generate_polynomial_trajectory_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_generate_polynomial_trajectory();

  /* Terminate the application.
     You do not need to do this more than one time. */
  generate_polynomial_trajectory_terminate();
  return 0;
}

/* End of code generation (main.c) */
