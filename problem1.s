.global main
.extern printf

.data
fizz: "Fizz"
buzz: "Buzz"
string: .asciz "%d"
newline: .asciz "\n"

.text
mod:
    push {ip, lr}
    
  while:
    cmp r0, r1
    blt endwhile
    sub r0, r0, r1
    b while
    
  endwhile:
    pop {ip, pc}

main:
    push {ip, lr}
    
    mov r3, #1   // Start
    mov r4, #100 // Finish
    mov r5, #3   // Fizz
    mov r6, #5   // Buzz
    
  while_main:
    cmp r3, r4
    bgt endwhile_main
    
  if:  // Test Fizz
    mov r0, r3
    mov r1, r5
    
    bl mod
    
    cmp r0, #0
    mov r7, r0 // Store Fizz for later
    
    bne elif
    
    push {r0, r3}
    ldr r0, =fizz // Print Fizz
    bl printf
    pop {r0, r3}
    
  elif: // Test Buzz
    mov r0, r3
    mov r1, r6
    
    bl mod
    
    cmp r0, #0
    
    bne else
    
    push {r0, r3}
    ldr r0, =buzz // Print Buzz
    bl printf
    pop {r0, r3}
    
    b end
    
  else: // Neither fizz nor buzz
    cmp r7, #0 // If Fizz skip to end
    beq end
    
    push {r0, r3}
    ldr r0, =string // Print number
    mov r1, r3
    bl printf
    pop {r0, r3}
  
  end:
    push {r0, r3}
    ldr r0, =newline // Print newline char
    bl printf
    pop {r0, r3}
  
    add r3, r3, #1

    b while_main // repeat
    
  endwhile_main:
    pop {ip, pc}