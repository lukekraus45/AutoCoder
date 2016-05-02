.data
welcome: .asciiz "Welcome to Auto Coder!\n"
options: .asciiz "The opcode (1-9: 1=add, 2=addi, 3=or, 4=ori, 5=lw, 6=sw, 7=j, 8=beq, 9=bne)\n"
string1: .asciiz "Please enter the 1st opcode: "
string2: .asciiz "Please enter the 2nd opcode: "
string3: .asciiz "Please enter the 3rd opcode: "
string4: .asciiz "Please enter the 4th opcode: "
string5: .asciiz "Please enter the 5th opcode: "
string6: .asciiz "The completed code is: \n"
string7: .asciiz "\tadd "
string8: .asciiz "\taddi "
string9: .asciiz "\tor "
string10: .asciiz "\tori "
string11: .asciiz "\tlw "
string12: .asciiz "\tsw "
string13: .asciiz "\tj "
string14: .asciiz "\tbeq "
string15: .asciiz "\tbne "
string16: .asciiz "$t0"
string17: .asciiz "$t1"
string18: .asciiz "$t2"
string19: .asciiz "$t3"
string20: .asciiz "$t4"
string21: .asciiz "$t5"
string22: .asciiz "100"
string23: .asciiz "101"
string24: .asciiz "102"
string25: .asciiz "103"
string26: .asciiz "\n"
string27: .asciiz ", "
string28: .asciiz "104"
string29: .asciiz "$t6"
string30: .asciiz "$t7"
string31: .asciiz "$t8"
string32: .asciiz "$t9"
string33: .asciiz "L100"
string34: .asciiz "L101"
string35: .asciiz "L102"
string36: .asciiz "L103"
string37: .asciiz "L104"
string38: .asciiz "("
string39: .asciiz ")"
string40: .asciiz ":"
string41: .asciiz "The machine code is\n"
string42: .asciiz "0x"
string43: .asciiz "\t"
buffer1: .space 32
buffer2: .space 32
buffer3: .space 32
buffer4: .space 32
buffer5: .space 32
machine1: .space 8
machine2: .space 8
machine3: .space 8
machine4: .space 8
machine5: .space 8
.text 
#Luke Kraus
#lek81@pitt.edu
#This program takes input from the user and autocodes it. The first step that I took was to get the input from the user. After I had the users values stored I branched off into
#the 9 different calls. Some of them were similar like add and or. I printed the name of the operation and then I called the registers or line number depending on the type of instruction
#To do this I kept track of the register number in a seperate register and compared it to a branch function. Depending on what it equaled it would print out the register. This is the 
#same way that I did the line numbers and immediate values. SO after I had this working completely, I worked on the machine code. This was by far the most intensive part. To do this I  
#created a buffer that would add the characters in binary (48 was 0 in ascii and 49 was 1 in ascii) and then depending on the opcode or register ect.  I would add this value to its
#corrosponding place on the buffer. So after a function was done it contained 32bit binary value. I then wrote a function to read in 4 values and export them to another buffer as a 1
#digit hexedecimal value. These were all the setps that I took to write the code as well as some formatting


#prints welcome
la $a0, welcome
li $v0, 4
syscall
#prints options
la $a0, options
li $v0, 4
syscall
#prints first string
la $a0, string1
li $v0, 4
syscall
#read in first int 
li $v0, 5
syscall
move $t1, $v0

#prints second string
la $a0, string2
li $v0, 4
syscall
#read in second int 
li $v0, 5
syscall
move $t2, $v0

#prints thrid string
la $a0, string3
li $v0, 4
syscall
#read in third int 
li $v0, 5
syscall
move $t3, $v0

#prints fourth string
la $a0, string4
li $v0, 4
syscall
#read in fourth int 
li $v0, 5
syscall
move $t4, $v0

#prints fifth string
la $a0, string5
li $v0, 4
syscall
#read in fifth int 
li $v0, 5
syscall
move $t5, $v0

la $a0, string26
li $v0, 4
syscall
syscall
la $a0, string6
syscall

#begins calling the inputs
move  $t0, $t1
la $s7, buffer1
move $t6, $t2
jal printLineNumb
jal branches
move  $t0, $t2
la $s7, buffer2
move $t6, $t3
jal printLineNumb
jal branches
move  $t0, $t3
la $s7, buffer3
move $t6, $t4
jal printLineNumb
jal branches
move  $t0, $t4
la $s7, buffer4
move $t6, $t5
jal printLineNumb
jal branches
move  $t0, $t5
la $s7, buffer5
jal branches


#print off machine code and return
la $a0, string26
li $v0, 4
syscall
la $a0, string41
li $v0, 4
syscall


