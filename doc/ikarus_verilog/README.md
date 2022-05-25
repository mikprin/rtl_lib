

# Icarus Verilog and GTKWave
[Source of installation instruction](https://github.com/viktor-prutyanov/drec-fpga-intro/wiki)

Icarus Verilog is the most simple Verilog simulation tool. This page is Icarus Verilog and GTKwave instalation tutorial. It is assumed that you are using one of the Linux distributions. The tutorial was tested on Fedora 28 and Ubuntu 16.04.

## Installation

The most complete official installation guide is [here](http://iverilog.wikia.com/wiki/Installation_Guide).

### Linux (Ubuntu 16.04)

```
  sudo apt install iverilog
  sudo apt install gtkwave
```

### Linux (Fedora 28)

```
  sudo yum install iverilog
  sudo yum install gtkwave
```

Suppose, we have following Verilog source file `dummy.v`:

```verilog
module dummy();

wire a = 1;

initial begin
    $dumpvars;
    $display("Hello, World!");
    #10 $finish;
end

endmodule
```

## Compile Verilog source into executable

```
  iverilog dummy.v -o dummy
```

## Run simulation with Icarus Verilog

```
  vvp dummy
```
or
```
  ./dummy
```

```
  $ ./dummy 
  VCD info: dumpfile dump.vcd opened for output.
  Hello, World!
```

## Open dump with GTKWave

```
  gtkwave dump.vcd
```

```
$ gtkwave dump.vcd

GTKWave Analyzer v3.3.89 (w)1999-2018 BSI

[0] start time.
[10] end time.
WM Destroy
```

# Icarus Verilog и GTKWave

Программа Icarus Verilog это самое простое средство для симуляции Verilog-кода. Эта страница является руководством по установке программ Icarus Verilog и GTKwave.

**Предполагается, что установлен один из дистрибутивов Linux.** Данное руководство было проверено на Fedora 28 и Ubuntu 16.04. **Если вы только собираетесь поставить Linux** для изучения этого курса на физическую или виртуальную машину, и у вас нет своих предпочтений, выбирайте Fedora или Ubuntu. Все остальные руководства будут так же протестированы на них. Если вы работаете **только на Windows** (по какой-то причине), то пользуйтесь ссылками на официальные руководства.

## Установка

[По этой ссылке](http://iverilog.wikia.com/wiki/Installation_Guide) можно свериться с официальным руководством по установке Icarus Verilog.

### Linux (Ubuntu 16.04)

```
  sudo apt install iverilog
  sudo apt install gtkwave
```

### Linux (Fedora 28)

```
  sudo yum install iverilog
  sudo yum install gtkwave
```

Предположим, что у нас есть файл с кодом `dummy.v` со следующим содержанием:

```verilog
module dummy();

wire a = 1;

initial begin
    $dumpvars;
    $display("Hello, World!");
    #10 $finish;
end

endmodule
```

## Компиляция кода

```
  iverilog dummy.v -o dummy
```

## Запуск симуляции в Icarus Verilog

```
  vvp dummy
```
или
```
  ./dummy
```

```
  $ ./dummy 
  VCD info: dumpfile dump.vcd opened for output.
  Hello, World!
```

## Открытие дампа с сигналами в GTKWave

```
  gtkwave dump.vcd
```

```
$ gtkwave dump.vcd

GTKWave Analyzer v3.3.89 (w)1999-2018 BSI

[0] start time.
[10] end time.
```

Чтобы увидеть сигналы, нужно выбрать их в левой нижней панели и нажать кнопку "Append".