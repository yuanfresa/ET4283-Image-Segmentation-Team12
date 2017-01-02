function labelmap = segment_image(filename)
    im = imread(filename);
%     im = rgb2gray(im);
    imshow(im);
    
    % compute gradient map
    angles = [0, 45, 90, 135, 180];
    M = size(im, 1);
    N = size(im, 2);
    K = size(im, 3);
    orientmap = zeros([M, N, K, 5]);
    for idx = 1:numel(angles)
        orientmap(:,:,:,idx) = oriented_grad(im, angles(idx), 3, 2);
    end
    
    % fuse multiple orientations
    gradmap = max(orientmap, [], 4);
    figure;
    imshow(gradmap);

    % find local minimum
    seeds = 0;
    
    % watershed segmentation
    labelmap = gradmap;
end