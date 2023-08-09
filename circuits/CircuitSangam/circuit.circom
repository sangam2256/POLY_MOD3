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
   component orGate = OR();

// circuit logic

   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notgate.in <== b;
   y <== notgate.out;

   orGate.x <== x;
   orGate.y <== y;
   q <== orGate.out;

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

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = CircuitSangam();
