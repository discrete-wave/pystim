// file name: sum_numbers.sv 
import pystim_pkg::*;

module add_numbers();

    typedef pystim_pkg::pystim py;
 
    initial begin
        pystim_pkg::initialize_interpreter();
        begin
            py_module calc = py_module::import_("custom_math");
            py_object res = calc.attr("add").call(py::int_(1), py::float_(2.2));
            assert (res.cast_float().get_value() == 3.2) 
            
            res = calc.attr("subtract").call(py::int_(2), py::int_(3));
            assert (res.cast_int().get_value() == -1) 
        end
        $display("Result: 1 + 2.2 = %f", res.cast_float().get_value());
        pystim_pkg::finalize_interpreter();
    end

endmodule