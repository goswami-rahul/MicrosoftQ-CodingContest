namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
    	mutable rv = 0;
        using (q = Qubit[2]) {
            unitary(q);
            if (MResetZ(q[1]) == Zero) { 
                set rv = 1; 
            }
        }
    	return rv;
    }
}
