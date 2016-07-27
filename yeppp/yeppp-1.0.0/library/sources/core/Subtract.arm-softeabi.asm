@                       Yeppp! library implementation
@                   This file is auto-generated by Peach-Py,
@        Portable Efficient Assembly Code-generator in Higher-level Python,
@                  part of the Yeppp! library infrastructure
@ This file is part of Yeppp! library and licensed under the New BSD license.
@ See LICENSE.txt for the full text of the license.

.macro BEGIN_ARM_FUNCTION name
	.arm
	.globl \name
	.align 2
	.func \name
	.internal \name
	\name:
.endm

.macro END_ARM_FUNCTION name
	.endfunc
	.type \name, %function
	.size \name, .-\name
.endm

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V8sV8s_V8s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_null_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_null_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_null_pointer
	SUBS r3, r3, #96
	BLO L_yepCore_Subtract_V8sV8s_V8s_CortexA9.batch_process_finish
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_batch_prologue:
	VLD1.8 {d4, d5, d6, d7}, [r0]!
	VLD1.8 {d0, d1, d2, d3}, [r1]!
	VLD1.8 {d20, d21, d22, d23}, [r0]!
	VLD1.8 {d16, d17, d18, d19}, [r1]!
	VSUB.I8 q2, q2, q0
	VSUB.I8 q3, q3, q1
	VLD1.8 {d12, d13, d14, d15}, [r0]!
	VLD1.8 {d8, d9, d10, d11}, [r1]!
	VSUB.I8 q10, q10, q8
	VSUB.I8 q11, q11, q9
	VST1.8 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #96
	BLO L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_batch:
	VLD1.8 {d4, d5, d6, d7}, [r0]!
	VLD1.8 {d0, d1, d2, d3}, [r1]!
	VSUB.I8 q6, q6, q4
	VSUB.I8 q7, q7, q5
	VST1.8 {d20, d21, d22, d23}, [r2]!
	VLD1.8 {d20, d21, d22, d23}, [r0]!
	VLD1.8 {d16, d17, d18, d19}, [r1]!
	VSUB.I8 q2, q2, q0
	VSUB.I8 q3, q3, q1
	VST1.8 {d12, d13, d14, d15}, [r2]!
	VLD1.8 {d12, d13, d14, d15}, [r0]!
	VLD1.8 {d8, d9, d10, d11}, [r1]!
	VSUB.I8 q10, q10, q8
	VSUB.I8 q11, q11, q9
	VST1.8 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #96
	BHS L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_batch
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_batch_epilogue:
	VSUB.I8 q6, q6, q4
	VSUB.I8 q7, q7, q5
	VST1.8 {d20, d21, d22, d23}, [r2]!
	VST1.8 {d12, d13, d14, d15}, [r2]!
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.batch_process_finish:
	ADDS r3, r3, #96
	BEQ L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_ok
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_single:
	LDRSB r12, [r0], #1
	LDRSB r4, [r1], #1
	SUB r12, r12, r4
	STRB r12, [r2], #1
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V8sV8s_V8s_CortexA9.process_single
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V8sV8s_V8s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V8sV8s_V8s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V8sV8s_V16s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_null_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_null_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_null_pointer
	TST r2, #1
	BNE L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V8sV8s_V16s_CortexA9.batch_process_finish
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_batch_prologue:
	VLD1.8 {d20, d21}, [r0]!
	VLD1.8 {d22, d23}, [r1]!
	VLD1.8 {d18, d19}, [r0]!
	VLD1.8 {d14, d15}, [r1]!
	VSUBL.S8 q4, d20, d22
	VSUBL.S8 q5, d21, d23
	VLD1.8 {d12, d13}, [r0]!
	VLD1.8 {d16, d17}, [r1]!
	VSUBL.S8 q0, d18, d14
	VSUBL.S8 q1, d19, d15
	VST1.8 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_batch:
	VLD1.8 {d20, d21}, [r0]!
	VLD1.8 {d22, d23}, [r1]!
	VSUBL.S8 q2, d12, d16
	VSUBL.S8 q3, d13, d17
	VST1.8 {d0, d1, d2, d3}, [r2]!
	VLD1.8 {d18, d19}, [r0]!
	VLD1.8 {d14, d15}, [r1]!
	VSUBL.S8 q4, d20, d22
	VSUBL.S8 q5, d21, d23
	VST1.8 {d4, d5, d6, d7}, [r2]!
	VLD1.8 {d12, d13}, [r0]!
	VLD1.8 {d16, d17}, [r1]!
	VSUBL.S8 q0, d18, d14
	VSUBL.S8 q1, d19, d15
	VST1.8 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #48
	BHS L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_batch
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_batch_epilogue:
	VSUBL.S8 q2, d12, d16
	VSUBL.S8 q3, d13, d17
	VST1.8 {d0, d1, d2, d3}, [r2]!
	VST1.8 {d4, d5, d6, d7}, [r2]!
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.batch_process_finish:
	ADDS r3, r3, #48
	BEQ L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_ok
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_single:
	LDRSB r12, [r0], #1
	LDRSB r4, [r1], #1
	SUB r12, r12, r4
	STRH r12, [r2], #2
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V8sV8s_V16s_CortexA9.process_single
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return:
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V8sV8s_V16s_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V8sV8s_V16s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V8uV8u_V16u_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_null_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_null_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_null_pointer
	TST r2, #1
	BNE L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V8uV8u_V16u_CortexA9.batch_process_finish
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_batch_prologue:
	VLD1.8 {d20, d21}, [r0]!
	VLD1.8 {d22, d23}, [r1]!
	VLD1.8 {d18, d19}, [r0]!
	VLD1.8 {d14, d15}, [r1]!
	VSUBL.U8 q4, d20, d22
	VSUBL.U8 q5, d21, d23
	VLD1.8 {d12, d13}, [r0]!
	VLD1.8 {d16, d17}, [r1]!
	VSUBL.U8 q0, d18, d14
	VSUBL.U8 q1, d19, d15
	VST1.8 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_batch:
	VLD1.8 {d20, d21}, [r0]!
	VLD1.8 {d22, d23}, [r1]!
	VSUBL.U8 q2, d12, d16
	VSUBL.U8 q3, d13, d17
	VST1.8 {d0, d1, d2, d3}, [r2]!
	VLD1.8 {d18, d19}, [r0]!
	VLD1.8 {d14, d15}, [r1]!
	VSUBL.U8 q4, d20, d22
	VSUBL.U8 q5, d21, d23
	VST1.8 {d4, d5, d6, d7}, [r2]!
	VLD1.8 {d12, d13}, [r0]!
	VLD1.8 {d16, d17}, [r1]!
	VSUBL.U8 q0, d18, d14
	VSUBL.U8 q1, d19, d15
	VST1.8 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #48
	BHS L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_batch
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_batch_epilogue:
	VSUBL.U8 q2, d12, d16
	VSUBL.U8 q3, d13, d17
	VST1.8 {d0, d1, d2, d3}, [r2]!
	VST1.8 {d4, d5, d6, d7}, [r2]!
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.batch_process_finish:
	ADDS r3, r3, #48
	BEQ L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_ok
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_single:
	LDRB r12, [r0], #1
	LDRB r4, [r1], #1
	SUB r12, r12, r4
	STRH r12, [r2], #2
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V8uV8u_V16u_CortexA9.process_single
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return:
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V8uV8u_V16u_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V8uV8u_V16u_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V16sV16s_V16s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_null_pointer
	TST r0, #1
	BNE L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_null_pointer
	TST r1, #1
	BNE L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_null_pointer
	TST r2, #1
	BNE L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V16sV16s_V16s_CortexA9.batch_process_finish
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_batch_prologue:
	VLD1.16 {d4, d5, d6, d7}, [r0]!
	VLD1.16 {d0, d1, d2, d3}, [r1]!
	VLD1.16 {d20, d21, d22, d23}, [r0]!
	VLD1.16 {d16, d17, d18, d19}, [r1]!
	VSUB.I16 q2, q2, q0
	VSUB.I16 q3, q3, q1
	VLD1.16 {d12, d13, d14, d15}, [r0]!
	VLD1.16 {d8, d9, d10, d11}, [r1]!
	VSUB.I16 q10, q10, q8
	VSUB.I16 q11, q11, q9
	VST1.16 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #48
	BLO L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_batch:
	VLD1.16 {d4, d5, d6, d7}, [r0]!
	VLD1.16 {d0, d1, d2, d3}, [r1]!
	VSUB.I16 q6, q6, q4
	VSUB.I16 q7, q7, q5
	VST1.16 {d20, d21, d22, d23}, [r2]!
	VLD1.16 {d20, d21, d22, d23}, [r0]!
	VLD1.16 {d16, d17, d18, d19}, [r1]!
	VSUB.I16 q2, q2, q0
	VSUB.I16 q3, q3, q1
	VST1.16 {d12, d13, d14, d15}, [r2]!
	VLD1.16 {d12, d13, d14, d15}, [r0]!
	VLD1.16 {d8, d9, d10, d11}, [r1]!
	VSUB.I16 q10, q10, q8
	VSUB.I16 q11, q11, q9
	VST1.16 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #48
	BHS L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_batch
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_batch_epilogue:
	VSUB.I16 q6, q6, q4
	VSUB.I16 q7, q7, q5
	VST1.16 {d20, d21, d22, d23}, [r2]!
	VST1.16 {d12, d13, d14, d15}, [r2]!
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.batch_process_finish:
	ADDS r3, r3, #48
	BEQ L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_ok
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_single:
	LDRSH r12, [r0], #2
	LDRSH r4, [r1], #2
	SUB r12, r12, r4
	STRH r12, [r2], #2
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V16sV16s_V16s_CortexA9.process_single
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16sV16s_V16s_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V16sV16s_V16s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V16sV16s_V32s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_null_pointer
	TST r0, #1
	BNE L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_null_pointer
	TST r1, #1
	BNE L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_null_pointer
	TST r2, #3
	BNE L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V16sV16s_V32s_CortexA9.batch_process_finish
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_batch_prologue:
	VLD1.16 {d20, d21}, [r0]!
	VLD1.16 {d22, d23}, [r1]!
	VLD1.16 {d18, d19}, [r0]!
	VLD1.16 {d14, d15}, [r1]!
	VSUBL.S16 q4, d20, d22
	VSUBL.S16 q5, d21, d23
	VLD1.16 {d12, d13}, [r0]!
	VLD1.16 {d16, d17}, [r1]!
	VSUBL.S16 q0, d18, d14
	VSUBL.S16 q1, d19, d15
	VST1.16 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_batch:
	VLD1.16 {d20, d21}, [r0]!
	VLD1.16 {d22, d23}, [r1]!
	VSUBL.S16 q2, d12, d16
	VSUBL.S16 q3, d13, d17
	VST1.16 {d0, d1, d2, d3}, [r2]!
	VLD1.16 {d18, d19}, [r0]!
	VLD1.16 {d14, d15}, [r1]!
	VSUBL.S16 q4, d20, d22
	VSUBL.S16 q5, d21, d23
	VST1.16 {d4, d5, d6, d7}, [r2]!
	VLD1.16 {d12, d13}, [r0]!
	VLD1.16 {d16, d17}, [r1]!
	VSUBL.S16 q0, d18, d14
	VSUBL.S16 q1, d19, d15
	VST1.16 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #24
	BHS L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_batch
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_batch_epilogue:
	VSUBL.S16 q2, d12, d16
	VSUBL.S16 q3, d13, d17
	VST1.16 {d0, d1, d2, d3}, [r2]!
	VST1.16 {d4, d5, d6, d7}, [r2]!
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.batch_process_finish:
	ADDS r3, r3, #24
	BEQ L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_ok
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_single:
	LDRSH r12, [r0], #2
	LDRSH r4, [r1], #2
	SUB r12, r12, r4
	STR r12, [r2], #4
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V16sV16s_V32s_CortexA9.process_single
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return:
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16sV16s_V32s_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V16sV16s_V32s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V16uV16u_V32u_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_null_pointer
	TST r0, #1
	BNE L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_null_pointer
	TST r1, #1
	BNE L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_null_pointer
	TST r2, #3
	BNE L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V16uV16u_V32u_CortexA9.batch_process_finish
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_batch_prologue:
	VLD1.16 {d20, d21}, [r0]!
	VLD1.16 {d22, d23}, [r1]!
	VLD1.16 {d18, d19}, [r0]!
	VLD1.16 {d14, d15}, [r1]!
	VSUBL.U16 q4, d20, d22
	VSUBL.U16 q5, d21, d23
	VLD1.16 {d12, d13}, [r0]!
	VLD1.16 {d16, d17}, [r1]!
	VSUBL.U16 q0, d18, d14
	VSUBL.U16 q1, d19, d15
	VST1.16 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_batch:
	VLD1.16 {d20, d21}, [r0]!
	VLD1.16 {d22, d23}, [r1]!
	VSUBL.U16 q2, d12, d16
	VSUBL.U16 q3, d13, d17
	VST1.16 {d0, d1, d2, d3}, [r2]!
	VLD1.16 {d18, d19}, [r0]!
	VLD1.16 {d14, d15}, [r1]!
	VSUBL.U16 q4, d20, d22
	VSUBL.U16 q5, d21, d23
	VST1.16 {d4, d5, d6, d7}, [r2]!
	VLD1.16 {d12, d13}, [r0]!
	VLD1.16 {d16, d17}, [r1]!
	VSUBL.U16 q0, d18, d14
	VSUBL.U16 q1, d19, d15
	VST1.16 {d8, d9, d10, d11}, [r2]!
	SUBS r3, r3, #24
	BHS L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_batch
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_batch_epilogue:
	VSUBL.U16 q2, d12, d16
	VSUBL.U16 q3, d13, d17
	VST1.16 {d0, d1, d2, d3}, [r2]!
	VST1.16 {d4, d5, d6, d7}, [r2]!
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.batch_process_finish:
	ADDS r3, r3, #24
	BEQ L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_ok
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_single:
	LDRH r12, [r0], #2
	LDRH r4, [r1], #2
	SUB r12, r12, r4
	STR r12, [r2], #4
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V16uV16u_V32u_CortexA9.process_single
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return:
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V16uV16u_V32u_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V16uV16u_V32u_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V32sV32s_V32s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.ENTRY:
	PUSH {r3, r4}
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_null_pointer
	TST r0, #3
	BNE L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_null_pointer
	TST r1, #3
	BNE L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_null_pointer
	TST r2, #3
	BNE L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V32sV32s_V32s_CortexA9.batch_process_finish
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_batch_prologue:
	VLD1.32 {d4, d5, d6, d7}, [r0]!
	VLD1.32 {d0, d1, d2, d3}, [r1]!
	VLD1.32 {d20, d21, d22, d23}, [r0]!
	VLD1.32 {d16, d17, d18, d19}, [r1]!
	VSUB.I32 q2, q2, q0
	VSUB.I32 q3, q3, q1
	VLD1.32 {d12, d13, d14, d15}, [r0]!
	VLD1.32 {d8, d9, d10, d11}, [r1]!
	VSUB.I32 q10, q10, q8
	VSUB.I32 q11, q11, q9
	VST1.32 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_batch:
	VLD1.32 {d4, d5, d6, d7}, [r0]!
	VLD1.32 {d0, d1, d2, d3}, [r1]!
	VSUB.I32 q6, q6, q4
	VSUB.I32 q7, q7, q5
	VST1.32 {d20, d21, d22, d23}, [r2]!
	VLD1.32 {d20, d21, d22, d23}, [r0]!
	VLD1.32 {d16, d17, d18, d19}, [r1]!
	VSUB.I32 q2, q2, q0
	VSUB.I32 q3, q3, q1
	VST1.32 {d12, d13, d14, d15}, [r2]!
	VLD1.32 {d12, d13, d14, d15}, [r0]!
	VLD1.32 {d8, d9, d10, d11}, [r1]!
	VSUB.I32 q10, q10, q8
	VSUB.I32 q11, q11, q9
	VST1.32 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #24
	BHS L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_batch
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_batch_epilogue:
	VSUB.I32 q6, q6, q4
	VSUB.I32 q7, q7, q5
	VST1.32 {d20, d21, d22, d23}, [r2]!
	VST1.32 {d12, d13, d14, d15}, [r2]!
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.batch_process_finish:
	ADDS r3, r3, #24
	BEQ L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_ok
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_single:
	LDR r12, [r0], #4
	LDR r4, [r1], #4
	SUB r12, r12, r4
	STR r12, [r2], #4
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V32sV32s_V32s_CortexA9.process_single
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
L_yepCore_Subtract_V32sV32s_V32s_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V32sV32s_V32s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V64sV64s_V64s_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.ENTRY:
	PUSH {r3, r4, r5, r6}
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_null_pointer
	TST r0, #7
	BNE L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_null_pointer
	TST r1, #7
	BNE L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_null_pointer
	TST r2, #7
	BNE L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #12
	BLO L_yepCore_Subtract_V64sV64s_V64s_CortexA9.batch_process_finish
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_batch_prologue:
	VLD1.64 {d4, d5, d6, d7}, [r0]!
	VLD1.64 {d0, d1, d2, d3}, [r1]!
	VLD1.64 {d20, d21, d22, d23}, [r0]!
	VLD1.64 {d16, d17, d18, d19}, [r1]!
	VSUB.I64 q2, q2, q0
	VSUB.I64 q3, q3, q1
	VLD1.64 {d12, d13, d14, d15}, [r0]!
	VLD1.64 {d8, d9, d10, d11}, [r1]!
	VSUB.I64 q10, q10, q8
	VSUB.I64 q11, q11, q9
	VST1.64 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #12
	BLO L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_batch:
	VLD1.64 {d4, d5, d6, d7}, [r0]!
	VLD1.64 {d0, d1, d2, d3}, [r1]!
	VSUB.I64 q6, q6, q4
	VSUB.I64 q7, q7, q5
	VST1.64 {d20, d21, d22, d23}, [r2]!
	VLD1.64 {d20, d21, d22, d23}, [r0]!
	VLD1.64 {d16, d17, d18, d19}, [r1]!
	VSUB.I64 q2, q2, q0
	VSUB.I64 q3, q3, q1
	VST1.64 {d12, d13, d14, d15}, [r2]!
	VLD1.64 {d12, d13, d14, d15}, [r0]!
	VLD1.64 {d8, d9, d10, d11}, [r1]!
	VSUB.I64 q10, q10, q8
	VSUB.I64 q11, q11, q9
	VST1.64 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #12
	BHS L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_batch
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_batch_epilogue:
	VSUB.I64 q6, q6, q4
	VSUB.I64 q7, q7, q5
	VST1.64 {d20, d21, d22, d23}, [r2]!
	VST1.64 {d12, d13, d14, d15}, [r2]!
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.batch_process_finish:
	ADDS r3, r3, #12
	BEQ L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_ok
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_single:
	LDR r12, [r0], #4
	LDR r4, [r0], #4
	LDR r5, [r1], #4
	LDR r6, [r1], #4
	SUBS r12, r12, r5
	SBC r4, r4, r6
	STR r12, [r2], #4
	STR r4, [r2], #4
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V64sV64s_V64s_CortexA9.process_single
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4, r5, r6}
	BX lr
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4, r5, r6}
	BX lr
