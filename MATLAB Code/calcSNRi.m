function SNRi = calcSNRi(orig_im, corr_im, res_im)
% Function takes three arguments: an orginal, corrupted and restored image
% and calculates the SNRi between the corrupted and restored image
% FORMULA: 
%   SNRi = 10log10(var{c(n1,n2) - x(n1,n2)} / var{_x(n1,n2) - x(n1,n2)})

x = var(double(corr_im) - double(orig_im));
y = var(double(orig_im) - double(res_im));
SNRi = log10(x/y);

end
