.data
nod:.space 4
nr_cerinta:.space 4
pls:.asciz "pls"
nm1:.space 4
rand:.space 4
aux2:.space 4
final:.space 4
m1:.space 40000
i:.space 4
j:.space 4
v1:.space 400
aux:.space 4
nr_noduri:.space 4
formatScanf:.asciz "%ld"
formatPrintf:.asciz "%ld "
newLine:.asciz "\n"
bitin:.long 0
.text
matrix_mult:
pushl %ebp
movl %esp,%ebp


ret
.global main
main:
VerfCerinta:
pusha
pushl $nr_cerinta
pushl $formatScanf
call scanf
popl %ebx
popl %ebx
popa

pusha
pushl $nr_noduri  #citire nr Noduri
pushl $formatScanf
call scanf
popl %ebx
popl %ebx
popa

movl $0,i
CitireVector:
movl i,%ecx
cmp nr_noduri,%ecx
je Matrice0

pusha
pushl $aux
pushl $formatScanf
call scanf
popl %edx
popl %edx
popa

lea v1,%edi
movl i,%ecx
movl aux,%ebx
movl %ebx,(%edi,%ecx,4)

incl i

jmp CitireVector

Matrice0:

movl $0,i

Punere0:
movl i,%ecx
cmp nr_noduri,%ecx
je Punere10

lea v1,%edi
movl (%edi,%ecx,4),%ebx
movl %ebx,aux

movl $0,j
Punere1:
movl j,%ecx
cmp aux,%ecx
je Punere11

pusha
pushl $nod
pushl $formatScanf
call scanf
popl %edx
popl %edx
popa

movl i,%eax
movl $0,%edx
mull nr_noduri
addl nod,%eax

lea m1,%esi
movl $1,(%esi,%eax,4)

incl j
jmp Punere1

Punere11:
incl i 
jmp Punere0

Cerinta2:

pusha

popa


Punere10:

movl $2,%ecx
cmp %ecx,nr_cerinta
je Cerinta2

movl $0,i
afis1:
movl i,%ecx
cmp nr_noduri,%ecx
je afisc1

movl $0,j
afis2:
movl j,%ecx
cmp nr_noduri,%ecx
je afisc2

lea m1,%esi

movl i,%eax
xorl %edx,%edx
mull nr_noduri
addl j,%eax

movl (%esi,%eax,4),%ebx

pusha
pushl %ebx
pushl $formatPrintf
call printf
popl %edx
popl %edx
popa

pusha
push $0
call fflush
popl %edx
popa

incl j
jmp afis2

afisc2:
movl $4,%eax
movl $1,%ebx
movl $newLine,%ecx
movl $1,%edx
int $0x80
incl i
jmp afis1
afisc1:
jmp exit
exit:
movl $1,%eax
xor %ebx,%ebx
int $0x80

