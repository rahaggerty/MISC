function [new_X] = dataprep(raw_X,idx)
% DATAPREP Scales raw data to fold change
[m,n] = size(raw_X);
shift_X = raw_X-min(raw_X,[],1);
u = abs(nanmean(shift_X(idx,:)));
new_X = shift_X ./ repmat(u,m,1);
