namespace Solution {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Arithmetic;
open Microsoft.Quantum.Bitwise;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Math;

operation Solve (qs : Qubit[]) : Unit {
    using (t = Qubit()) {
        repeat {
            ResetAll(qs);
            ApplyToEach(H, qs);
            (Controlled X)(qs, t);
        } until(MResetZ(t) == Zero);
    }
    // DumpMachine();
    return ();
}
}
