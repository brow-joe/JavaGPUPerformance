#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>
#include <yepMath.h>
#include <yepLibrary.h>
#include <yepRandom.h>

/* Size of the array of elements to compute the polynomial on */
#define ARRAY_SIZE (1024*1024*8)

/* Polynomial Coefficients 101 */
#define c0   1.53270461724076346
#define c1   1.45339856462100293
#define c2   1.21078763026010761
#define c3   1.46952786401453397
#define c4   1.34249847863665017
#define c5   0.75093174077762164
#define c6   1.90239336671587562
#define c7   1.62162053962810579
#define c8   0.53312230473555923
#define c9   1.76588453111778762
#define c10  1.31215699612484679
#define c11  1.49636144227257237
#define c12  1.52170011054112963
#define c13  0.83637497322280110
#define c14  1.12764540941736043
#define c15  0.65513628703807597
#define c16  1.15879020877781906
#define c17  1.98262901973751791
#define c18  1.09134643523639479
#define c19  1.92898634047221235
#define c20  1.01233347751449659
#define c21  1.89462732589369078
#define c22  1.28216239080886344
#define c23  1.78448898277094016
#define c24  1.22382217182612910
#define c25  1.23434674193555734
#define c26  1.13914782832335501
#define c27  0.73506235075797319
#define c28  0.55461432517332724
#define c29  1.51704871121967963
#define c30  1.22430234239661516
#define c31  1.55001237689160722
#define c32  0.84197209952298114
#define c33  1.59396169927319749
#define c34  0.97067044414760438
#define c35  0.99001960195021281
#define c36  1.17887814292622884
#define c37  0.58955609453835851
#define c38  0.58145654861350322
#define c39  1.32447212043555583
#define c40  1.24673632882394241
#define c41  1.24571828921765111
#define c42  1.21901343493503215
#define c43  1.89453941213996638
#define c44  1.85561626872427416
#define c45  1.13302165522004133
#define c46  1.79145993815510725
#define c47  1.59227069037095317
#define c48  1.89104468672467114
#define c49  1.78733894997070918
#define c50  1.32648559107345081
#define c51  1.68531055586072865
#define c52  1.08980909640581993
#define c53  1.34308207822154847
#define c54  1.81689492849547059
#define c55  1.38582137073988747
#define c56  1.04974901183570510
#define c57  1.14348742300966456
#define c58  1.87597730040483323
#define c59  0.62131555899466420
#define c60  0.64710935668225787
#define c61  1.49846610600978751
#define c62  1.07834176789680957
#define c63  1.69130785175832059
#define c64  1.64547687732258793
#define c65  1.02441150427208083
#define c66  1.86129006037146541
#define c67  0.98309038830424073
#define c68  1.75444578237500969
#define c69  1.08698336765112349
#define c70  1.89455010772036759
#define c71  0.65812118412299539
#define c72  0.62102711487851459
#define c73  1.69991208083436747
#define c74  1.65467704495635767
#define c75  1.69599459626992174
#define c76  0.82365682103308750
#define c77  1.71353437063595036
#define c78  0.54992984722831769
#define c79  0.54717367088443119
#define c80  0.79915543248858154
#define c81  1.70160318364006257
#define c82  1.34441280175456970
#define c83  0.79789486341474966
#define c84  0.61517383020710754
#define c85  0.55177400048576055
#define c86  1.43229889543908696
#define c87  1.60658663666266949
#define c88  1.78861146369896090
#define c89  1.05843250742401821
#define c90  1.58481799048208832
#define c91  1.70954313374718085
#define c92  0.52590070195022226
#define c93  0.92705074709607885
#define c94  0.71442651832362455
#define c95  1.14752795948077643
#define c96  0.89860175106926404
#define c97  0.76771198245570573
#define c98  0.67059202034800746
#define c99  0.53785922275590729
#define c100 0.82098327929734880

/* The same coefficients as an array. This array is used for a Yeppp! function call. */
static const Yep64f coefs[101] = {
	 c0,  c1,  c2,  c3,  c4,  c5,  c6,  c7,  c8,  c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19,
	c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39,
	c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58, c59,
	c60, c61, c62, c63, c64, c65, c66, c67, c68, c69, c70, c71, c72, c73, c74, c75, c76, c77, c78, c79,
	c80, c81, c82, c83, c84, c85, c86, c87, c88, c89, c90, c91, c92, c93, c94, c95, c96, c97, c98, c99,
	c100
};

