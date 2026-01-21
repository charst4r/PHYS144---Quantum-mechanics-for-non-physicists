#import "@preview/physica:0.9.6": *

= Programming Languages for Quantum Computation

== Introduction
- CS student interested in programming languages, their syntax and how theyre compiled => wanted to link this interest to quantum 
- wanted to see how quantum programming languages manage to implement the physical constraints we saw in class
- through the Silq language (developped at ETH + statically typed), Q\# 
- we focus on ...

== Why do we need special languages for quantum computing?
- classical:
	- bits
	- ops executed sequentially or in parallel with boolean logic gates
	- predictable output
	- struggle for massive computations

- quantum:
	- qubits
	- quantum algos' operations don't map great to classical instructions (superposition, entanglement, gates, measurements, collapse)
	
== Representation of Quantum Programming Constructs
- qubits treated as a special data type, initialized to $ket(0)$ or $ket(1)$ => prevents programmers from treateing qubits like normal variables, enforces that they must be in a known state
- built-in functions for gates, can call `H(q)` directly
- built-in measurement functions that collapse the state and return a special result type representing a measurement instead of classical integers
- entanglement created via (built-in) gates, can be represented through state vectors
- still use classical code: loops, if-else statements etc
- separation of operations (can change qubits) and functions (cant change qubits)

=> embedded constraints: designed to make it impossible or difficult to write programs that violate quantum mechanics laws using type systems, scoping rules, operational semantics. invalid programs fail at compile time (not during execution)

- no-cloning: prevents qubit leaks + ensures no arbitrary state is thrown away (breaks reversibility)	// todo what is reversibility
	- linear type systems: qubit variable can be used exactly once, cannot be duplicated, cannot be forgotten about (not used)
	- qubit scoping: qubits allocated within a scope and must be returned to a known state (usually $ket(0)$) before the scope ends 
- collapse: 
	- measurement: not a passive 'read' of a variable. irreversible op with specific type signature.
	- control flow separation: classical control flow is used only on calssical integers (outcome of measurements). control flow is not implemented using quantum operations on superposed states
- entanglement: entagnlement achieved though applying operations ot qubit, not declared directly
- reversibility/unitarity:
	- gate-based: quantum logic is expressed as a sequence of reverrsible gates. standard lib only includes these unitary op
	- irreversible ops are special: non-unitary ops (reset, measure) have special types that restrict how they can be used

=> correctness by construction !! !! illegal states are unrepresentable in the languages. languages represent hardware reality (init a qubit actually inits a physical qubit). built for ease of compilation.

- classical: copyable, persistent data in memory
- quantum: unique, non-copyable physical ressource

== How Quantum Programs are executed
- languages compile to quantum circuits
- then optimizations (gate merging, cancellations)
- transpilation for specific hardware (qubit topology, gate set)
- execution on simulator/real quantum processor

== Challenges: very imperfect QPUs
- no-cloning theorem: cant copy qubits => limited debugging (cant reproduce pb easily to diagnose)
- decoherence (losing info): qubits lose coherence quickly (microseconds to seconds) => limits circuit depth // todo research this
- nisq era: qubit computers are error prone (0.1% to 1% per gate) => have to work around it
- limited qubit 
- moving info between distant qubits require adding swap gates => more chance for errors

more QPU info:
- low connectivity: fixed, sparse connection map. direct interactions only possible between connected qubits
- each QPU has different native gate set (like instruction set)
- optimization goal: minimize circuit depth and two qubit gates 

== Example: Create a Bell pair ($1/sqrt(2) (ket(00) + ket(11))$)

== More advanced example: ??

== How do Quantum Programming Languages deal with it
- errors dealt with by running the program multiple times and using probabilities
- high level circuits but still access to lower level controls (pulse schedules for custom error suppression)
- 


== Desirable Features of Quantum Languages
- quantum/classic collaboration: for actual appllications, need to be able to use quantum operations and classical control flow
- purity management, type systems: distinction between pure and mixed qstates. code clarity, error prevention, enforce physical constraints
- intuitive syntax: natural language like, fluent programming style. reduces learning curve
- data types and structs: diverse (classical: ints, flaoting points, strings and quantum: qubits, superposition) data types. arrays, maps to organize quantum and classical data. 
- arithmetic and quantum ops: thats just the basics lol. abstract away low level circuits and allow devs to focus on algos.
// todo finish: https://arxiv.org/html/2503.13084v1#S2