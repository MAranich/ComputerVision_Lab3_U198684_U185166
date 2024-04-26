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
    distances = zeros([num_patches(4)]); % n

    size(weights)
    size(mask)

    masked_weight = mask .* weights
    d_patch = double(patch); 
    for i = 1:num_patches 
        dist = double(patch_list(:, :, :, i)) - d_patch; 

        who
        dist = dist .* masked_weight; % maybe do this after the .^2
        size(sum(dist .^ 2, 3))
        distances(i) = sum(dist .^ 2, 3); 
        
    end

    normalizer = sum(sum(masked_weight)); 

    distances = distances / normalizer; 


end








