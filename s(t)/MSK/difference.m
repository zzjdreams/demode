function [data_diff] = difference(data) 
%差分编码
%************************************************************************** 
%data 输入信号
%data_diff 差分编码后信号
%************************************************************************** 
%-------------------------------------------------------------------------- 
data_diff = zeros(1,length(data)); 
data_diff(1) = 1 * data(1); %1为差分编码的初始参考值
for i = 2:length(data) 
 data_diff(i) = data_diff(i-1) * data(i) ;
end
%*************************************************************************

% 通信中的差分编码，差分编码输入序列{an}，差分编码输出序列{bn}，二者都为{0、1}序列，
% 则差分编码输出结果为bn=an异或bn-1，并不是bn=an异或an-1（即所谓的：对数字数据流，
% 除第一个元素外，将其中各元素都表示为各该元素与其前一元素的差的编码。这么定义是不准确的。）。
% 前者多用在2DPSK调制，后者多用在MSK调制预编码。同时后者是码反变换器的数学表达式，即用来解差分编码用的。