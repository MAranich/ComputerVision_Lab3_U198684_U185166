%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              LABORATORY #3 
%%%              COMPUTER VISION 2023-2024
%%%              Exemplar-based methods and applications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

% Input
sample_path = 'data/blobs.png'; 
sample = imread(sample_path);
texture_size = [128, 128] * 2;
patch_size = 13; % should be odd (3, 5, 7, etc.)
tolerance = 0.1;

fprintf("Sample path: %s \nPatch size: [%.0f, %.0f] \t\t Texture size: %d \t\t Tolerance %d\n\n", sample_path, patch_size, texture_size(1), texture_size(2), tolerance); 

[texture, copy_map] = synthesize_texture(sample, texture_size, patch_size, tolerance);

% Result
h1 = subplot(2, 2, 1);
imshow(sample);
title('Sample')
h2 = subplot(2, 2, 2);
imshow(texture);
title('Texture')
h3 = subplot(2, 2, 3);
imshow(build_color_map([size(sample,1), size(sample,2)]));
title('Color map')
h4 = subplot(2, 2, 4);
imshow(copy_map);
title('Copy map')
if size(sample,1) < size(texture,1)
    size_y = get(h2, 'YLim');
else
    size_y = get(h1, 'YLim');
end
if size(sample,2) < size(texture,2)
    size_x = get(h2, 'XLim');
else
    size_x = get(h1, 'XLim');
end
set(h1, 'XLim', size_x, 'YLim', size_y);
set(h2, 'XLim', size_x, 'YLim', size_y);
set(h3, 'XLim', size_x, 'YLim', size_y);
set(h4, 'XLim', size_x, 'YLim', size_y);



