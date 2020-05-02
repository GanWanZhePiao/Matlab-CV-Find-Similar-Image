function img_diff (img_array_1, img_array_2)
    % Use the SURF local feature detector function to find the 
    % corresponding points between two images that are rotated and scaled 
    % with respect to each other.

    % Read the two images.

    I1 = rgb2gray(img_array_1);
    I2 = rgb2gray(img_array_2);
    % Find the SURF features.

    points1 = detectSURFFeatures(I1);
    points2 = detectSURFFeatures(I2);
    % Extract the features.

    [f1,vpts1] = extractFeatures(I1,points1);
    [f2,vpts2] = extractFeatures(I2,points2);
    % Retrieve the locations of matched points.

    indexPairs = matchFeatures(f1,f2) ;
    matchedPoints1 = vpts1(indexPairs(:,1));
    matchedPoints2 = vpts2(indexPairs(:,2));
    % Display the matching points. The data still includes several 
    % outliers, but you can see the effects of rotation and scaling on the 
    % display of matched features.
    
    figure
    subplot(2,2,1);
    imshow(img_array_1);
    title('Figure 1')

    subplot(2,2,2);
    imshow(img_array_2);
    title('Figure 2')

    subplot(2,2,[3,4]);
    showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
    legend('matched points 1','matched points 2')
    title('Match Points:' + string(matchedPoints1.Count));
end