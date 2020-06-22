namespace Solution {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arithmetic;
open Microsoft.Quantum.Bitwise;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Math;

operation Solve (qs : Qubit[], parity : Int) : Unit is Adj+Ctl {
    let n = Length(qs);
    if (n == 1) {
        if (parity == 1) {
            X(qs[0]);
        }
    } else {
        H(qs[0]);
        (ControlledOnInt(0, Solve))(qs[0..0], (qs[1..n-1], parity));
        (ControlledOnInt(1, Solve))(qs[0..0], (qs[1..n-1], 1 - parity));
    }
}
}
