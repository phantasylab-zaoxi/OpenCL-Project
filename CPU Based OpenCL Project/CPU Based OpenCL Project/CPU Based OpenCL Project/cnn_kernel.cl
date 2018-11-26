

__kernel void cnn_kernel(__global float * inputs, __global float * outputs, __global float * network, 
	__local float * l_inputs, __local float * l_outputs) { 
	
	int i = get_global_id(0);
	int j = get_global_id(1);
	
	int l_i = get_local_id(0);
	int l_j = get_local_id(1);

	int l_i_size = get_local_size(0);

	l_inputs[l_i + l_j*l_i_size] = inputs[i%l_i_size + j*l_i_size];

	barrier(CLK_LOCAL_MEM_FENCE);

	
}
