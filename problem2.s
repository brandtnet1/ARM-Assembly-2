.global main
.extern printf

.data
string: .asciz "*"
newline: .asciz "\n"

.text
print:
    push {ip, lr}

  while: // While greater than 0
    cmp r0, #1
    blt endwhile

    push {r0, r3} // print one star
    ldr r0, =string
    bl printf
    pop {r0, r3}

    sub r0, r0, #1 // subtract one from r0

    b while

  endwhile:
    push {r0, r3} // All stars are printed for this row, print a new line char
    ldr r0, =newline
    bl printf
    pop {r0, r3}

    pop {ip, pc}
    
main:
    push {ip, lr}

    mov r0, #1 // Start
    mov r1, #5 // Stop

  while_main:
    cmp r0, r1 // While start is less than or equal to stop
    bgt endwhile_main

    push {r0, r1} // call print function
    bl print
    pop {r0, r1}

    add r0, r0, #1 // add one to start

    b while_main

  endwhile_main:
    pop {ip, pc}