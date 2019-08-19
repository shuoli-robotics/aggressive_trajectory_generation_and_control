cmake_minimum_required (VERSION 2.6)
project (esa_nn)
include_directories(/home/shuo/matlabProject/readBebopLog/esa_simulation/power_bebop_drag_h05_n0100)
include_directories("/usr/include/")

set(HEADERS 
	power_bebop_drag_h05_n0100/esa_simulation.h
	power_bebop_drag_h05_n0100/nn.h
	power_bebop_drag_h05_n0100/nn_params.h
	power_bebop_drag_h05_n0100/pd_gains.h
    )

add_definitions(-D_CRT_SECURE_NO_WARNINGS)
add_library(esa_nn SHARED 
	power_bebop_drag_h05_n0100/nn.c
	power_bebop_drag_h05_n0100/nn_params.c
)

INSTALL(TARGETS esa_nn 
    LIBRARY DESTINATION lib)
INSTALL(FILES ${HEADERS} DESTINATION include/esa_nn)

