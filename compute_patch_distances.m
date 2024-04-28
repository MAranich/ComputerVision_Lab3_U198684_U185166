%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              LABORATORY #3 
%%%              COMPUTER VISION 2023-2024
%%%              Exemplar-based methods and applications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function distances = compute_patch_distances(patch_list, patch, mask, weights)
%compute_patch_distances Computes distances between the given patch and 
%                        all patches in the list of patches
%   IN:
%	patch_list - list of N patches in 4D structure:
%       (patch height, patch width, number of color channels, N)
%   patch - given patch
%   mask - binary mask to be applied in distance computation
%   weights - intra-patch weights
%   OUT:
%   distances - array of size N, containing all patch distances

    % TODO: implement
    num_patches = size(patch_list); 
    distances = zeros([num_patches(4), 1]); % n


    masked_weight = mask .* weights; 
    d_patch = double(patch); 
    for i = 1:num_patches 
        dist = double(patch_list(:, :, :, i)) - d_patch; 
        dist = sum(dist, 3) .^2; 
        dist = dist .* masked_weight; 
        distances(i) = sum(dist, "all"); 
        % recheck this distance function
        
    end

    normalizer = 1 / sum(sum(masked_weight)); 

    distances = normalizer * distances; 


end








