function out_im = weightFilt(im, num)
% Function takes an image and number and applied the weighted sum filter

weight = [0,1,0;1,-4,1;0,1,0];
fieldweight = blkproc(double(im),size(weight),@(x) x.*weight);

im_pad = padarray(fieldweight, [floor(num/2) floor(num/2)]);
im_col = im2col(im_pad, [num num], 'sliding');

im_sum = sum(im_col);

out_im = col2im(im_sum, [num num], size(im_pad), 'sliding');

end
