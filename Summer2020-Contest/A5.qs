namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Bitwise;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;

    operation Solve (theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable rv = 0;
        using (q = Qubit()) {
            let goal = PI() * 0.5;
            mutable t = 0.0;
            mutable iter = 10;
            repeat {
                set iter -= 1;
                set t = 0.0;
                repeat {
                    unitary(q);
                    set t += theta;
                } until (t >= goal);
                if (M(q) == One) {
                    set rv = 1;
                }
            } until (iter == 0 or rv == 1);
            Reset(q);
        }
        return rv;
    }
}
