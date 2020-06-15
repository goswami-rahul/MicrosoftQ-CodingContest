namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Unit {
        using (t = Qubit()) {
            repeat {
                ResetAll(qs);
                ApplyToEach(H, qs);
                (ControlledOnInt(0, X))(qs, t);
            } until(MResetZ(t) == Zero);
        }
        return ();
    }
}
