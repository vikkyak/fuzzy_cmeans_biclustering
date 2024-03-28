function [tmpu,tmpW, center, dist, obj_fcn] = Step_Subspace(data, U, V, W, Nr, Nc)
%%
data_n = size(data, 1);
alpha = 2.5*ones(data_n,1);
in_n = size(data, 2);
delta = 2.5*ones(in_n ,1);

lambda = 10000;             
gamma = 0.05;

mf = U;       % MF matrix after exponential modification
center = mf*data./(sum(mf,2)*ones(1,size(data,2))); %new center
dist = distfkm(center, data, W);       % fill the distance matrix
outw = distfkmw(center, data);
obj_fcn = sum(sum((dist.^2).*mf)) + lambda* sum(sum(mf.*log(mf))) + gamma* sum(sum(W.*log(W)));...
% - sum(alpha.* (sum(mf)'-ones(data_n,1))) - sum(delta.* (sum(W)'-ones(in_n,1))) ;  % objective function
 
%% weight update
  
for j= 1: Nc
    
    temp = cell2mat(outw(j));
    for l=1:in_n
        tmpW(j,l) =exp( - (U(j,:)*temp(:,l)/lambda))/ sum(exp((- U(j,:)*temp)./lambda));
    end
    
end
    

       %% mf update
       
for j= 1: Nc
   temp = outw{j};
   den(j,:) = exp((-tmpW(j,:)*temp'/gamma));
end

den_sum = sum(den,1);

for j= 1: Nc
   temp = outw{j};
   for i=1:data_n
       tmpu(j,i) =exp(- (tmpW(j,:)*temp(i,:)'/gamma))/den_sum(i);
   end
end

 
end
