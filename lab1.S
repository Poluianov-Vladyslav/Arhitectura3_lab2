.global lab1
.syntax unified
#define A #12 //Defining constant
#define B #10
#define C #4
lab1:
	push {lr} //save link register
	mov r0, A //loading A into register
	mov r1, B
	mov r2, C
	
	and r0, r0, r1 // logical AND between A and B
	lsr r0, r0, #1 // Shift right
	
	bl factorial //Branching to factorial function
	
	add r0, r0, r4 // addind r0 and r4
	pop {pc}
	
factorial:
	push {r2, lr} // saving r2, lr, on a stack
	mov r4, #1 // r4=1
	cmp r2, #1 // Comparing r2 with 1
	ble factorial_end // if r2<=1, branch to factorial_end
fact_loop:
	mul r4, r4, r2
	sub r2, r2, #1 // Decreasing r2 by 1      
	cmp r2, #1 // Comparing r2 with 1
	bgt fact_loop // if r2>1, branch to fact_loop 
factorial_end:      
	pop {r2, lr}  
	bx lr // returning from the function       
