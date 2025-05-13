%% BFSK Communication System Simulation 
% Clear workspace and command window
clear; clc; close all;

% BFSK Signal Generation (63kHz for '0', 67kHz for '1')
fs = 192000;              % Sampling frequency (Hz)
Tb = 1e-3;                % Bit duration (1 ms)
N = fs * Tb;              % Samples per bit
t = (0:N-1)/fs;           % Time vector for one bit

f0 = 63000;               % Frequency for bit 0
f1 = 67000;               % Frequency for bit 1

% Example bit sequence
bits = [0 1 0 0 1 1];

% Generate BFSK signal
signal = [];
for bit = bits
    if bit == 0
        s = sin(2*pi*f0*t);
    else
        s = sin(2*pi*f1*t);
    end
    signal = [signal, s];
end

% Time axis for full signal
t_full = (0:length(signal)-1)/fs;

% Plot the BFSK signal
figure;
plot(t_full*1000, signal);  % Convert time to milliseconds
xlabel('Time (ms)');
ylabel('Amplitude');
title('BFSK Signal: 63kHz for 0, 67kHz for 1');
grid on;
