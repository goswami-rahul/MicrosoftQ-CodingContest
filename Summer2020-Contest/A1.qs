namespace Solution {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arithmetic;
open Microsoft.Quantum.Bitwise;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Math;

operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
    mutable rv = 1;
    using (qs = Qubit[2]) {
        X(qs[0]);
        unitary(qs);
        if (M(qs[1]) == One) {
            set rv = 0;
        }
        ResetAll(qs);
    }
    return rv;
}
}
