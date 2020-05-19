# SICP
### 1.1 程序设计的基本元素

#### 1.1.1 表达式

表达式：你可以键入的基本表达式就是数字，操作符号也是表达式。

`个人理解：也就是说除了基本表达式还有其他的表达式，用Java来讲，就是对象！`

过程：过程就是 执行诸如 `+ -  * /`这样的操作。可以用表示 基本过程 的表达形式`(例如+或者*)`，将表示数的表达式组合起来，形成符合表达式。这样的表达式称为组合式。

`个人理解：同理还有非基本过程`

#### 1.1.3 组合式的求值

本章的目标是**要把与过程性思维有关的各种问题隔离出来**

- 求一个组合式，要做下面的事

1. 求该组合式的各个子表达式的值

   ```lisp
   (* 2 4)
   ; 该组合式各子表达式的值为
   *
   2
   4
   ```

2. 将作为最左子表达式的值得那个过程 应用于相应的实际参数，所谓实际参数也就是其他子表达式的值

   `个人理解为：对值进行操作，具体什么操作取决于最左子表达式的过程`

第一个步骤遇到的不是组合式，而是基本表达式，例如数、内部运算符或者其他名字。处理这些基础情况的方式如下规定：

- 数的值就是它们所表示的数值
- 内部运算符的值就是能完成相应操作的计算指令序列
- 其他名字的值就是在环境中关联于这一名字的那个对象

对于初学者，环境所扮演的角色就是用于确定表达式中各个符号的意义。

我们可以把第二种规定看作是第三种规定的特殊情况，为此只需将像 `+` 和 `*` 一类的运算符也包含在全局环境里，并将相应的指令序列作为与之关联的"值"。

`个人理解：环境就是用来存储变量的地址，并且是含有名字和值这样的键值对`

对于`(define x 3)`的求值并不是将`define`作用于它的两个实际参数，`define`的作用就是为`x`关联一个值，也就是说`(define x 3)`并不是一个组合式。

![image-20200519095549982](assets/image-20200519095549982.png)

#### 1.1.7 实例：采用牛顿法求平方根

书中的`good-enough?`做法

```lisp
;
(define (sqrt-iter guess x)
  (if (good-enough? guess  x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

; y方 = x
; 这里的good-enough? 的 x 是一个固定的值 而guess 是一个变化的值
; 每次将变化的guess的平方于固定的x进行差值比较
 (define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.001))


(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
```

练习`1.7`的`good-enough?`

```lisp

; 传入的参数是平均值 而不是 x 因为x是固定的值 这里的good-enough? 需要做的是对改变的值得比较
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
     (improve guess x)
      (sqrt-iter (improve guess x) x)))
; 这里的oldVal 和 newVal 都是变化的值
; oldVal 是不够好之后 改进的值 而 newVal是提前优化的值
(define (good-enough? oldVal newVal)
  (< (/ (abs (- newVal oldVal)) oldVal) 0.01))

(define (improve guess x)
  (average guess x))

(define (average guess x)
  (/ (+ guess (/ x guess)) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
```