L_yepCore_Subtract_V64sV64s_V64s_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	POP {r3, r4, r5, r6}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V64sV64s_V64s_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V32fV32f_V32f_CortexA9
	.arch armv5t
	.fpu neon
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.ENTRY:
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_null_pointer
	TST r0, #3
	BNE L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_null_pointer
	TST r1, #3
	BNE L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_null_pointer
	TST r2, #3
	BNE L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V32fV32f_V32f_CortexA9.batch_process_finish
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_batch_prologue:
	VLD1.32 {d4, d5, d6, d7}, [r0]!
	VLD1.32 {d0, d1, d2, d3}, [r1]!
	VLD1.32 {d20, d21, d22, d23}, [r0]!
	VLD1.32 {d16, d17, d18, d19}, [r1]!
	VSUB.F32 q2, q2, q0
	VSUB.F32 q3, q3, q1
	VLD1.32 {d12, d13, d14, d15}, [r0]!
	VLD1.32 {d8, d9, d10, d11}, [r1]!
	VSUB.F32 q10, q10, q8
	VSUB.F32 q11, q11, q9
	VST1.32 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #24
	BLO L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_batch:
	VLD1.32 {d4, d5, d6, d7}, [r0]!
	VLD1.32 {d0, d1, d2, d3}, [r1]!
	VSUB.F32 q6, q6, q4
	VSUB.F32 q7, q7, q5
	VST1.32 {d20, d21, d22, d23}, [r2]!
	VLD1.32 {d20, d21, d22, d23}, [r0]!
	VLD1.32 {d16, d17, d18, d19}, [r1]!
	VSUB.F32 q2, q2, q0
	VSUB.F32 q3, q3, q1
	VST1.32 {d12, d13, d14, d15}, [r2]!
	VLD1.32 {d12, d13, d14, d15}, [r0]!
	VLD1.32 {d8, d9, d10, d11}, [r1]!
	VSUB.F32 q10, q10, q8
	VSUB.F32 q11, q11, q9
	VST1.32 {d4, d5, d6, d7}, [r2]!
	SUBS r3, r3, #24
	BHS L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_batch
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_batch_epilogue:
	VSUB.F32 q6, q6, q4
	VSUB.F32 q7, q7, q5
	VST1.32 {d20, d21, d22, d23}, [r2]!
	VST1.32 {d12, d13, d14, d15}, [r2]!
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.batch_process_finish:
	ADDS r3, r3, #24
	BEQ L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_ok
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_single:
	VLDR s0, [r0]
	ADD r0, r0, #4
	VLDR s1, [r1]
	ADD r1, r1, #4
	VSUB.F32 s0, s0, s1
	VSTR s0, [r2]
	ADD r2, r2, #4
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V32fV32f_V32f_CortexA9.process_single
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Subtract_V32fV32f_V32f_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V32fV32f_V32f_CortexA9

