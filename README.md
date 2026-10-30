# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Jenna Light
Adrian Leven

## Summary
In this lab, we built upon last week's multiplexer and demultiplexer implementations to create a routing tool that also maintained state.
## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Latches include inputs that depend on the outputs of the other NAND blocks. This means we need to create a sequenced implementation that maintains state.
### What is the meaning of always @(*) in a sensitivity block?
always statements require a list of inputs that will be read in the functional block that comes after the sensitivity block. The "*" tells the compiler to include all inputs.
### What importance is memory to digital circuits?
Memory is required for any circuit that needs to maintain state even as inputs change. If we did not use memory, every circuit would require continuous input and could not maintain state as inputs change. Registers and various types of storage all depend on memory to properly keep their state despite changes that occur upstream of the circuit.
