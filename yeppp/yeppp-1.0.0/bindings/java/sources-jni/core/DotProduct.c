/*
 *                       Yeppp! library implementation
 *                   This file is auto-generated by Peach-Py,
 *        Portable Efficient Assembly Code-generator in Higher-level Python,
 *                  part of the Yeppp! library infrastructure
 * This file is part of Yeppp! library and licensed under the New BSD license.
 * See LICENSE.txt for the full text of the license.
 */

#include <jni.h>
#include <yepPrivate.h>
#include <yepCore.h>
#include <yepJavaPrivate.h>


JNIEXPORT jfloat JNICALL Java_info_yeppp_Core_DotProduct_1V32fV32f_1S32f(JNIEnv *env, jclass class, jfloatArray xArray, jint xOffset, jfloatArray yArray, jint yOffset, jint length) {
	enum YepStatus status;
	Yep32f* xPointer = NULL;
	Yep32f* yPointer = NULL;
	Yep32f dotProduct;

	if YEP_UNLIKELY(xArray == NULL) {
		(*env)->ThrowNew(env, NullPointerException, "Argument xArray is null");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(xOffset < 0) {
		(*env)->ThrowNew(env, IllegalArgumentException, "Argument xOffset is negative");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(((YepSize)xOffset) + ((YepSize)length) > (YepSize)((*env)->GetArrayLength(env, xArray))) {
		(*env)->ThrowNew(env, IndexOutOfBoundsException, "xOffset + length exceed the length of xArray");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(yArray == NULL) {
		(*env)->ThrowNew(env, NullPointerException, "Argument yArray is null");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(yOffset < 0) {
		(*env)->ThrowNew(env, IllegalArgumentException, "Argument yOffset is negative");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(((YepSize)yOffset) + ((YepSize)length) > (YepSize)((*env)->GetArrayLength(env, yArray))) {
		(*env)->ThrowNew(env, IndexOutOfBoundsException, "yOffset + length exceed the length of yArray");
		return (jfloat)0;
	}
	if YEP_UNLIKELY(length < 0) {
		(*env)->ThrowNew(env, NegativeArraySizeException, "Argument length is negative");
		return (jfloat)0;
	}

	xPointer = (*env)->GetPrimitiveArrayCritical(env, xArray, NULL);
	yPointer = (*env)->GetPrimitiveArrayCritical(env, yArray, NULL);

	status = yepCore_DotProduct_V32fV32f_S32f(&xPointer[xOffset], &yPointer[yOffset], &dotProduct, length);

	(*env)->ReleasePrimitiveArrayCritical(env, yArray, yPointer, JNI_ABORT);
	(*env)->ReleasePrimitiveArrayCritical(env, xArray, xPointer, JNI_ABORT);
	if YEP_UNLIKELY(status != YepStatusOk) {
		yepJNI_ThrowSuitableException(env, status);
	}


	return dotProduct;
}

JNIEXPORT jdouble JNICALL Java_info_yeppp_Core_DotProduct_1V64fV64f_1S64f(JNIEnv *env, jclass class, jdoubleArray xArray, jint xOffset, jdoubleArray yArray, jint yOffset, jint length) {
	enum YepStatus status;
	Yep64f* xPointer = NULL;
	Yep64f* yPointer = NULL;
	Yep64f dotProduct;

	if YEP_UNLIKELY(xArray == NULL) {
		(*env)->ThrowNew(env, NullPointerException, "Argument xArray is null");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(xOffset < 0) {
		(*env)->ThrowNew(env, IllegalArgumentException, "Argument xOffset is negative");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(((YepSize)xOffset) + ((YepSize)length) > (YepSize)((*env)->GetArrayLength(env, xArray))) {
		(*env)->ThrowNew(env, IndexOutOfBoundsException, "xOffset + length exceed the length of xArray");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(yArray == NULL) {
		(*env)->ThrowNew(env, NullPointerException, "Argument yArray is null");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(yOffset < 0) {
		(*env)->ThrowNew(env, IllegalArgumentException, "Argument yOffset is negative");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(((YepSize)yOffset) + ((YepSize)length) > (YepSize)((*env)->GetArrayLength(env, yArray))) {
		(*env)->ThrowNew(env, IndexOutOfBoundsException, "yOffset + length exceed the length of yArray");
		return (jdouble)0;
	}
	if YEP_UNLIKELY(length < 0) {
		(*env)->ThrowNew(env, NegativeArraySizeException, "Argument length is negative");
		return (jdouble)0;
	}

	xPointer = (*env)->GetPrimitiveArrayCritical(env, xArray, NULL);
	yPointer = (*env)->GetPrimitiveArrayCritical(env, yArray, NULL);

	status = yepCore_DotProduct_V64fV64f_S64f(&xPointer[xOffset], &yPointer[yOffset], &dotProduct, length);

	(*env)->ReleasePrimitiveArrayCritical(env, yArray, yPointer, JNI_ABORT);
	(*env)->ReleasePrimitiveArrayCritical(env, xArray, xPointer, JNI_ABORT);
	if YEP_UNLIKELY(status != YepStatusOk) {
		yepJNI_ThrowSuitableException(env, status);
	}


	return dotProduct;
}
