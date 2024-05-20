mult:
addi sp,sp,-16
sw x8,0(sp)
sw x9,4(sp)
sw x18,8(sp)
sw x19,12(sp)
addi x8,x10,0
addi x9,x11,0
addi x18,x0,0
addi x19,x0,0
for0:
bge x19,x9,endfor0
add x18,x18,x8
addi x19,x19,1
beq x0,x0,for0
endfor0:
addi x10,x18,0
lw x8,0(sp)
lw x9,4(sp)
lw x18,8(sp)
lw x19,12(sp)
addi sp,sp,16
jr ra
pot:
addi sp,sp,-20
sw x8,0(sp)
sw x9,4(sp)
sw x18,8(sp)
sw x19,12(sp)
sw ra,16(sp)
addi x8,x10,0
addi x9,x11,0
addi x18,x0,1
addi x19,x0,0
for1:
bge x19,x9,endfor1
addi x10,x18,0
addi x11,x8,0
jal mult
addi x18,x10,0
addi x19,x19,1
beq x0,x0,for1
endfor1:
addi x10,x18,0
lw x8,0(sp)
lw x9,4(sp)
lw x18,8(sp)
lw x19,12(sp)
lw ra,16(sp)
addi sp,sp,20
jr ra
pol:
addi sp,sp,-24
sw x8,0(sp)
sw x9,4(sp)
sw x18,8(sp)
sw x19,12(sp)
sw x20,16(sp)
sw ra,20(sp)
addi x8,x10,0
addi x9,x11,0
addi x18,x12,0
addi x18,x18,1
addi x19,x0,0
addi x20,x0,0
for2:
bge x20,x18,endfor2
addi x10,x8,0
addi x11,x20,0
jal pot
addi x5,x10,0
lw x6,0(x9)
addi x10,x6,0
addi x11,x5,0
jal mult
addi x19,x10,0
lw x5,4(x9)
addi x9,x5,0
addi x20,x20,1
beq x0,x0,for2
endfor2:
addi x10,x19,0
lw x8,0(sp)
lw x9,4(sp)
lw x18,8(sp)
lw x19,12(sp)
lw x20,16(sp)
lw ra,20(sp)
addi sp,sp,24
jr ra

