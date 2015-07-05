function [ score ] = compute_L2_score( feature1, feature2 )
% compute_cosine_score Summary of this function goes here
%   This function is to compute the cosine similarity between two vectors
%    
    score = sum((feature1/norm(feature1) - feature2/norm(feature2)).^2);
    
end

