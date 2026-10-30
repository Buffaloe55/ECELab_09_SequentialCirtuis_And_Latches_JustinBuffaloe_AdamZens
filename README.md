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
Justin Buffaloe and Adam Zens
## Summary
In this lab, we learned about the D-latch, a basic building block of sequential circuits. A D-latch follows its input while enable is on and remembers the last value when enable is off. This allows us to store data for later use. We built a single-bit latch and then a memory system containing four bytes, each holding eight bits. We used demultiplexers to route data and the store signal to the selected byte, and a multiplexer to display its stored value. The center button enables writing, and two address switches select which byte we view or change.
## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
A structural latch uses feedback loops, where gate outputs connect back to gate inputs. Although this can simulate correctly, Vivado can flag these connections as combinational loops and prevent implementation. Behavioral Verilog lets us describe the latch’s storage behavior so Vivado can recognize the appropriate hardware. 

### What is the meaning of always @(*) in a sensitivity block?
It means the block runs whenever any signal read inside it changes. The asterisk automatically includes those signals instead of requiring us to list them individually. We used this in our multiplexers and demultiplexers so their outputs update when the data or selection changes.

### What importance is memory to digital circuits?
Memory allows digital circuits to keep information even after their inputs change. Without memory, circuits could only respond to their current inputs and could not remember previous values or events. Memory makes it possible to store data, track a circuit’s state, and reuse information later.
