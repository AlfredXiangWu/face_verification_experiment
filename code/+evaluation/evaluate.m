%  Copyright (c) 2014, Karen Simonyan
%  All rights reserved.
%  This code is made available under the terms of the BSD license (see COPYING file).

function result = evaluate(config, scores, gt)

    scores = reshape(scores, 1, []);

    switch config     
        case 'ap' 
            [res, extra] = evaluation.ap.eval(config, scores, gt);
        case 'roc'   
            [res, extra] = evaluation.roc.eval(config, scores, gt);
        case 'accuracy'    
            [res, extra] = evaluation.accuracy.eval(config, scores, gt); 
    end
        
        % measure name
        result.meas_name = config;
        
        % measure value (a scalar)
        result.measure = res;
        
        % extra data in a struct (e.g. optimal thresh), or empty
        result.extra = extra;

end
