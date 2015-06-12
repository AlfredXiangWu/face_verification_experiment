function [ score ] = compute_cosine_score( feature1, feature2 )
% compute_cosine_score Summary of this function goes here
%   This function is to compute the cosine similarity between two vectors
%    
    score = feature1'*feature2/norm(feature1)/norm(feature2);
    
end

