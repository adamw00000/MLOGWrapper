%module CEC2020Benchmark
%include carrays.i
%array_functions( double, double_array )
%array_functions( int, int_array )

%{
#include "main.h"
%}
%include "main.h"