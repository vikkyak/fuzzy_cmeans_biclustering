function W = initfkmw(data, cluster_n,fea_m)
n = size(data,2);
%W =0.1*ones(cluster_n,fea_m); % 0.1 for iris dataset
W =1/n*rand(cluster_n,fea_m); % 0.1 for iris dataset
col_sum = sum(W);
W = W./col_sum(ones(cluster_n, 1), :);