#prints all the machine codes
la $a0, string43
li $v0, 4
syscall
la $t1, machine1
la $t2, buffer1
li $t5, 0
jal binaryToHex
la $a0, string42
li $v0,4
syscall
la $a0, machine1
li $v0, 4
syscall
la $a0, string26
li $v0, 4
syscall
la $a0, string43
li $v0, 4
syscall
la $t1, machine2
la $t2, buffer2
li $t5, 0
jal binaryToHex
la $a0, string42
li $v0,4
syscall
la $a0, machine2
li $v0, 4
syscall
la $a0, string26
li $v0, 4
syscall
la $a0, string43
li $v0, 4
syscall
la $t1, machine3
la $t2, buffer3
li $t5, 0
jal binaryToHex
la $a0, string42
li $v0,4
syscall
la $a0, machine3
li $v0, 4
syscall
la $a0, string26
li $v0, 4
syscall
la $a0, string43
li $v0, 4
syscall
la $t1, machine4
la $t2, buffer4
li $t5, 0
jal binaryToHex
la $a0, string42
li $v0,4
syscall
la $a0, machine4
li $v0, 4
syscall
la $a0, string26
li $v0, 4
syscall
la $a0, string43
li $v0, 4
syscall
la $t1, machine5
la $t2, buffer5
li $t5, 0
jal binaryToHex
la $a0, string42
li $v0,4
syscall
la $a0, machine5
li $v0, 4
syscall
la $a0, string26
li $v0, 4
syscall
j exit



branches:
move $t9, $ra
beq $t0, 1, one
beq $t0, 2, two
beq $t0, 3, three
beq $t0, 4, four
beq $t0, 5, five
beq $t0, 6, six
beq $t0, 7, seven
beq $t0, 8, eight
beq $t0, 9, nine
jr $t9

one:# (LINE NUMER) currReg+2, currReg, currReg+1
#add
move $s2, $ra
#printOpcode
jal printOpcode

la $a0, string7
li $v0, 4
syscall
#register 1
addi $s0, $s0, 2
addi $s7, $s7, 10
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#register 2
subi $s0, $s0, 2
subi $s7, $s7, 15
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#register 3
addi $s0, $s0, 1
jal chooseReg
addi $s7, $s7,5
#new line
la $a0, string26
li $v0, 4
syscall
#set cur register 
addi $s0, $s0, 1
addi $s4, $s4, 1
#print shamt value 
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
#print function
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $s2


two: #(LINE NUMER)currReg+1, currReg, currImmed
#addi
move $s2, $ra
#put opcode on buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

la $a0, string8
li $v0, 4
syscall
#first reg
addi, $s0, $s0, 1
addi $s7, $s7, 5
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#secondReg
subi $s0, $s0, 1
subi $s7, $s7, 10
jal chooseReg
addi $s7, $s7, 5
#","
la $a0, string27
li $v0, 4
syscall
#immediate
jal chooseImmed
#new line
la $a0, string26
li $v0, 4
syscall
#update currReg and currImmed
addi $s0, $s0, 1
addi $s1, $s1, 1
addi $s4, $s4, 1
jr $s2


three: #(LINE NUMER)currReg+2, currReg, currReg+1
#or
move $s2, $ra
jal printOpcode
la $a0, string9
li $v0, 4
syscall
#register 1
addi $s0, $s0, 2
addi $s7, $s7, 10
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#register 2
subi $s0, $s0, 2
subi $s7, $s7, 15
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#register 3

addi $s0, $s0, 1
jal chooseReg
#new line
addi $s7, $s7, 5
la $a0, string26
li $v0, 4
syscall
addi $s0, $s0, 1
addi $s4, $s4, 1
#print shamt value 
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
#print function
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $s2


four:#(LINE NUMER)currReg+1, currReg, currImmed
#ori
move $s2, $ra
la $a0, string10
li $v0, 4
syscall
#print opcode
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
#first reg
addi $s7, $s7, 5
addi, $s0, $s0, 1
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#secondReg
subi $s7, $s7, 10
subi $s0, $s0, 1
jal chooseReg
addi $s7, $s7, 5
#","
la $a0, string27
li $v0, 4
syscall
#immediate
jal chooseImmed
#new line
la $a0, string26
li $v0, 4
syscall
#print 
#update currReg and currImmed
addi $s0, $s0, 1
addi $s1, $s1, 1
addi $s4, $s4, 1
jr $s2


five:#(LINE NUMER) currReg+1, currImmed(currReg)  
#lw
move $s2, $ra
#prints Line Number 


