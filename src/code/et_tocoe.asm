# 比萨斜塔摔鸡蛋ASM汇编程序

# 寄存器用途说明：
# $2 (楼层上限): 建筑物的最大楼层数
# $3 (鸡蛋耐摔值): 鸡蛋的最大可忍受摔落次数
# $4 (总摔鸡蛋次数): 记录总共的摔鸡蛋次数
# $5 (碎裂的鸡蛋数): 记录摔碎的鸡蛋数
# $6 (最后一个鸡蛋是否碎裂): 标志位，1 表示鸡蛋碎裂，0 表示未碎裂
# $7 (左边搜索边界): 二分查找时的左边搜索边界
# $8 (右边搜索边界): 二分查找时的右边搜索边界
# $9 (中间值): 二分查找时的中间值
# $10: 常数 1

.text
   addi $10, $0, 1      # 常数 1（$10=1）
   add $7, $0, $0       # 左边界 l=1
   add $8, $0, $2       # 右边界 r=n
   addi $13, $0, 1      # 初始位置 loc=1

LOOP:
    slt $11, $7, $8      # 检查左边界是否大于等于右边界 ($11=0)
    beq $11, $0, END     # 如果左边界大于等于右边界，跳转到 END ($11=0)
    addi $4, $4, 1       # 增加总摔鸡蛋次数
    add $9, $7, $8
    addi $9, $9, 1
    sra $9, $9, 1        # 计算中间值 mid = (l+r+1)/2
    slt $11, $3, $9      # 检查鸡蛋耐摔值是否大于等于中间值 ($11=0)
    slt $14, $13, $9     # 如果 $13 < $9，则 $t0 = 1；否则 $t0 = 0
    beq $14, $0, COST    # 如果 $14 == 0（即 $13 >= $9），跳转到 COST
    sub $16, $9, $13     # 上楼层数
    add $15, $15, $16    
    add $15, $15, $16    #计算代价1
    add $17, $17, $16    
    add $17, $17, $16  
    add $17, $17, $16  
    add $17, $17, $16   #计算代价2
    add $13, $9, $0      #更新位置 loc
    
CONTINUE:
    beq $11, $10, BROKE  # 如果鸡蛋耐摔值大于等于中间值，跳转到 BROKE ($11==1)
    
RESISIT:
    add $6, $0, $0       # 设置最后一个鸡蛋是否碎裂为 0
    add $7, $0, $9       # 更新左边界为中间值
    j LOOP

BROKE:
    addi $15, $15, 4     #鸡蛋摔碎，代价1+4
    addi $17, $17, 2     #鸡蛋摔碎，代价2+2
    addi $5, $5, 1       # 增加碎裂的鸡蛋数
    add $6, $0, $10      # 设置最后一个鸡蛋是否碎裂为 1
    sub $8, $9, $10      # 更新右边界为中间值减一
    j LOOP

COST:
    sub $16, $13, $9     # 下楼层数
    add $15, $15, $16    # 计算代价1
    add $17, $17, $16    # 计算代价2
    add $13, $9, $0      #更新位置 loc
    j CONTINUE
END:
    j END                # 无限循环

.text  ends
