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
    mutable rv = -1;
    using (qs = Qubit[2]) {
        X(qs[1]);
        unitary(qs);
        let r1 = ResultArrayAsInt(MultiM(qs));
        if (r1 == 3) {
            set rv = 2;
        } elif (r1 == 1) {
            set rv = 3;
        } else {
            SWAP(qs[0], qs[1]);
            unitary(qs);
            let r2 = ResultArrayAsInt(MultiM(qs));
            if (r2 == 3) {
                set rv = 1;
            } else {
                set rv = 0;
            }
        }
        ResetAll(qs);
    }
    return rv;
}
}
