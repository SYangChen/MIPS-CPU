`timescale 1ns/1ns
module Mux_1bALU( a, b, cin, less, binvert, sel, cout, out, set );

	input		a, b, cin, less, binvert ;
	input[1:0]	sel ;
	output		cout, out, set ;
	wire 		bi, wcout, wout ;
	
	assign bi = b^binvert ;

	FA FA( a, bi, cin, wcout, wout ) ;
	assign set = wout ;
	assign cout = wcout ;
	assign out = ( sel[1] ) ? ( sel[0] ? 1'b0 : wout ) : ( sel[0] ? a|b : a&b ) ;

			   
endmodule