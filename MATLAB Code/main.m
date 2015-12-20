% BY: ABAD HAMEED
% ENGI4559: Digital Signals & Image Processcing
% PROF. R. Khoury
% DATE: October 1, 2015

%%%% PART 1: Applying Filters %%%%

% Display original image
field = imread('fields.png');
colormap(gray);
imagesc(field);
title('Original Image');
%subplot(1,2,1), subimage(field);
imwrite(field, 'origFields.png', 'png');

% Add 10% noise and display image
noise = rand(size(field));
noise(find(noise>0.9)) = 255;
noise(find(noise<255)) = 0;
noise = uint8(noise);
fieldnoise = max(field, noise);
figure;
colormap(gray);
imagesc(fieldnoise);
title('Noise Image');
%subplot(1,2,2), subimage(fieldnoise);

% Add 3x3 Median Filter and display image
% X = medfilt2(fieldnoise, [3 3]); figure; imshow(X);
fieldmed3 = medFilt(fieldnoise, 3);
figure;
colormap(gray);
imagesc(fieldmed3);
title('3x3 Median Noise');

% SNRI Calculation
SNRi_med3 = calcSNRi(field,fieldnoise,fieldmed3);
xlabel(['SNRi: ', num2str(SNRi_med3)]);

% Add 3x3 Mean Filter and display image
fieldmean = meanFilt(fieldnoise, 3);
fieldmean = uint8(fieldmean);
figure;
colormap(gray);
imagesc(fieldmean);
title('3x3 Mean Noise');

% SNRI Calculation
SNRi_mean = calcSNRi(field,fieldnoise,fieldmean);
xlabel(['SNRi: ', num2str(SNRi_mean)]);

% Add 3x3 Minimum Filter and display image
fieldmin = minFilt(fieldnoise, 3);
figure;
colormap(gray);
imagesc(fieldmin);
title('3x3 Minimum Noise');

% SNRI Calculation
SNRi_min = calcSNRi(field,fieldnoise,fieldmin);
xlabel(['SNRi: ', num2str(SNRi_min)]);

% Add 5x5 Median Filter and display image
% Y = medfilt2(fieldnoise, [5 5]); figure; imshow(Y);
fieldmed5 = medFilt(fieldnoise, 5);
figure;
colormap(gray);
imagesc(fieldmed5);
title('5x5 Median Noise');

% SNRI Calculation
SNRi_med5 = calcSNRi(field,fieldnoise,fieldmed5);
xlabel(['SNRi: ', num2str(SNRi_med5)]);

%%%% PART 2: Weighted Filter %%%%

% Add 3x3 Weighted Filter and display image
fieldweight = weightFilt(field);
fieldweight = uint8(fieldweight);
figure;
colormap(gray);
imagesc(fieldweight);
title('3x3 Weighted Image');

% Subtract Filtered image from Original and display
new_im = field - fieldweight;
figure;
colormap(gray);
imagesc(new_im);
title('Subtracted Image');