/* C implementation with hard-coded coefficients. The compilers should be good at optimizing it. */
void evaluate_polynomial_naive(const Yep64f *YEP_RESTRICT xArray, Yep64f *YEP_RESTRICT yArray, YepSize length) {
	YepSize index;
	Yep64f x, y;
	for (index = 0; index < length; index++) {
		x = xArray[index];
		y = c0 + x * (c1 + x * (c2 + x * (c3 + x * (c4 + x * (c5 + x * (c6 + x * (c7 + x * (c8 + x * (c9 + x * (c10 + x * (c11 + 
			x * (c12 + x * (c13 + x * (c14 + x * (c15 + x * (c16 + x * (c17 + x * (c18 + x * (c19 + x * (c20 + x * (c21 + 
			x * (c22 + x * (c23 + x * (c24 + x * (c25 + x * (c26 + x * (c27 + x * (c28 + x * (c29 + x * (c30 + x * (c31 +
			x * (c32 + x * (c33 + x * (c34 + x * (c35 + x * (c36 + x * (c37 + x * (c38 + x * (c39 + x * (c40 + x * (c41 +
			x * (c42 + x * (c43 + x * (c44 + x * (c45 + x * (c46 + x * (c47 + x * (c48 + x * (c49 + x * (c50 + x * (c51 +
			x * (c52 + x * (c53 + x * (c54 + x * (c55 + x * (c56 + x * (c57 + x * (c58 + x * (c59 + x * (c60 + x * (c61 +
			x * (c62 + x * (c63 + x * (c64 + x * (c65 + x * (c66 + x * (c67 + x * (c68 + x * (c69 + x * (c70 + x * (c71 +
			x * (c72 + x * (c73 + x * (c74 + x * (c75 + x * (c76 + x * (c77 + x * (c78 + x * (c79 + x * (c80 + x * (c81 +
			x * (c82 + x * (c83 + x * (c84 + x * (c85 + x * (c86 + x * (c87 + x * (c88 + x * (c89 + x * (c90 + x * (c91 +
			x * (c92 + x * (c93 + x * (c94 + x * (c95 + x * (c96 + x * (c97 + x * (c98 + x * (c99 + x * c100)
			))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
		yArray[index] = y;
	}
}

/* This function computes the maximum relative error between two vectors. */
Yep64f compute_max_error(const Yep64f *YEP_RESTRICT xArray, const Yep64f *YEP_RESTRICT yArray, YepSize length) {
	Yep64f error, maxError = 0.0;
	YepSize index;
	for (index = 0; index < length; index++) {
		if (xArray[index] == 0.0)
			continue;
		error = fabs(xArray[index] - yArray[index]) / fabs(xArray[index]);
		if (error > maxError)
			maxError = error;
	}
	return maxError;
}

int main(int argc, char **argv) {
	enum YepStatus status;
	Yep64u startTimeNaive, startTimeYeppp, endTimeNaive, endTimeYeppp, frequency;
	Yep64f secsNaive, secsYeppp, flopsNaive, flopsYeppp;
	struct YepRandom_WELL1024a rng;

	/* Allocate arrays of inputs and outputs */
	Yep64f *x = (Yep64f*)calloc(ARRAY_SIZE, sizeof(Yep64f));
	Yep64f *pYeppp = (Yep64f*)calloc(ARRAY_SIZE, sizeof(Yep64f));
	Yep64f *pNaive = (Yep64f*)calloc(ARRAY_SIZE, sizeof(Yep64f));
	assert(x != NULL);
	assert(pYeppp != NULL);
	assert(pNaive != NULL);

	/* Initialize the Yeppp! library */
	status = yepLibrary_Init();
	assert(status == YepStatusOk);

	/* Initialize the random number generator */
	status = yepRandom_WELL1024a_Init(&rng);
	assert(status == YepStatusOk);

	/* Populate the array of inputs with random data */
	status = yepRandom_WELL1024a_GenerateUniform_S64fS64f_V64f_Acc64(&rng, 0.0, 100.0, x, ARRAY_SIZE);
	assert(status == YepStatusOk);

	/* Zero-initialize the output arrays */
	memset(pYeppp, 0, ARRAY_SIZE * sizeof(Yep64f));
	memset(pNaive, 0, ARRAY_SIZE * sizeof(Yep64f));

	/* Retrieve the number of timer ticks per second */
	status = yepLibrary_GetTimerFrequency(&frequency);
	assert(status == YepStatusOk);

	/* Retrieve the number of timer ticks before calling the C version of polynomial evaluation */
	status = yepLibrary_GetTimerTicks(&startTimeNaive);
	assert(status == YepStatusOk);

	/* Evaluate polynomial using C implementation */
	evaluate_polynomial_naive(x, pNaive, ARRAY_SIZE);

	/* Retrieve the number of timer ticks after calling the C version of polynomial evaluation */
	status = yepLibrary_GetTimerTicks(&endTimeNaive);
	assert(status == YepStatusOk);

	/* Retrieve the number of timer ticks before calling Yeppp! polynomial evaluation */
	status = yepLibrary_GetTimerTicks(&startTimeYeppp);
	assert(status == YepStatusOk);

	/* Evaluate polynomial using Yeppp! */
	status = yepMath_EvaluatePolynomial_V64fV64f_V64f(coefs, x, pYeppp, YEP_COUNT_OF(coefs), ARRAY_SIZE);
	assert(status == YepStatusOk);

	/* Retrieve the number of timer ticks after calling Yeppp! polynomial evaluation */
	status = yepLibrary_GetTimerTicks(&endTimeYeppp);
	assert(status == YepStatusOk);

	/* Compute time in seconds and performance in FLOPS */
	secsNaive = ((Yep64f)(endTimeNaive - startTimeNaive)) / ((Yep64f)(frequency));
	secsYeppp = ((Yep64f)(endTimeYeppp - startTimeYeppp)) / ((Yep64f)(frequency));
	flopsNaive = (Yep64f)(ARRAY_SIZE * (YEP_COUNT_OF(coefs) - 1) * 2) / secsNaive;
	flopsYeppp = (Yep64f)(ARRAY_SIZE * (YEP_COUNT_OF(coefs) - 1) * 2) / secsYeppp;

	/* Report the timing and performance results */
	printf("Naive implementation:\n");
	printf("\tTime = %lf secs\n", secsNaive);
	printf("\tPerformance = %lf GFLOPS\n", flopsNaive * 1.0e-9);
	printf("Yeppp! implementation:\n");
	printf("\tTime = %lf secs\n", secsYeppp);
	printf("\tPerformance = %lf GFLOPS\n", flopsYeppp * 1.0e-9);

	/* Make sure the result is correct. */
	printf("Max error: %7.3lf%%\n", compute_max_error(pNaive, pYeppp, ARRAY_SIZE) * 100.0);

	/* Deinitialize the Yeppp! library */
	status = yepLibrary_Release();
	assert(status == YepStatusOk);

	/* Release the memory allocated for arrays */
	free(pYeppp);
	free(pNaive);
	free(x);

	return 0;
}
