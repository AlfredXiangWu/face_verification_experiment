%  Copyright (c) 2014, Karen Simonyan
%  All rights reserved.
%  This code is made available under the terms of the BSD license (see COPYING file).

function [res, extra] = eval(config, scores, gt)

    [~,~,info] = vl_pr(gt, scores);
    
    res = info.auc * 100;
    extra = info;
end
