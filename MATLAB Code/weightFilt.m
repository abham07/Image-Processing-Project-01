function out_im = weightFilt(im)
% Function takes an image and number and applies the weighted sum filter

I1 = im;
I = zeros(size(im));
I2 = zeros(size(im));

% Filter Masks
%weight = [0 1 0;1 -4 1; 0 1 0];
weight = [1 1 1;1 -8 1; 1 1 1];

% Padarray with zeros
im = padarray(im,[1,1]);
im = double(im);

% Implementation of the Laplacian Filter
for i=1:size(im,1)-2
    for j=1:size(im,2)-2
        I(i,j)=sum(sum(weight.*im(i:i+2,j:j+2)));
    end
end

out_im = I;

end
