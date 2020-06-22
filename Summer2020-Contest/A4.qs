namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Bitwise;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    operation Solve (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        mutable rv = 0;
        let ang = PI() * 2.0;
        using (q = Qubit[2]) {
            H(q[0]);
            Controlled unitary(q[0..0], (-ang, q[1]));
            if (MResetX(q[0]) == Zero) {
                set rv = 1;
            }
            ResetAll(q);
        }
        return rv;
    }
}
