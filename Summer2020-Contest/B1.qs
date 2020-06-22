namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Bitwise;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    operation Inc (reg : Qubit[]) : Unit is Adj+Ctl {
        if (Length(reg) > 1) {
            (Controlled Inc)([reg[0]], reg[1...]);
        }
        X(reg[0]);
    }

    operation CountBits (inputs : Qubit[], reg : Qubit[]) : Unit is Adj+Ctl {
        for (q in inputs) {
            (Controlled Inc)([q], reg);
        }
    }
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let n = Length(inputs);
        using (reg = Qubit[3]) {
            CountBits(inputs, reg);
            (ControlledOnInt(n / 2, X))(reg, output);
            Adjoint CountBits(inputs, reg);
        }

    }
}
