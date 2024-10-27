.data 
Array: .space 40 
.text 
# 初始化数列 
addi $2, $0, 5 
addi $3, $0, 4 
addi $4, $0, 3 
addi $5, $0, 2 
addi $6, $0, 1 
# 将寄存器中的数值放入内存中以排序 
addi $t0, $0, 0 
sw $2, Array($t0) 
addi $t0, $t0, 4 
sw $3, Array($t0) 
addi $t0, $t0, 4 
sw $4, Array($t0) 
addi $t0, $t0, 4 
sw $5, Array($t0) 
addi $t0, $t0, 4 
sw $6, Array($t0) 
addi $t1, $0, 0 # 控制外层循环 
loop1: 
addi $t2, $0, 0 # 控制内层循环 
loop2: 
addi $t3, $t2, 4 # 指向下一个数字 
lw $t4, Array($t2)
lw $t5, Array($t3) 
slt $t0, $t4, $t5 # 比较两数字，若小于则不交换 
bne $t0, $zero, endl2 
sw $t5, Array($t2) # 交换数字 
sw $t4, Array($t3) 
endl2: 
addi $t2, $t2, 4 
sll $t3, $t1, 2 # t1计数x4 
add $t3, $t2, $t3 
beq $t3, 16, endl1 # 比较循环结束 
j loop2 
endl1: 
addi $t1, $t1, 1 # 计数 
beq $t1, 4, done 
j loop1 
done: 
# 将内存中排好序的数组移回寄存器中 
addi $t0, $0, 0 
lw $2, Array($t0) 
addi $t0, $t0, 4 
lw $3, Array($t0) 
addi $t0, $t0, 4 
lw $4, Array($t0) 
addi $t0, $t0, 4 
lw $5, Array($t0) 
addi $t0, $t0, 4 
lw $6, Array($t0) 
end:
