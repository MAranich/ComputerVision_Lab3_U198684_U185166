%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              LABORATORY #3 
%%%              COMPUTER VISION 2023-2024
%%%              Exemplar-based methods and applications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [patch_list, coordinates] = extract_patches(image, patch_size)
%extract_patches Extracts a list of patches from a given image
%   IN:
%   image - image to extract patches from
%   patch_size - size of the patch [height width]
%   OUT:
%   patch_list - list of N patches in 4D structure:
%       (patch height, patch width, number of color channels, N)
%   coordinates - (N-by-2) matrix with coordinates of patch centers.
%
%   NOTE: patches in patch_list and in coordinates should be in the same
%         order

margin = floor((patch_size - 1) / 2); % assume patch is odd * odd
image_size = size(image); 

if(ndims(image) == 3) % detect if it has color or not
    channels = image_size(3); 
else
    channels = 1; 
end

% preallocate space for results
num_patches = (image_size(1) - patch_size(1) + 1) * (image_size(2) - patch_size(2) + 1); 
patch_list = zeros(patch_size(1), patch_size(2), channels, num_patches); 
coordinates = zeros([num_patches, 2]); 

counter = 0; 
range_x = (margin(1) + 1):(image_size(1) - margin(1)); 
range_y = (margin(2) + 1):(image_size(2) - margin(2)); 

for x = range_x
    for y = range_y
        % [x, y] is the center of the current patch
        % patch_list(:, :, :, counter) = image(_, _, idx)
        counter = counter + 1; 
        patch_list(:, :, :, counter) = image((x - margin(2)):(x + margin(2)), (y - margin(1)):(y + margin(1)), :); 
        coordinates(counter, :) = [x, y]; 

    end
end

fprintf("Number of patches: %d \n\n", counter); 
% for deafult image prints 1764. This is correct (acording to teacher). 
% assert(counter == num_patches)

end