la $a0, string11
li $v0, 4
syscall
#print opcode
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
#secondReg
addi $s0, $s0, 1
addi $s7, $s7, 5
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#prints currImmed
jal chooseImmed
subi $s7, $s7, 26
#print "("
la $a0, string38
li $v0, 4
syscall
#prints current Register
subi $s0, $s0, 1
jal chooseReg
addi $s7,$s7 21
#print ")"
la $a0, string39
li $v0, 4
syscall
#new line
la $a0, string26
li $v0, 4
syscall
addi $s4, $s4, 1
addi $s1, $s1, 1
addi $s0, $s0, 1
jr $s2


six:#(LINE NUMER)currReg+1, currImmed(currReg)
#sw
move $s2, $ra



la $a0, string12
li $v0, 4
syscall
#print opcode
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
#secondReg
addi $s0, $s0, 1
addi $s7, $s7, 5
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#prints currImmed
jal chooseImmed
subi $s7, $s7, 26
#print "("
la $a0, string38
li $v0, 4
syscall
#prints current Register
subi $s0, $s0, 1
jal chooseReg
addi $s7, $s7, 21
#print ")"
la $a0, string39
li $v0, 4
syscall
#new line
la $a0, string26
li $v0, 4
syscall
addi $s4, $s4, 1
addi $s0, $s0, 1
addi $s1, $s1, 1
jr $s2

seven: #(LINE NUMER) j preLineNum
#j
move $s2, $ra

la $a0, string13
li $v0, 4
syscall
#print opcode to buff
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
subi $s4, $s4,1
jal chooseLineNum
#new line
la $a0, string26
li $v0, 4
syscall
addi $s4, $s4, 2
addi $s0, $s0, 1
jr $s2


eight:#(LINE NUMER) currReg+1, currReg, prevLine Num
#beq
move $s2, $ra
la $a0, string14
li $v0, 4
syscall
#print opcode to buff
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
subi $s4, $s4,1
#reg 1
addi $s0, $s0, 1
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#reg 2
subi $s0, $s0, 1
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#prevLine 
jal chooseLineNumB
#new line
la $a0, string26
li $v0, 4
syscall
addi $s4, $s4, 2
addi $s0, $s0, 1
jr $s2


nine:#(LINE NUMER) currReg+1, currReg, prevLine Num
#bne
move $s2, $ra
la $a0, string15
li $v0, 4
syscall
#print opcode to buff
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
subi $s4, $s4,1
#reg 1
addi $s0, $s0, 1
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#reg 2
subi $s0, $s0, 1
jal chooseReg
#","
la $a0, string27
li $v0, 4
syscall
#prevLine 
jal chooseLineNumB
#new line
la $a0, string26
li $v0, 4
syscall
addi $s4, $s4, 2
addi $s0, $s0, 1
jr $s2




chooseReg:
#blt $s6, 8, printRegCode
beq $s0,0 reg0
beq $s0,1 reg1
beq $s0,2 reg2
beq $s0,3 reg3
beq $s0,4 reg4
beq $s0,5 reg5
beq $s0,6 reg6
beq $s0,7 reg7
beq $s0,8 reg8
beq $s0,9 reg9
beq $s0,10 reg0






reg0:#8 decimal
la $a0, string16
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg1:#9 decimal
la $a0, string17
li $v0, 4
syscall

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg2: #10 decimal
la $a0, string18
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg3:#11 decimal
la $a0, string19
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg4:#12 decimal
la $a0, string20
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg5:#13 dec
la $a0, string21
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg6:#14 dec
la $a0, string29
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg7:#15 dec
la $a0, string30
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg8:#24 dec
la $a0, string31
li $v0, 4
syscall
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

reg9: #25 dec
la $a0, string32
li $v0, 4
syscall
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

chooseImmed:
beq $s1, 0, imm1
beq $s1, 1, imm2
beq $s1, 2, imm3
beq $s1, 3, imm4
beq $s1, 4, imm5

imm1:
la $a0, string22 
li $v0, 4
syscall
#print immediate value in binary to buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

imm2:
la $a0, string23 
li $v0, 4
syscall

#print immediate value in binary to buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

imm3:
la $a0, string24 
li $v0, 4
syscall

#print immediate value in binary to buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

imm4:
la $a0, string25 
li $v0, 4
syscall

#print immediate value in binary to buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

imm5:
la $a0, string28 
li $v0, 4
syscall

#print immediate value in binary to buffer
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

chooseLineNum:
beq $s4, 0, lineNum1
beq $s4, 1, lineNum2
beq $s4, 2, lineNum3
beq $s4, 3, lineNum4
beq $s4, 4, lineNum5


