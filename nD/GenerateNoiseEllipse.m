function [yNoisy] = GenerateNoiseEllipse(a, b, samples, snr)
    y = GenerateEllipse(a, b, samples);
    yNoisy = awgn(y, snr, 'measured');
end