function [out, outd] = distfkm(center, data, W, q)

out = zeros(size(center, 1), size(data, 1));
outd = zeros(size(center, 1), size(data, 1));

if size(center, 2) > 1
    for k = 1:size(center, 1)
        out(k, :) = sqrt(sum(((data-ones(size(data, 1), 1)*center(k, :)).^2), 2));
        outd(k, :) = sqrt(sum((ones(size(data, 1), 1)*W(k, :).*(data-ones(size(data, 1), 1)*center(k, :)).^2), 2)); %% proposed
%         outd(k, :) = sqrt(sum((ones(size(data, 1), 1)*W(k, :).*(data-ones(size(data, 1), 1)*center(k, :)).^2), 2)); %% SCAD1 and EWKM
%         outd(k, :) = sqrt(sum((ones(size(data, 1), 1)*(W(k, :).^q).*(data-ones(size(data, 1), 1)*center(k, :)).^2), 2)); %% SCAD2
    end
else	% 1-D data
    for k = 1:size(center, 1)
        out(k, :) = abs(center(k)-data)';
    end
end
