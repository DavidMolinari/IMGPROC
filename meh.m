function y = meh(x, ec, m)
  y = (1 / (sqrt(2*pi*ec))) * exp((-(x-m)^2) / (2*(ec^2)));
endfunction