.section .text.CortexA9,"ax",%progbits
BEGIN_ARM_FUNCTION _yepCore_Subtract_V64fV64f_V64f_CortexA9
	.arch armv5t
	.fpu vfpv3-d16
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.ENTRY:
	VPUSH {d8, d9, d10, d11, d12, d13, d14, d15}
	TST r0, r0
	BEQ L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r0, #7
	BNE L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	TST r1, r1
	BEQ L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r1, #7
	BNE L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	TST r2, r2
	BEQ L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_null_pointer
	TST r2, #7
	BNE L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_misaligned_pointer
	SUBS r3, r3, #8
	BLO L_yepCore_Subtract_V64fV64f_V64f_CortexA9.batch_process_finish
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_batch_prologue:
	VLDM r0!, {d0, d1}
	VLDM r1!, {d4, d5}
	VLDM r0!, {d6, d7}
	VLDM r1!, {d8, d9}
	VSUB.F64 d0, d0, d4
	VLDM r0!, {d14, d15}
	VLDM r1!, {d2, d3}
	VSUB.F64 d6, d6, d8
	VSUB.F64 d1, d1, d5
	VLDM r0!, {d12, d13}
	VLDM r1!, {d10, d11}
	VSUB.F64 d14, d14, d2
	VSUB.F64 d7, d7, d9
	VSTM r2!, {d0, d1}
	SUBS r3, r3, #8
	BLO L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_batch_epilogue
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_batch:
	VLDM r0!, {d0, d1}
	VLDM r1!, {d4, d5}
	VSUB.F64 d12, d12, d10
	VSUB.F64 d15, d15, d3
	VSTM r2!, {d6, d7}
	VLDM r0!, {d6, d7}
	VLDM r1!, {d8, d9}
	VSUB.F64 d0, d0, d4
	VSUB.F64 d13, d13, d11
	VSTM r2!, {d14, d15}
	VLDM r0!, {d14, d15}
	VLDM r1!, {d2, d3}
	VSUB.F64 d6, d6, d8
	VSUB.F64 d1, d1, d5
	VSTM r2!, {d12, d13}
	VLDM r0!, {d12, d13}
	VLDM r1!, {d10, d11}
	VSUB.F64 d14, d14, d2
	VSUB.F64 d7, d7, d9
	VSTM r2!, {d0, d1}
	SUBS r3, r3, #8
	BHS L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_batch
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_batch_epilogue:
	VSUB.F64 d12, d12, d10
	VSUB.F64 d15, d15, d3
	VSTM r2!, {d6, d7}
	VSUB.F64 d13, d13, d11
	VSTM r2!, {d14, d15}
	VSTM r2!, {d12, d13}
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.batch_process_finish:
	ADDS r3, r3, #8
	BEQ L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_ok
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_single:
	VLDR d0, [r0]
	ADD r0, r0, #8
	VLDR d1, [r1]
	ADD r1, r1, #8
	VSUB.F64 d0, d0, d1
	VSTR d0, [r2]
	ADD r2, r2, #8
	SUBS r3, r3, #1
	BNE L_yepCore_Subtract_V64fV64f_V64f_CortexA9.process_single
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_ok:
	MOV r0, #0
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return:
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_null_pointer:
	MOV r0, #1
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
L_yepCore_Subtract_V64fV64f_V64f_CortexA9.return_misaligned_pointer:
	MOV r0, #2
	VPOP {d8, d9, d10, d11, d12, d13, d14, d15}
	BX lr
END_ARM_FUNCTION _yepCore_Subtract_V64fV64f_V64f_CortexA9
