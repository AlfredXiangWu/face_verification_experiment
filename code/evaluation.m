% load data
% load('../results/LightenedCNN_A_lfw.mat');      % model A
% load('../results/LightenedCNN_B_lfw.mat');      % model B
load('../results/LightenedCNN_C_lfw.mat');      % model C
load('lfw_pairs.mat');

% pos
for i = 1: length(pos_pair)
    feat1 = features(pos_pair(1, i), :)';
    feat2 = features(pos_pair(2, i), :)';
    pos_scores(i) = distance.compute_cosine_score(feat1, feat2);
%     pos_scores(i) = -distance.compute_L2_score(feat1, feat2);
end
pos_label = ones(1, length(pos_pair));

%neg
for i = 1: length(neg_pair)
    feat1 = features(neg_pair(1, i), :)';
    feat2 = features(neg_pair(2, i), :)';
    neg_scores(i) = distance.compute_cosine_score(feat1, feat2);
%     neg_scores(i) = -distance.compute_L2_score(feat1, feat2);
end
neg_label = -ones(1, length(neg_pair));

scores = [pos_scores, neg_scores];
label = [pos_label neg_label];

% ap
ap = evaluation.evaluate('ap', scores, label);

% roc
roc = evaluation.evaluate('roc', scores, label);


%% output
fprintf('ap:           %f\n', ap.measure);
fprintf('eer:          %f\n', roc.measure);
fprintf('tpr001:       %f\n', roc.extra.tpr001*100);
fprintf('tpr0001:      %f\n', roc.extra.tpr0001*100);
fprintf('tpr00001:     %f\n', roc.extra.tpr00001*100);
fprintf('tpr000001:    %f\n', roc.extra.tpr000001*100);
fprintf('tpr0:         %f\n', roc.extra.tpr0*100);
result = [ap.measure/100 roc.measure/100  roc.extra.tpr001 roc.extra.tpr0001 roc.extra.tpr00001 roc.extra.tpr000001 roc.extra.tpr0];