lineNum1:
la $a0, string33 
li $v0, 4
syscall

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

lineNum2:
la $a0, string34 
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
#21
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

lineNum3:
la $a0, string35 
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

lineNum4:
la $a0, string36 
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

lineNum5:
la $a0, string37 
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

binaryToHex:

#4 bits are loaded into a registers 
li $t3, 0
lb $t4, ($t2)
#get one bit and load it into a register
beq $t4, 49, addEight
#get next bit
lb $t4, 1($t2)
beq $t4, 49, addFour
#get next bit
lb $t4, 2($t2)
beq $t4, 49, addTwo
#get next bit
lb $t4, 3($t2)
beq $t4, 49, addOne

printHex:

beq $t3, 0, print0
beq $t3, 1, print1
beq $t3, 2, print2
beq $t3, 3, print3
beq $t3, 4, print4
beq $t3, 5, print5
beq $t3, 6, print6
beq $t3, 7, print7
beq $t3, 8, print8
beq $t3, 9, print9
beq $t3, 10, printA
beq $t3, 11, printB
beq $t3, 12, printC
beq $t3, 13, printD
beq $t3, 14, printE
beq $t3, 15, printF

jr $ra

addEight:
addi $t3, $t3, 8
#get next bit
lb $t4, 1($t2)
beq $t4, 49, addFour
#get next bit
lb $t4, 2($t2)
beq $t4, 49, addTwo
#get next bit
lb $t4, 3($t2)
beq $t4, 49, addOne
j printHex

addFour:
addi $t3, $t3, 4
#get next bit
lb $t4, 2($t2)
beq $t4, 49, addTwo
#get next bit
lb $t4, 3($t2)
beq $t4, 49, addOne
j printHex

addTwo:
addi $t3, $t3, 2
#get next bit
lb $t4, 3($t2)
beq $t4, 49, addOne
j printHex


addOne: 
addi $t3, $t3, 1
j printHex


print0:
li $t3, 48
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print1:
li $t3, 49
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print2:
li $t3, 50
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print3:
li $t3, 51
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print4:
li $t3, 52
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print5:
li $t3, 53
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print6:
li $t3, 54
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print7:
li $t3, 55
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print8:
li $t3, 56
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
print9:
li $t3, 57
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printA:
li $t3, 97
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printB:
li $t3, 98
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printC:
li $t3, 99
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printD:
li $t3, 100
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printE:
li $t3, 101
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra
printF:
li $t3, 102
sb $t3, ($t1)
addi $t5, $t5, 1
addi $t1, $t1, 1
addi $t2, $t2, 4
blt $t5, 8, binaryToHex
jr $ra




printOpcode:
li $s5, 48
sb $s5, ($s7)
addi $s7, $s7,1
sb $s5, ($s7)
addi $s7, $s7,1
sb $s5, ($s7)
addi $s7, $s7,1
sb $s5, ($s7)
addi $s7, $s7,1
sb $s5, ($s7)
addi $s7, $s7,1
sb $s5, ($s7)
addi $s7, $s7,1
jr $ra

chooseLineNumB:
#s4 containes the line num
beq $s4, 0, zeroB
beq $s4, 1, oneB
beq $s4, 2, twoB
beq $s4, 3, threeB
beq $s4, 4, fourB

zeroB:
la $a0, string33 
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 4
sb $v0, ($s7)
addi $s7, $s7,1

jr $ra

oneB:
la $a0, string34
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

twoB:
la $a0, string35
li $v0, 4
syscall
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

threeB:
la $a0, string36
li $v0, 4
syscall
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 48
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

fourB:
la $a0, string37
li $v0, 4
syscall
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1

li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
li $v0, 49
sb $v0, ($s7)
addi $s7, $s7,1
jr $ra

printLineNumb:
#t6 containtes the next line

bge $t6, 7, printer
jr $ra
printer:
beq $s4, 0, zeroL
beq $s4, 1, oneL
beq $s4, 2, twoL
beq $s4, 3, threeL
beq $s4, 4, fourL

zeroL:
la $a0, string33 
li $v0, 4
syscall
la $a0, string40
syscall
jr $ra

oneL:
la $a0, string34
li $v0, 4
syscall
la $a0, string40
syscall
jr $ra

twoL:
la $a0, string35
li $v0, 4
syscall
la $a0, string40
syscall
jr $ra

threeL:
la $a0, string36
li $v0, 4
syscall
la $a0, string40
syscall
jr $ra

fourL:
la $a0, string37 
li $v0, 4
syscall
la $a0, string40
syscall
jr $ra

exit:
li $v0, 10
syscall

