# PES_ASIC_CLASS
## Objective
VLSI ASIC design involves creating custom circuits optimized for specific tasks using RTL (Register-Transfer Level) description. This involves designing digital logic using hardware description languages like VHDL or Verilog, converting it to gate-level representation through synthesis, and eventually translating it into a physical layout for fabrication. The process includes architectural design, logic implementation, verification, and testing, resulting in highly efficient and tailored integrated circuits.
## Outcome
* RTL Description
* Logic Synthesis
* Physical Design
* Verification
## Minimum Requirements
* Ram-6GB
* Ubuntu 22.04
* Disk space 100 GB minimum

  # INSTALLATION
<details>
<summary> RISC-V toolchain </summary>

 1. Download riscv.sh from the repo
 2. Open terminal and go to the directory where riscv.sh is present
 3. run the commands `chmod +x riscv_toolchain.sh` `./riscv.sh`

This would install riscv toolchain along with iverilog
</details>

<details>
<summary> Yosys </summary>

1. Download yosys.sh from the repo
2. Open terminal and go to the directory where yosys.sh is present
3. run the commands `chmod +x yosys.sh` `./yosys.sh`
</details>


# RISCV Toolchain 
<details>
  <summary>Day 1  Introduction to RISC-V ISA and GNU compiler toolchain</summary>
<br>

## Task 1
###  C Program To Compute Sum From 1 to N (using gcc) & Spike Simulation And Debug (using RISCV)
```
gcc sum1ton.c
./a.out
```
After this use the following code to implement it in spike simulator
```
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
spike pk sum1ton.o
```




![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b23ea7cd-2b6d-48b4-a899-e51b2143fa21)
To debug the ALP generated by the compiler
```
spike -d pk sum1ton.o
```


![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/0cee1bf5-a8d8-4f9c-a437-8e12b2ce2665)

### Task 2
#### C program that shows the maximum and minimum values of 64bit unsigend and signed numbers.
Use the same method as you have used in task 1
and then use this code
```
unsign_sign.c
```
And then again use spike to get the result


![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/7a2e14ca-dec8-4859-b74c-25981bebc42a)
</details>

<details>
<summary> Day 2 </summary>

## Task 1
Simulate a C program using ABI function call (using registers) and execute




![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b5e38750-acb9-452d-b44c-2c2e7f7bd4d4)


![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/83c4dded-c2d4-47fd-b9b9-95c9db244f19)

![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/57496502-0d24-4740-9fd6-859c523ba548)
</details>

# Week 2
#  RTL design using Verilog with SKY130 Technology 

<details>
    <summary> Day 1 - Introduction to iVerilog, GTKwave and Yosys  </summary>
    <br>
      
## Task 1
## Loading a mux and it's testbench into iverilog 
    
+ `cd vsd/sky130RTLDesignAndSynthesisWorkshop/verilog_files`
+ `iverilog good_mux.v tb_good_mux.v`
+ `./a.out`
+ ` gtkwave tb_good_mux.vcd`
![gtkwave](https://github.com/dsingla54/pes_asic_class/assets/139515749/23c5207b-74dd-41b2-bb11-c9cc09bce3bd)

 
    
    To see The Contents of the files:

    `gvim tb_good_mux.v -o good_mux.v`

 ![good1](https://github.com/dsingla54/pes_asic_class/assets/139515749/669df93b-a8f3-4cb7-b14d-00c484920453)


## Task 2
## Labs using Yosys and Sky130 PDKs
     
  +   To invoke **yosys**
  -  `cd`
  -  `cd vsd/sky130RTLDesignAndSynthesisWorkshop/verilog_files`
  -   Type `yosys`
     <br>
     ![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/1feb52bd-436f-477a-af78-b9b180d9fa3e)



  + ` read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
    ![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b933c0bb-b74e-4668-8309-51e817c54a16)

  +  `read_verilog good_mux.v`
  +  ` synth -top good_mux`
    ![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b51f2363-d064-4344-bbfa-34152ce64e2a)

![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/596451bd-2da1-46df-bf28-598f1d8fcd6e)


  + To generate the netlist

  `abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib`
  ![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/51a4c53f-786f-4aa7-be6b-2a7ef81f16d8)



  + To see the logic realised
   `show`

![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/6f533dde-c432-4baa-9615-f523cffb8d66)



  To write the netlist

   - `write_verilog good_mux_netlist.v`
   - `!gvim good_mux_netlist.v`

  - To view a simplified code
     
     ` write_verilog -noattr good_mux_netlist.v`
     
     `!gvim good_mux_netlist.v`
    
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/c8be3d9b-fb1a-4e04-bc91-99dc36a85a0f)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/6c588d4a-72ca-47c0-a130-df3a570e82d7)


</details>  

<details>
  <summary> Day 2 - Timing libs, hierarchical vs flat synthesis and efficient flop coding styles </summary>
  <br>

## Introduction to .lib

## Task 1
### Command to invoke sky130_fd_sc_hd__tt_025C_1v80.lib file 

```
 vim ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/4bcc6850-de7f-4346-9891-fd05db97ae7a)


## Task 2
## Hier synthesis flat synthesis 

```
yosys
read_liberty -lib ../lib//sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog multiple_modules.v
synth -top multiple_modules
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show multiple_modules
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b6aef00b-e9b8-4024-a348-1da919bc26a4)

```
write_verilog multiple_modules_hier.v
!vim multiple_modules_hier.v 
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/dee862cb-14e4-44ae-a3b1-f7d3a7f15b49)


