namespace Solution {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arithmetic;
open Microsoft.Quantum.Bitwise;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Math;

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
    mutable rv = 0;
    using (q = Qubit()) {
        unitary(q);
        X(q);
        unitary(q);
        if (MResetZ(q) == One) {
            set rv = 1;
        }
    }
    return rv;
}
}
