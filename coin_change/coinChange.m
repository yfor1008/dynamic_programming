close all; clear; clc;

N = 9; % 总金额
coins = [2, 3, 5]; % 硬币的面值(种类), k=3, v1=1, v2=2, v3=5
k = length(coins);
dp = ones(N+1, 1) * (N+1); % dp(i) 表示金额为 i 时, 至少需要的硬币数量为 dp(i), i 从0开始, dp(0)=0

dp(0+1) = 0; % matlab数组下标从1开始
for i = 0:N
    for c = 1:k
        coin = coins(c);
        if (i - coin < 0)
            % 无解, 跳过
            continue;
        end
        dp(i+1) = min(dp(i+1), dp(i-coin+1)+1);
    end
end
