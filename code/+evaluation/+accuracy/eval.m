%  Copyright (c) 2014, Karen Simonyan
%  All rights reserved.
%  This code is made available under the terms of the BSD license (see COPYING file).

function [res, extra] = eval(config, scores, gt)
    
    % predicted labels
    class = 2 * (scores >= config.threshold) - 1;
    
    % class-n accuracy
    res = mean(class == gt) * 100;
    
    extra = [];
end
