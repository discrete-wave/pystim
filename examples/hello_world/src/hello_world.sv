// file name: pow_numbers.sv 

import pystim_pkg::*;

module hello_world();
    typedef pystim py;

    initial begin
        py::initialize_interpreter();
        py::print(py::string_("Hello world."));
        py::finalize_interpreter();
    end
endmodule