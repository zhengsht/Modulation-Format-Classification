function dataset = dataset_generate(format,snr,quantity)
% This function is used to generate a dataset struct including 10000 complex signals, 
% signals'format and snr.
%  dataset - a dataset include 10000 complex signals and other infos.
%   format - modulation format of signal, '2PSK' and 'random' and so on
%      snr - signal noise ratio with unit of dB
% quantity - quantity of datasets
dataset=[];
for j = 1:quantity
    if strcmp(format,'2PSK')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(1,snr_signle,'qam');
        tmp.signal = signal;
        tmp.format = '2PSK';
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    elseif strcmp(format,'8PSK')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(3,snr_signle,'psk');
        tmp.signal = signal;
        tmp.format = '8PSK';
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    elseif strcmp(format,'QPSK')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(2,snr_signle,'qam');
        tmp.signal = signal;
        tmp.format = 'QPSK';
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    elseif strcmp(format,'8QAM')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(3,snr_signle,'qam');
        tmp.signal = signal;
        tmp.format = '8QAM';
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    elseif strcmp(format,'16QAM')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(4,snr_signle,'qam');
        tmp.signal = signal;
        tmp.format = '16QAM';
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    elseif strcmp(format,'32QAM')
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        signal = signal_generation(5,snr_signle,'qam');
        tmp.signal = signal;
        tmp.format = '32QAM';
        tmp.snr = snr_signle;
        dataset = [dataset tmp]; 
    else % �������
        if strcmp(snr,'random')
            snr_signle = 50*rand();
        else
            snr_signle = snr;   
        end
        bitPerSymbol=round(5*rand())+1;
        if bitPerSymbol==6
            signal=signal_generation(3,snr_signle,'psk');
        else
            signal = signal_generation(bitPerSymbol,snr_signle,'qam');
        end
        tmp.signal = signal;
        switch bitPerSymbol
            case 1
                tmp.format = '2PSK';
            case 2
                tmp.format = 'QPSK';
            case 3
                tmp.format = '8QAM';
            case 4
                tmp.format = '16QAM';
            case 5
                tmp.format = '32QAM';
            case 6
                tmp.format = '8PSK';
        end
        tmp.snr = snr_signle;
        dataset = [dataset tmp];
    end
end


