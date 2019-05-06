.global main
.extern printf

.text

square:
    push {ip, lr}

    // mov number to r7 and r8
    // Use r0 for the product
    mov r8, r0
    mov r7, r0
    mov r0, #0

  while:
    // Test r8 > 0
    cmp r8, #0

    // Branch on opposite quality
    // if r8 <= 0, jump around loop body
    ble end

    // Loop body
    add r0, r0, r7  // prod += r7
    sub r8, r8, #1  // r8--

    b while // unconditional branch back to top

  end:
    // Return -- product is in r0
    pop {ip, pc}

stones:
    push {ip, lr}

  if:
    cmp r0, #1 // If level equals 1 theres only one stone
    beq else

    mov r3, r0

    sub r0, r0, #1

    push {r3} // Store current level
    bl stones 
    pop {r3} // Pop level to square

    mov r5, r0 // Store value of stones(n - 1)

    mov r0, r3
    bl square

    add r0, r5, r0 // Add square in r0 to value of stone(n - 1) in r5

    b end_main

  else: // Base Case
    mov r0, #1

  end_main:

    pop {ip, pc}

main:
    push {ip, lr}

    mov r0, #10

    bl stones

    push {r0, r3}
    mov r1, r0
    ldr r0, =format
    bl printf
    pop {r0, r3}

    pop {ip, pc}