## Task 3

## Various Flop Coding Styles and optimization

### For asynchronous reset
```
iverilog dff_asyncres.v tb_dff_asyncres.v
./a.out
gtkwave tb_dff_asyncres.vcd 
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/3b1555c8-e044-443f-89b1-ffaa1bf9b843)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/8f4f3ec3-aa90-46ba-ad43-50c9766c22a9)



### For Asynchronous set
```
iverilog dff_async_set.v tb_dff_async_set.v
./a.out
gtkwave tb_dff_async_set.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/02d0729a-9f5e-42b1-91da-e8536673653e)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/7e364742-07bc-4ea2-9214-4cf143e74fa2)

### For Synchronous reset
```
iverilog dff_syncres.v tb_dff_syncres.v
./a.out
gtkwave tb_dff_syncres.vcd 
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/02d0729a-9f5e-42b1-91da-e8536673653e)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/cb89a3ae-2eb8-4eaf-b347-5e06bff203ea)


## Task 4
### Synthesizing all 3 codes using yosys

```
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_asyncres.v
synth -top dff_asyncres
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib//sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/01a121c9-5e1e-48e7-846d-65f87922b41a)


```
read_verilog dff_async_set.v
synth -top dff_async_set
dfflibmap -liberty ../lib//sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/595f6899-2e2f-4c8c-ab18-3a524214a217)


```
read_verilog dff_syncres.v
synth -top dff_syncres
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/5bf951cf-8433-42eb-b84d-da5661c4e605)


</details>

<details>
  <summary> Day 3 - Combinational and Sequential Optimizations </summary>
  <br>

# Introduction to optimizations
## Combinational logic optimizations
**opt_check1.v**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog opt_check.v
synth -top opt_check
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/90a9a3ce-21de-4865-a61e-27566caab008)



``` v
module opt_check2 (input a , input b , output y);
	assign y = a?1:b;
endmodule
```
**Synthesis**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog opt_check2.v
synth -top opt_check2
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/99169448-ca3a-4b72-85b1-1acd51c9c150)

**opt_check3.v**

```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog opt_check3.v
synth -top opt_check3
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/951e93a6-0320-47ed-91b2-5cea3ce5b041)


**multiple_module_opt.v**
``` v
module sub_module1(input a , input b , output y);
 assign y = a & b;
endmodule


module sub_module2(input a , input b , output y);
 assign y = a^b;
endmodule


module multiple_module_opt(input a , input b , input c , input d , output y);
wire n1,n2,n3;

