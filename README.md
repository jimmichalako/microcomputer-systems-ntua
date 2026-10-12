# NTUA ECE Microcomputer Systems Course

This repository showcases the laboratory assignments, projects, and coursework I completed during the Microcomputer Systems course at the National Technical University of Athens (NTUA). Through this coursework, I gained hands-on experience in low-level systems programming, developing assembly firmware for the Intel 8085 microprocessor and AVR ATmega328PB microcontroller, configuring hardware interrupts and memory interfaces, and building embedded C routines for microcontroller peripherals.

---

## Laboratory Exercises & Assignments

### Assignment 1: Machine Code Disassembly, LED Scanning & BCD Conversion
*Simulation on the μLAB training platform and techno-economic modeling.*

* **Key Tasks:**
  * **Ex 1 (Machine Code Disassembly):** Disassembled an 8085 machine code sequence loaded at `0800H` to trace program control flow identifying the position of the rightmost set bit (`1`) of an input byte, including an infinite execution loop variant (`ex1-alt.8085`).
  * **Ex 2 (Interactive LED Scanner):** Interfaced dip-switch inputs at port `2000H` with output LEDs at port `3000H` using the μLAB `DELB` delay routine to implement circular bit shifts, bounce-sweep scanning (LSB to MSB and reverse), and pause/resume states.
  * **Ex 3 (Binary to 2-Digit BCD Conversion):** Implemented an unsigned 8-bit binary-to-packed BCD converter using repeated subtraction by 10, displaying tens and units directly on the output LEDs.
  * **Theory (Cost Analysis):** Formulated and compared cost curves across discrete ICs, microcontrollers, FPGAs, and ASICs to find break-even production volume thresholds.
* **Tech Stack:** Intel 8085 Assembly, μLAB Simulator.

### Assignment 2: Memory Operations, Display Decoders & IC Emulation
*Memory space handling, population counting, and matrix keypad decoding.*

* **Key Tasks:**
  * **Ex 1 (Memory Population & Population Count):** Unlocked system memory protection (`IN 10H`), populated values 0–127 starting at `0900H`, calculated the total count of binary `1` bits across all values via rightward carry-flag rotations into `BC`, and filtered values within the range [10H, 60H].
  * **Ex 2 (Retriggerable Room Lighting Timer):** Created a 20-second room-lighting controller responding to push-button toggles on port `2000H` that dynamically refreshes countdown duration upon re-triggering.
  * **Ex 3 (Keypad Scanning & Drivers):** Developed priority-based LED lighting (`ex3-1`), numeric threshold display routines via the monitor routine `KIND` (`ex3-2`), and low-level row/column matrix keypad scanning bypassing monitor routines to drive 7-segment displays via `DCD` and `STDM` (`ex3-3`).
  * **Ex 4 (Combinational IC Emulation):** Read dip-switch inputs to emulate a multi-gate combinatorial logic IC (AND, OR, XOR), outputting results on the four LSB LEDs of port `3000H`.
  * **Theory (Memory Architecture):** Outlined the internal architecture of a 256 × 4-bit SRAM and designed address decoding circuitry for an 8 KB ROM and 4 KB RAM configuration.
* **Tech Stack:** Intel 8085 Assembly, μLAB Simulator, Memory System Design.

### Assignment 3: Interrupt Handling, Macros & Serial Interfacing
*Hardware interrupts, utility macro libraries, and serial nibble acquisition.*

* **Key Tasks:**
  * **Ex 1 (Interrupt-Driven Lighting & Countdown):** Enabled the `RST 6.5` interrupt using `SIM` and `EI` to run a 45-second retriggerable flashing LED sequence while calculating and rendering remaining seconds on 7-segment displays using repeated subtraction.
  * **Ex 2 (Keypad Range Classification):** Processed keypad input via `RST 6.5` against three preset threshold registers ($K_1, K_2, K_3$ in `C, D, E`) to illuminate corresponding quartile indicator LEDs.
  * **Theory:** Implemented 16-bit utility macros (`INR16`, `FILL`, `RHLL`), analyzed stack frame behavior during interrupts, and compared `RST 5.5` interrupt-driven vs. polled 4-bit nibble serial acquisition.
* **Tech Stack:** Intel 8085 Assembly, μLAB Simulator, Interrupt Subsystems.

### Lab 1: AVR ATmega328PB Digital I/O & Assembly Flow
*Low-level register manipulation, Boolean logic functions, and software delay timers.*

* **Key Tasks:**
  * **Ex 1 (Boolean Logic Functions):** Configured PORTB pins as inputs and PORTC pins as outputs, using bitwise instructions to evaluate the logic functions $F_0 = (A \cdot B' + B \cdot D)$ and $F_1 = (A' + C') \cdot (B' + D)$.
  * **Ex 2 (Bidirectional Trolley Automation):** Simulated an automated trolley traversing a track by shifting a single active bit on PORTD between LSB and MSB positions with software delay loops and dwell times at the boundaries.
* **Tech Stack:** AVR Assembly, ATmega328PB, Microchip Studio / MPLAB X.

### Lab 2: AVR External Interrupts in Assembly & Embedded C
*External hardware interrupts, stack context preservation, and C-based ISR routines.*

* **Key Tasks:**
  * **Ex 1 (Assembly External Interrupts):** Configured edge-triggered interrupts on `INT0` (`PD2`) via `EICRA` and `EIMSK`. Implemented manual stack preservation for the Status Register (`SREG`) and working registers inside the ISR (`0x002`) while triggering timed LED responses on PORTB.
  * **Ex 2 (Embedded C Interrupt Service Routine):** Configured rising-edge interrupts on `INT1` (`PD3`) using AVR-GCC libraries (`<avr/io.h>`, `<avr/interrupt.h>`) to handle external triggers, state timing loops, and manual interrupt flag clearing via `EIFR`.
* **Tech Stack:** AVR Assembly, Embedded C (AVR-GCC), ATmega328PB, Interrupt Subsystems.

---

## Technologies Used

* **Languages:** Intel 8085 Assembly, AVR Assembly, Embedded C (AVR-GCC)
* **Architectures:** Intel 8085, Microchip AVR ATmega328PB
* **Tools & Simulators:** μLAB Simulator, Microchip Studio / MPLAB X IDE
* **Core Concepts:** Machine Code Disassembly, Memory-Mapped I/O, Matrix Keypad Scanning, Vectored Interrupts (`RST 6.5`, `RST 5.5`, `INT0`, `INT1`), Status Register Preservation, Address Decoding, Embedded Firmware Design
