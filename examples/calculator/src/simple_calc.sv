// file name: sum_numbers.sv 
import pystim_pkg::*;

module simple_calc();

    typedef pystim_pkg::pystim py;
 
    initial begin
        py_stim_configuration cfg = new();

        // cfg.enable_debug_mode();
        pystim_pkg::initialize_interpreter(cfg);
        begin
            automatic py_object calc_0 = py_module::import_("calc").attr("Calculator").call();
            automatic py_object calc_1 = py_module::import_("calc").attr("Calculator").call();
            automatic py_object res_0 = calc_0.attr("add").call(py::int_(1), py::float_(2.2));
            automatic py_object res_1 = calc_1.attr("subtract").call(py::int_(5), py::int_(1));
            automatic py_object latest_res = calc_0.attr("get_last_result2").call();
      
            assert (res_0.cast_float().get_value() == 3.2) ;
            assert (latest_res.cast_float().get_value() == 3.2)

            latest_res = calc_1.attr("get_last_result").call();
            assert (res_1.cast_int().get_value() == 4);
            assert (latest_res.cast_int().get_value() == 4);
            
        end
        // $display("Result: 1 + 2.2 = %s", res.to_string());
        pystim_pkg::finalize_interpreter();
    end

endmodule