sub_module1 U1 (.a(a) , .b(1'b1) , .y(n1));
sub_module2 U2 (.a(n1), .b(1'b0) , .y(n2));
sub_module2 U3 (.a(b), .b(d) , .y(n3));

assign y = c | (b & n1); 


endmodule
```
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
read_verilog multiple_module_opt.v
synth -top multiple_module_opt
flatten
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/f2491c12-485a-4bc8-9d76-bfa46badd8dc)


# Sequential logic optimizations
**dff_const1.v**
``` v
module dff_const1(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b0;
	else
		q <= 1'b1;
end

endmodule
```

```
iverilog dff_const1.v tb_dff_const1.v
./a.out
gtkwave tb_dff_const1.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b4028581-cead-4c1a-ab4a-9a087f9cea1d)


**Synthesis**
```
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
  read_verilog dff_const1.v
  synth -top dff_const1
  dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
  show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/255179a3-db35-4d2d-958f-bf50b5bce75b)

**dff_const2.v**
``` v
module dff_const2(input clk, input reset, output reg q);
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 1'b1;
	else
		q <= 1'b1;
end

endmodule
```
```
iverilog dff_const2.v tb_dff_const2.v
./a.out
gtkwave tb_dff_const2.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/11325d4b-4a53-4625-bb23-7c0f1bf3b32a)



**Synthesis**
```
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
  read_verilog dff_const2.v
  synth -top dff_const2
  dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
  show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/f9382b10-6fd1-49c2-af92-ae32dccac20d)



**dff_const3.v**
``` v
module dff_const3(input clk, input reset, output reg q);
reg q1;

always @(posedge clk, posedge reset)
begin
	if(reset)
	begin
		q <= 1'b1;
		q1 <= 1'b0;
	end
	else
	begin
		q1 <= 1'b1;
		q <= q1;
	end
end

endmodule
```

```
iverilog dff_const3.v tb_dff_const2.v
./a.out
gtkwave tb_dff_const3.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/d725b2f4-4625-4a68-8e20-ba1168aecdb4)


**Synthesis**
```
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
  read_verilog dff_const3.v
  synth -top dff_const3
  dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
  show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/e5d43184-6219-4c2a-86a4-d719b1a0a896)


# Sequential optimzations for unused outputs

**counter_opt.v**
``` v
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = count[0];

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule
```
**Synthesis**
```
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
  read_verilog counter_opt.v
  synth -top counter_opt
  dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
  show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/c90101e3-75f4-41ba-a13e-ece7cb4df592)

**counter_opt2.v**

``` v
module counter_opt (input clk , input reset , output q);
reg [2:0] count;
assign q = (count[2:0] == 3'b100);

always @(posedge clk ,posedge reset)
begin
	if(reset)
		count <= 3'b000;
	else
		count <= count + 1;
end

endmodule
```

**Synthesis**
```
  read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  
  read_verilog counter_opt2.v
  synth -top counter_opt
  dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
  abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
  show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/8096d608-131b-4272-a673-b0eebb93e5ac)

</details>

<details>
  <summary> Day 4 - GLS and Synthesis-Simulation Mismatch </summary>
  <br>

**ternary_operator_mux.v**
	
**Simulation**
```
iverilog ternary_operator_mux.v tb_ternary_operator_mux.v
./a.out
gtkwave tb_ternary_operator_mux.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/7516d133-8a19-48ec-9740-d67cfe48e596)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/0aad42ac-f378-4717-8c7a-d3bb332679d5)



**Synthesis**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog ternary_operator_mux.v
synth -top ternary_operator_mux
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
write_verilog -noattr ternary_operator_mux_netlist.v
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/ee50d31c-fa9c-47ba-b9f9-b1d1d2ace173)


**GLS**
To to Gate level simulation, Invoke iverilog with verilog modules
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v ternary_operator_mux_netlist.v tb_ternary_operator_mux.v
./a.out
gtkwave tb_ternary_operator_mux.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/0b13a890-6121-4886-ae1a-f1dce195f7dc)
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/9f4044f1-cd0a-4a7a-ba9c-77a795caf0ab)



** bad_mux.v**
**RTL Simulation**
```
iverilog bad_mux.v tb_bad_mux.v
./a.out
gtkwave tb_bad_mux.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/c7486c24-81ee-449b-a086-83b285270711)

![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b2129f2c-526a-46a6-824b-69990e1ad50f)



**Synthesis**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog bad_mux.v
synth -top bad_mux
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
write_verilog -noattr bad_mux_netlist.v
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b9b5bb19-4477-4eda-ae1a-6da5b0f36b12)


**GLS**
To to Gate level simulation, Invoke iverilog with verilog modules
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v bad_mux_netlist.v tb_bad_mux.v
./a.out
gtkwave tb_bad_mux.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/44ff00b6-877b-42f1-9f25-95154806d151)


# Labs on synth-sim mismatch for blocking statement
**blocking_caveat.v**

**RTL Simulation**
```
iverilog blocking_caveat.v tb_blocking_caveat.v
./a.out
gtkwave tb_blocking_caveat.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/548ca8e2-ceb9-49d8-a88e-3fe0c5cd1a23)


**Synthesis**
```
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog blocking_caveat.v
synth -top blocking_caveat
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
write_verilog -noattr blocking_caveat_netlist.v
show
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/b1fb4164-cae7-432c-86c3-0fe9e8040d4a)



**GLS**
To to Gate level simulation, Invoke iverilog with verilog modules
```
iverilog ../my_lib/verilog_model/primitives.v ../my_lib/verilog_model/sky130_fd_sc_hd.v blocking_caveat_netlist.v tb_blocking_caveat.v
./a.out
gtkwave tb_blocking_caveat.vcd
```
![image](https://github.com/dsingla54/pes_asic_class/assets/139515749/cdc905ef-1784-4f54-800e-f9ed7e8f3a30)


