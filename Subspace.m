function [lambda, gamma, center, U, W, dist, obj_fcn] = Subspace(data, Nc,Nr, options)

if nargin ~= 2 && nargin ~= 3
	error('Too many or too few input arguments!');
end

data_n = size(data, 1);
in_n = size(data, 2);
fea_m = in_n;
% Change the following to set default options
default_options = [2;	% exponent for the partition matrix U
		100;	% max. number of iteration
		1e-5;	% min. amount of improvement
		1];	% info display during iteration 

if nargin == 2
	options = default_options;
else
	% If "options" is not fully specified, pad it with default values.
	if length(options) < 4
		tmp = default_options;
		tmp(1:length(options)) = options;
		options = tmp;
	end
	% If some entries of "options" are nan's, replace them with defaults.
	nan_index = find(isnan(options)==1);
	options(nan_index) = default_options(nan_index);
	if options(1) <= 1
		error('The exponent should be greater than 1!');
	end
end

expo = options(1);		% Exponent for U
max_iter = options(2);		% Max. iteration
min_impro = options(3);		% Min. improvement
display = options(4);		% Display info or not

obj_fcn = zeros(max_iter, 1);	% Array for objective function

U = initfkmu(Nc, data_n);
V = initfkmu(Nr, fea_m);
W = initfkmw (data,Nr,fea_m);
lambda = 0.07*ones(data_n,1);                          
gamma = 100*ones(Nc,1);
b = max(max(data));
a = min(min(data));
center = a + (b-a) * rand(Nr, Nc);
%center =5*ones(cluster_n, in_n);
% Initial fuzzy partition
% Main loop
for i = 1:max_iter
	[U, W, center, dist, obj_fcn(i)] = Step_Subspace(data, U,V, W, Nr, Nc);
    
   	if display 
		fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj_fcn(i));
	end
	% check termination condition
	if i > 1
		if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, break; end
	end
end

iter_n = i;	% Actual number of iterations 
obj_fcn(iter_n+1:max_iter) = [];
