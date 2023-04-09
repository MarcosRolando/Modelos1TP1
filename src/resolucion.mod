var C >= 0;
var A >= 0;

maximize Z: 10 * C + 8 * A;

s.t. unAcadaDosC: 2 * A >= C;

s.t. autobombas: 2 * C <= 16;
s.t. helicopteros: A <= 8;
s.t. brigadas: 2 * C + A <= 28;
s.t. drones: C + 2 * A <= 24;

end;
