// file name: pow_numbers.sv 

import pystim_pkg::*;


module math_factorial();

    typedef pystim_pkg::pystim py;

    initial begin
        py::initialize_interpreter();

        $display("Result: factorial(4)  = %0d", factorial(4));

        py::finalize_interpreter();
    end

    function int factorial(int x); 
        automatic py_object result_obj;

        result_obj = py_module::import_("math").attr("factorial").call(py::int_(x));

        return result_obj.cast_int().get_value();
    endfunction

endmodule