namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Bitwise;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    operation IncMod3 (reg : Qubit[]) : Unit is Adj+Ctl {
        (ControlledOnInt(0, X))(reg[1..1], reg[0]);
        (ControlledOnInt(0, X))(reg[0..0], reg[1]);
    }

    operation Div3 (inputs : Qubit[], reg : Qubit[]) : Unit is Adj+Ctl {
        SWAP(reg[0], reg[1]);
        Controlled IncMod3(inputs[0..0], reg);
        if (Length(inputs) > 1) {
            Div3(inputs[1...], reg);
        }
    }
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        using (reg = Qubit[2]) {
            Div3(inputs, reg);
            (ControlledOnInt(0, X))(reg, output);
            Adjoint Div3(inputs, reg);
        }
    }
}
