function outw = distfkmw(center, data)

if size(center, 2) > 1
    for k = 1:size(center, 1)
        %out(k, :) = sqrt(sum(((data-ones(size(data, 1), 1)*center(k, :)).^2), 2));
        outw{k} = (data-ones(size(data, 1), 1)*center(k, :)).^2;
    end
else	% 1-D data
    for k = 1:size(center, 1)
        outw{k} = abs(center(k)-data)';
    end
end
end








