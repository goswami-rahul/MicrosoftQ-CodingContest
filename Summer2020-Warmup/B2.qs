namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    operation inc (index : Int, register : LittleEndian) : Unit is Adj+Ctl {
        let N = Length(register!);
        if (index < N) {
            if (index == 0) {
                X(register![0]);
            } else {
                (ControlledOnInt(0, X))(register![0..index-1], register![index]);
            }
            inc(index + 1, register);
        }
    }
    operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
        Adjoint inc(0, register);
    }
}
