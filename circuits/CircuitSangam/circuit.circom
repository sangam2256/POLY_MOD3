pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template CircuitSangam () {  

  // signal inputs

   signal input a;
   signal input b;

// signals from gates

   signal x;
   signal y;

// final signal output

   signal output q;

// component gates used to create custom circuit

   component andGate = AND();
   component notgate = NOT();
   component norGate = NOR();

// circuit logic

   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notgate.in <== b;
   y <== notgate.out;

   norGate.x <== x;
   norGate.y <== y;
   q <== norGate.out;

}
// template for AND
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
// template for NOT
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
// template for NOR
template NOR() {
    signal input x;
    signal input y;
    signal output out;

    out <== x*y + 1 - x - y;

}

component main = CircuitSangam();