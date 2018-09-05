#!/bin/bash
#定义变量
echo "--------变量--------"
my_name="lynnYang"
my_motto="Everything is possible!"
#只读变量
readonly my_name
#输出
echo ${my_name}
#只读变量更改报错
#my_name="zhoujian"
#删除变量,删除只读变量报错
#unset my_name
#单引号中的变量无效，使用双引号
#拼接字符串
echo "--------拼接字符串--------"
greeting="hello,"$my_name" !"
greeting_1="hello,${my_name} !"
echo $greeting $greeting_1
#获取字符串长度
echo "--------获取字符串长度--------"
echo ${#my_name}
echo ${#my_motto}
#查找字符串i或s的位置,程序报bug...
#echo `expr index "$my_motto" si`
#shell数组,bash支持一维数组
echo "--------数组--------"
array_name=(1 2 3 4)
array_name_2=(
	yanglin
	zhoujian
)
array_name_3[0]=5
array_name_3[3]=6
array_name_3[5]=9
array_name_3[9]=0
#打印数组内容
echo ${array_name[@]}
echo ${array_name_2[@]}
echo ${array_name_3[@]}
value=${array_name[1]}
echo ${value}
#获取数组长度及数组中元素的长度
echo ${#array_name[@]}
echo ${#array_name_3[*]}
echo ${#array_name_2[0]}
echo ${#array_name_2[1]}
my_arry=(a b "c","d" abc)
echo "-------FOR循环遍历输出数组--------"
for i in ${my_arry[@]};
do
  echo $i
done

echo "-------WHILE循环输出 使用 let i++ 自增---------"
j=0
while [ $j -lt ${#my_arry[@]} ]
do
  echo ${my_arry[$j]}
  let j++
done

echo "--------WHILE循环输出 使用 let  "n++ "自增: 多了双引号，不用也可以---------"
n=0
while [ $n -lt ${#my_arry[@]} ]
do
  echo ${my_arry[$n]}
  let "n++"
done

echo "--------WHILE循环输出 使用 let m+=1 自增---------"
m=0
while [ $m -lt ${#my_arry[@]} ]
do
  echo ${my_arry[$m]}
  let m+=1
done

echo "--------WHILE循环输出 使用 a=$[$a+1] 自增,比较麻烦----------"
a=0
while [ $a -lt ${#my_arry[@]} ]
do
 echo ${my_arry[$a]}
 a=$[$a+1]
done
#提取子字符串
echo "--------提取子字符串--------"
#从第1个字符开始截取4个字符
echo ${my_name:0:4}
#从第5个字符开始截取13个字符
echo ${my_motto:5:13}
#'#'号截取，删除左边字符，保留右边字符
echo ${my_motto#*is}
#'##'号截取，删除左边字符，保留右边字符
echo ${my_motto##*i}
#'%'号截取，删除右边字符，保留左边字符
echo ${my_motto%i*}
#'%%'号截取，删除右边字符，保留左边字符
echo ${my_motto%%i*}
#从左边第几+1个字符开始，一直到结束
#12表示从左边第13个字符开始，一直到结束
echo ${my_motto:12}
#从右边第7个字符开始，截取3个字符
echo ${my_motto:0-7:3}
#从右边第7个字符开始，一直到结束
echo ${my_motto:0-7}
#注：删除操作包含指定字符本身
#注：左边的第一个字符是用0表示，右边的第一个字符用0-1表示
#
#
#传递参数
echo "--------传递参数--------"
echo "执行的文件名：$0"
echo "第一个参数为：$1"
echo "第二个参数为：$2"
echo "第三个参数为：$3"
echo "传递到脚本的参数个数：$#"
echo "以一个单字符串显示所有向脚本传递的参数："$*"" 
echo "以一个单字符串显示所有向脚本传递的参数："$@""
echo "脚本运行的当前进程ID"
echo $$
echo "后台运行的最后一个进程的ID"
echo $!
echo '--------$*和$@的区别--------'
echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done
echo "--------运算符--------"
#表达式和运算符之间要有空格
val=`expr 2 + 2`
echo "两数之和为：$val"
echo "--------关系运算符--------"
a=10
b=20

if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi

echo "--------布尔运算符--------"
if [ $a != $b ]
then
   echo "$a != $b : a不等于b"
else
   echo "$a != $b : a等于b"
fi

if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 ：返回true"
else
   echo "$a 小于 100 且 $b 大于 15 ：返回false "
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

echo "--------逻辑运算符--------"
#[]和里边或外边的内容之间必须有空格，否则会报错
if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回true"
else
   echo "返回false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回true"
else
   echo "返回false"
fi

echo "--------字符串运算符--------"
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n $a ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

echo "--------文件测试运算符--------"
file="/Users/yanglin/somethingUseful/shellScript/test.sh"
if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi

echo "--------echo命令--------"
echo "To Be or Not To Be, that is a question."
echo To Be or Not To Be, that is a question.
echo "\"To Be or Not To Be, that is a question.\""
echo \"To Be or Not To Be, that is a question.\"

echo "--------显示变量--------被注释掉了--------"
#read name
#echo "$name is a shell script."

echo "--------显示换行--------"
echo -e "Hello \n"   #-e 开启转义 \n换行
echo "World!"

echo "--------显示不换行--------"
echo -e "Hello \c"  #-e 开启转义 \c不换行
echo "World!"

echo "--------显示结果定向至文件--------"
echo "输出Hello World 至特定目录下的myfile文件"
echo "Hello World !" > ~/somethingUseful/generated/myfile

echo "--------原样输出字符串，不进行转义或取变量--------"
echo '$name\"'

echo "--------显示命令执行结果--------"
echo `date`

printf "Hello, Shell\n"
echo "Hello, Shell"

printf "%s\n" "--------printf命令--------"
# format-string为双引号
printf "%d %s\n" 1 "abc"

# 单引号与双引号效果一样 
printf '%d %s\n' 1 "abc" 

# 没有引号也可以输出
printf %s abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"

printf "%s\n" "--------printf转义--------"
printf "a string, no processing:<%s>\n" "A\nB"
printf "a string, no processing:<%b>\n" "A\nB"
printf "www.runoob.com \a"

printf "%s\n" "--------test命令--------"
#test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi
#代码中的[]执行基本的算术运算
a=5
b=6
result=$[a+b]
echo "result 为：$result"
#字符串测试
str1="yanglin"
str2="yanglin"
if test $str1 = $str2
then
   echo '两个字符串相等'
else
   echo '两个字符串不相等'
fi
#文件测试
cd /Users/yanglin/somethingUseful/shellScript
if test -e ./test.sh
then
   echo '文件已存在'
else
   echo '文件不存在'
fi

if test -r ./test.sh
then
   echo '文件存在且可读'
else
   echo '文件不存在或文件不可读'
fi

if test -w ./test.sh
then
   echo '文件存在且可写'
else
   echo '文件不存在或不可写'
fi

if test -x ./test.sh
then
   echo '文件存在且可执行'
else
   echo '文件不存在或不可执行'
fi

if test -s ./test.sh
then
   echo '文件存在且至少有一个字符'
else
   echo '文件不存在或文件为空'
fi

cd /Users/yanglin/somethingUseful
if test -d ./shellScript
then
   echo '文件存在且为目录'
else
   echo '文件不存在或者不是一个目录'
fi

cd /Users/yanglin/somethingUseful/shellScript
if test -f ./myfile
then
   echo '文件存在且为普通文件'
else
   echo '文件不存在或文件不是普通文件'
fi

if test -c ./test.sh
then
   echo '文件存在且为字符型特殊文件'
else
   echo '文件不是一个字符型特殊文件'
fi

if test -b ./test.sh
then
   echo '文件存在且为块特殊文件'
else
   echo '文件不是一个块特殊文件'
fi

cd /Users/yanglin/somethingUseful/shellScript
if test -e ./myfile -o -e ./test.sh
then
    echo '至少有一个文件存在!'
else
    echo '两个文件都不存在'
fi

if test -e ./myfile -a -e ./test.sh
then
    echo '两个文件都存在!'
else
    echo '不是两个文件都存在'
fi

echo "流程控制"
a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

for str in 'This is a string'
do
    echo $str
done

echo "--------while命令--------"
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++" 
    #let命令，用于执行一个或多个表达式，变量计算中不需要加上$来表示变量
done

echo '按下 <CTRL-D> 退出'
echo -n '输入你最喜欢的网站名: '
while read FILM
do
    echo "是的！$FILM 是一个好网站"
done

echo '--------case命令--------'
echo '输入1-4之间的数字：'
echo '你输入的数字为：'
read aNum
case $aNum in
    1) echo '你选择了1'
    ;;
    2) echo '你选择了2'
    ;;
    3) echo '你选择了3'
    ;;
    4) echo '你选择了4'
    ;;
    *) echo '你没有输入1-4之间的数字'
    ;;
esac

echo '--------跳出循环--------'
while true
do
    echo -n "输入1-5之间的数字"
    read aNum
    case $aNum in
	1|2|3|4|5) echo "你输入的数字为 $aNum !"
	;;
	*) echo "你输入的数字不是1-5之间的数字，游戏结束！"
	    break
	;;
    esac
done

echo "--------continue命令--------"
while :
do
    echo -n "输入1-5之间的数字："
    read aNum
    case $aNum in
	1|2|3|4|5) echo "你输入的数字为 $aNum !"
	;;
	*) echo "你输入的数字不是1-5之间的！"
	;;
    esac
done

echo "--------shell函数--------"
demoFun(){
    echo "这是我的第一个shell函数！"
}
echo "--------函数开始执行--------"
demoFun
echo "--------函数执行完毕--------"
















