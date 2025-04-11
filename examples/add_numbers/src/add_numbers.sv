// file name: sum_numbers.sv 
import pystim_pkg::*;

module add_numbers();

    typedef pystim_pkg::pystim py;
 
    initial begin
        py::initialize_interpreter();
        begin
            automatic py_module calc = py_module::import_("custom_math");
            automatic py_object res = calc.attr("add").call(py::int_(1), py::float_(2.2));
            assert (res.cast_float().get_value() == 3.2) 
            $display("Result: 1 + 2.2 = %f", res.cast_float().get_value());

            res = calc.attr("subtract").call(py::int_(2), py::int_(3));
            assert (res.cast_int().get_value() == -1); 
        end
        
        py::finalize_interpreter();
    end

endmodule