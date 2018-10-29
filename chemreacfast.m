close all; clear all; clc;
sf = 16; fs = 14;
a = 0.15; b = 0.1; c = 0.1; s = -b -c;
K = [ -a, b, 0; a, s, 0; 0, c, 0];
for n=1:10000
t=0.01*n;
M=expm(K*t);
x(n) = t;
A(n) = M(1,1);
B(n)  = M(2,1);
C(n) = M(3,1);
end
plot(x,A,'-.','LineWidth',2,'Color',[.0,.5,.1])
hold on
plot(x,B,'LineWidth',2,'Color',[.0,.1,.5])
plot(x,C,'--','LineWidth',2,'Color',[.5,0.,.1])
text('Interpreter','latex','String','$[A]$','Position',[5,0.7], ...
    'FontSize',fs,'Color',[.0,.5,.1] )
text('Interpreter','latex','String','$[C]$','Position',[30,0.65], ...
    'FontSize',fs,'Color',[.5,.0,.1] )
text('Interpreter','latex','String','$[B]$','Position',[65,0.08], ...
    'FontSize',fs,'Color',[.0,.1,.5] )
textx=('$ t $');
xlabel(textx,'Interpreter','latex','fontsize',fs)
texty=('concentration');
ylabel(texty,'Interpreter','latex','fontsize',fs)
print -dpdf ~/papers/math/chemfast
print -deps ~/papers/math/chemfast
print -depsc ~/papers/math/chemfastc
print -deps /Users/kevin/papers/math/chemfastbw

